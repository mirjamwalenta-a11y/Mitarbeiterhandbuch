-- Abfrage für .github/workflows/rls-audit.yml (nur Systemkataloge, keine Daten).
-- Läuft mit dem Prüf-Konto rls_audit, das keine Tabellen lesen darf.

-- 1) Tabellen im Schema public ohne Row Level Security
select 'OHNE_RLS' as art, c.relname as tabelle, '' as detail
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relkind in ('r', 'p')
  and not c.relrowsecurity
union all
-- 2) Policies, die anon (oder alle) ohne Bedingung durchlassen
select 'ANON_OFFEN', p.tablename, p.policyname || ' (' || p.cmd || ')'
from pg_policies p
where p.schemaname = 'public'
  and p.roles && array['anon', 'public']::name[]
  and coalesce(p.qual, 'true') = 'true'
  and coalesce(p.with_check, 'true') = 'true'
  -- Bewusst offen und geprüft (sonst käme jede Woche derselbe Hinweis).
  -- Ausnahme gilt nur für genau diese Tabelle + Policy-Name; eine neue oder
  -- umbenannte Policy wird wieder gemeldet. Tabellen ohne RLS nie ausnehmen.
  and (p.tablename, p.policyname) not in (
    -- Login-Auswahl der Abwesenheiten-App, zeigt nur id/name/role.
    ('abw_team', 'abw_team_anon_login_view'),
    -- Innungs-App (geprüft 2026-10-12): Trainerinnen melden sich mit Kennung+PIN
    -- ohne Supabase-Konto an und lesen deshalb ohne Login. Inhalt: Seminartermine,
    -- Bereiche, Leitlinien, Zuordnungen, Interessen (Seminar-ID + Trainerin-ID).
    -- innungs_trainerinnen: Zeilen lesbar, die Spalte pin_hash ist per Spaltenrecht
    -- gesperrt, Login über innung_login() (innungsapp 20261012_innung_pin_serverseitig.sql).
    ('innungs_bereiche',           'Team liest'),
    ('innungs_interessierte',      'Team liest'),
    ('innungs_leitlinien',         'Team liest'),
    ('innungs_seminare',           'Team liest'),
    ('innungs_trainerin_bereiche', 'Team liest'),
    ('innungs_trainerinnen',       'Team liest'),
    -- Wochenquiz-Link für Lehrlinge ohne Login (lernquiz schnuppertag.html
    -- ?modus=lehrling-quiz): Fragen lesen, Ergebnis einreichen (geprüft 2026-10-12).
    ('probezeit_quiz',             'Anon kann Quiz einreichen'),
    ('probezeit_quiz_fragen',      'Anon liest Fragen')
  )
order by 1, 2;

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
order by 1, 2;

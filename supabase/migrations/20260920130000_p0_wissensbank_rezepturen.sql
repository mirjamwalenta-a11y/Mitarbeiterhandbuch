-- ════════════════════════════════════════════════════════════
--  Fachnachschlagewerk Farbe/Rezepturen — neue Tabelle
--  wissensbank_rezepturen, RLS von Anfang an aktiv (siehe
--  CLAUDE.md Regel 1: jede neue Tabelle bekommt RLS, bevor sie
--  mit einer Live-App verbunden wird).
--
--  Gleicher Freigabe-Workflow wie wissensbank_artikel: Mitarbeiter:
--  innen reichen ein (status 'eingereicht'), nur die Inhaberin gibt
--  frei (status 'freigegeben') oder legt direkt freigegeben an.
--  Bewusst keine eigene "Coloristin"-Rolle — dieselbe Rollen-
--  prüfung wie überall sonst in diesem Projekt.
--
--  Sicher mehrfach ausführbar (idempotent).
-- ════════════════════════════════════════════════════════════

create table if not exists public.wissensbank_rezepturen (
  id uuid primary key default gen_random_uuid(),
  titel text not null,
  anwendungsbereich text not null check (anwendungsbereich in
    ('Blondierung', 'Tönung', 'Farbkorrektur', 'Dauerwelle', 'Pflege', 'Sonstiges')),
  produkt_marke text,
  mischverhaeltnis text,
  einwirkzeit text,
  anleitung text not null,
  warnhinweise text,
  status text not null default 'eingereicht' check (status in ('entwurf', 'eingereicht', 'freigegeben')),
  ersteller_email text not null,
  ersteller_name text,
  freigegeben_von text,
  freigegeben_am timestamptz,
  erstellt_am timestamptz not null default now()
);

alter table public.wissensbank_rezepturen enable row level security;

-- Rollen-Hilfsfunktion idempotent sicherstellen (unabhängig davon,
-- ob die Sicherheits-Migration aus dem Team-Repo schon eingespielt
-- ist) — Live-Check vom 20.9. zeigte, dass bestehende Policies im
-- Projekt dieselbe Prüfung bisher inline per EXISTS machen, nicht
-- über eine gemeinsame Funktion.
create or replace function public.teamapp_ist_inhaberin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.teamapp_persons t
    where t.email = auth.email() and t.rolle = 'inhaberin' and t.aktiv = true
  )
$$;

grant execute on function public.teamapp_ist_inhaberin() to authenticated;

drop policy if exists "rezepturen_select" on public.wissensbank_rezepturen;
create policy "rezepturen_select" on public.wissensbank_rezepturen
  for select to authenticated
  using (
    status = 'freigegeben'
    or ersteller_email = auth.email()
    or public.teamapp_ist_inhaberin()
  );

-- Anlegen: nur im eigenen Namen. Mitarbeiter:innen dürfen nur mit
-- status 'entwurf'/'eingereicht' anlegen (kein Selbst-Freigeben über
-- einen direkten REST-Call); die Inhaberin darf direkt mit status
-- 'freigegeben' anlegen.
drop policy if exists "rezepturen_insert" on public.wissensbank_rezepturen;
create policy "rezepturen_insert" on public.wissensbank_rezepturen
  for insert to authenticated
  with check (
    ersteller_email = auth.email()
    and (
      status in ('entwurf', 'eingereicht')
      or (status = 'freigegeben' and public.teamapp_ist_inhaberin())
    )
  );

-- Ändern (insb. Freigeben/Ablehnen im Review): eigene, noch nicht
-- freigegebene Einträge, oder Inhaberin.
drop policy if exists "rezepturen_update" on public.wissensbank_rezepturen;
create policy "rezepturen_update" on public.wissensbank_rezepturen
  for update to authenticated
  using (
    (ersteller_email = auth.email() and status <> 'freigegeben')
    or public.teamapp_ist_inhaberin()
  )
  with check (
    (ersteller_email = auth.email() and status in ('entwurf', 'eingereicht'))
    or public.teamapp_ist_inhaberin()
  );

-- Löschen: eigene, noch nicht freigegebene Einträge, oder Inhaberin.
drop policy if exists "rezepturen_delete" on public.wissensbank_rezepturen;
create policy "rezepturen_delete" on public.wissensbank_rezepturen
  for delete to authenticated
  using (
    (ersteller_email = auth.email() and status <> 'freigegeben')
    or public.teamapp_ist_inhaberin()
  );

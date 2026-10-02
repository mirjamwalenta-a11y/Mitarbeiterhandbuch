-- ════════════════════════════════════════════════════════════
--  Fachwissen — Kategorie "Umformung & Glättung"
--
--  Eigene Kategorie für Glättungs-/Umformungsprodukte, die bisher
--  mangels passender Kategorie unter "Dauerwelle" lagen.
--  X-Tenso Moisturist (L'Oréal Professionnel) wird dorthin
--  verschoben; Dauerwellen (Dulcia) bleiben unter "Dauerwelle".
--
--  Keine neue Tabelle, keine Änderung an RLS/Policies.
--  Sicher mehrfach ausführbar (idempotent).
-- ════════════════════════════════════════════════════════════

alter table public.wissensbank_rezepturen
  drop constraint if exists wissensbank_rezepturen_anwendungsbereich_check;

alter table public.wissensbank_rezepturen
  add constraint wissensbank_rezepturen_anwendungsbereich_check
  check (anwendungsbereich in
    ('Blondierung', 'Coloration', 'Tönung', 'Farbkorrektur', 'Dauerwelle',
     'Umformung & Glättung', 'Pflege', 'Styling', 'Sonstiges'));

update public.wissensbank_rezepturen
  set anwendungsbereich = 'Umformung & Glättung'
  where titel = 'X-Tenso Moisturist'
    and produkt_marke = 'L''Oréal Professionnel'
    and anwendungsbereich = 'Dauerwelle';

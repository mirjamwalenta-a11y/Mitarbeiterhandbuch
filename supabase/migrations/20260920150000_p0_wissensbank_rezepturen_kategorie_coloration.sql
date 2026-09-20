-- ════════════════════════════════════════════════════════════
--  Fachwissen Farbe — Kategorie "Coloration" ergänzt
--
--  Permanente/demi-permanente Coloration (z. B. Majirel, iNOA,
--  Dia color) passte bisher in keine der bestehenden Kategorien
--  (Blondierung, Tönung, Farbkorrektur, Dauerwelle, Pflege,
--  Sonstiges) wirklich. "Coloration" ergänzt die Liste, bestehende
--  Einträge bleiben unverändert.
--
--  Sicher mehrfach ausführbar (idempotent).
-- ════════════════════════════════════════════════════════════

alter table public.wissensbank_rezepturen
  drop constraint if exists wissensbank_rezepturen_anwendungsbereich_check;

alter table public.wissensbank_rezepturen
  add constraint wissensbank_rezepturen_anwendungsbereich_check
  check (anwendungsbereich in
    ('Blondierung', 'Coloration', 'Tönung', 'Farbkorrektur', 'Dauerwelle', 'Pflege', 'Sonstiges'));

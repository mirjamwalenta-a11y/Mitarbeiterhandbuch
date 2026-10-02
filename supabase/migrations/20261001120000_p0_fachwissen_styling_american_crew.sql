-- ════════════════════════════════════════════════════════════
--  Fachwissen — Kategorie "Styling" + American-Crew-Sortiment
--
--  1. Neue Kategorie "Styling" (eigener Filter-Button in der App).
--  2. Produkte aus dem American-Crew-Katalog (Seiten 94–99) als
--     freigegebene Einträge:
--       - Styling-Produkte          → Styling
--       - Shampoo/Conditioner/Body,
--         Rasur & Bartpflege        → Pflege
--       - Precision Blend           → Coloration
--
--  Keine neue Tabelle, keine Änderung an RLS/Policies — die
--  bestehenden Policies auf wissensbank_rezepturen gelten weiter.
--  Als Ersteller wird die aktive Inhaberin aus teamapp_persons
--  verwendet (keine E-Mail-Adresse hartcodiert, CLAUDE.md Regel 2).
--
--  Sicher mehrfach ausführbar (idempotent): Einträge werden nur
--  angelegt, wenn es Titel + Marke noch nicht gibt.
-- ════════════════════════════════════════════════════════════

alter table public.wissensbank_rezepturen
  drop constraint if exists wissensbank_rezepturen_anwendungsbereich_check;

alter table public.wissensbank_rezepturen
  add constraint wissensbank_rezepturen_anwendungsbereich_check
  -- "Umformung & Glättung" steht schon hier mit drin, damit das Skript
  -- auch nach 20261001140000 (X-Tenso dort einsortiert) erneut laufen kann.
  check (anwendungsbereich in
    ('Blondierung', 'Coloration', 'Tönung', 'Farbkorrektur', 'Dauerwelle',
     'Umformung & Glättung', 'Pflege', 'Styling', 'Sonstiges'));

insert into public.wissensbank_rezepturen
  (titel, anwendungsbereich, produkt_marke, mischverhaeltnis, anleitung, warnhinweise,
   status, ersteller_email, ersteller_name, freigegeben_von, freigegeben_am)
select
  v.titel, v.bereich, 'American Crew', v.misch, v.anleitung, v.warn,
  'freigegeben', coalesce(i.email, 'katalog-import'), 'American Crew Katalog',
  coalesce(i.email, 'katalog-import'), now()
from (values
  -- ── Pflege: Haare & Kopfhaut (S. 94–95) ───────────────────
  ('Daily Deep Moisturizing Shampoo', 'Pflege', null,
   'Feuchtigkeitsspendendes Shampoo. Reinigt und pflegt mit optimiertem integriertem Conditioning-System und Vitamin B5 – für gesund aussehendes Haar. Vegane Rezeptur mit 84 % natürlich gewonnenen Inhaltsstoffen. Nachhaltige Verpackung, frei von Silikonen.
Inhalt: 250 ml | 1000 ml', null),
  ('Anti-Dandruff + Sebum Control Shampoo', 'Pflege', null,
   'Die Lösung bei Kopfhautproblemen: Anti-Schuppen-Shampoo mit Regulierung der Talgproduktion.
Inhalt: 250 ml', null),
  ('Daily Cleansing Shampoo', 'Pflege', null,
   'Tägliches Shampoo. Reinigt sanft alle Haartypen.
Inhalt: 250 ml | 1000 ml', null),
  ('Detox Shampoo', 'Pflege', null,
   'Shampoo mit Doppelwirkung: gründliche, entgiftende Reinigung des Haares und sanftes Peeling der Kopfhaut mit Kokosschalenperlen und Manicouagan-Ton. Das Haar wird geschmeidig, die Kopfhaut erfrischt. Vegane Rezeptur mit 80 % natürlichen Inhaltsstoffen. Nachhaltige Verpackung, frei von Silikonen.
Inhalt: 250 ml | 1000 ml', 'Nicht zur täglichen Anwendung geeignet.'),
  ('Daily Moisturizing Conditioner', 'Pflege', null,
   'Erfrischung für Haar und Kopfhaut. Conditioner mit Dreifachwirkung: spendet nach jeder Haarwäsche Feuchtigkeit, stärkt das Haar und beugt Haarbruch vor, schützt vor Trockenheit. Vegane Rezeptur mit 91 % natürlich gewonnenen Inhaltsstoffen. Nachhaltige Verpackung, frei von Silikonen.
Inhalt: 250 ml | 1000 ml', null),
  ('Boost Pre-Styling Cleanser', 'Pflege', null,
   'Shampoo. Verleiht Ansatzvolumen und Fülle.
Inhalt: 250 ml', null),
  ('Fiber Pre-Styling Cleanser', 'Pflege', null,
   'Shampoo. Verleiht spürbare Textur und stärkt das Haar.
Inhalt: 250 ml', null),
  ('Forming Pre-Styling Cleanser', 'Pflege', null,
   'Shampoo. Definiert und verbessert Wellen und Locken.
Inhalt: 250 ml', null),
  ('24H Deodorant Body Wash', 'Pflege', null,
   'Duschgel mit Teebaumöl für einen lang anhaltenden Schutz vor Körpergeruch.
Inhalt: 450 ml', null),
  ('3-in-1 Classic', 'Pflege', null,
   'Shampoo, Conditioner und Body Wash – All-in-One-Shampoo. Classic-Originalduft Zitrone und Salbei.
Inhalt: 250 ml', null),
  ('3-in-1 Chamomile + Pine', 'Pflege', null,
   'Shampoo, Conditioner und Body Wash – All-in-One-Shampoo. Entspannender Duft Kamille und Kiefer.
Inhalt: 250 ml', null),
  ('3-in-1 Ginger + Tea', 'Pflege', null,
   'Shampoo, Conditioner und Body Wash – All-in-One-Shampoo. Belebender Duft Ingwer und Tee.
Inhalt: 250 ml', null),
  ('3-in-1 Tea Tree', 'Pflege', null,
   'Shampoo, Conditioner und Body Wash – All-in-One-Shampoo. Erfrischender Duft Teebaum.
Inhalt: 250 ml', null),
  ('Daily Silver Shampoo', 'Pflege', null,
   'Für graues Haar. Wirkt dem Gelbstich von grauem Haar entgegen und macht das Haar geschmeidig. Vitamin B5 spendet außerdem Feuchtigkeit. Jetzt auch zur täglichen Anwendung geeignet.
Inhalt: 250 ml', null),
  ('Anti Hair Loss Shampoo', 'Pflege', null,
   'Shampoo gegen Haarausfall. Reinigt die Poren und fördert die Gesundheit der Kopfhaut, um Haarausfall zu verhindern.
Inhalt: 250 ml', null),
  ('Anti Hair Loss Scalp Treatment', 'Pflege', null,
   'Haarausfall-Behandlung. Stärkt das Haar und reduziert Haarausfall sowie Haarbruch.
Inhalt: 100 ml', null),

  -- ── Styling (S. 96–98) ────────────────────────────────────
  ('Heavy Hold Pomade', 'Styling', null,
   'Extremer Halt – viel Glanz. Ideal für Haartollen, die der Schwerkraft trotzen wollen. Auf Wasserbasis.
Inhalt: 85 g', null),
  ('Grooming Cream', 'Styling', null,
   'Starker Halt – viel Glanz. Für den glatten, nach hinten gekämmten Look oder um krauses Haar zu bändigen.
Inhalt: 85 g', null),
  ('Molding Clay', 'Styling', null,
   'Starker Halt – natürlicher Glanz. Ideal für Kurzhaarfrisuren und um störrisches Haar zu bändigen.
Inhalt: 85 g', null),
  ('Whip', 'Styling', null,
   'Leichter Halt – natürlicher Glanz. Bietet leichten und flexiblen Halt sowie natürlichen Glanz. Ideal für mittellanges Haar.
Inhalt: 85 g', null),
  ('Pomade', 'Styling', null,
   'Mittlerer Halt – viel Glanz. Ideal bei glatten Frisuren oder rauer Haarstruktur. Auf Wasserbasis.
Inhalt: 50 g | 85 g', null),
  ('Forming Cream', 'Styling', null,
   'Mittlerer Halt – natürlicher Glanz. Gibt dem Haar variablen Halt und viel Definition. Es bleibt formbar und flexibel.
Inhalt: 50 g | 85 g', null),
  ('Matte Clay', 'Styling', null,
   'Mittlerer bis starker Halt – mattes Finish. Verleiht dem Haar Formbarkeit und Struktur, ohne zu verkleben. Auf Bienenwachs- und Tonerde-Basis.
Inhalt: 85 g', null),
  ('Boost Powder', 'Styling', null,
   'Dichte, Stand und Griff. Leichtes Puder ohne Glanz, beschwert das Haar nicht. Ideal für kraftloses Haar. Wird im trockenen Haar angewendet.
Inhalt: 10 g | 20 g', null),
  ('Cream Pomade', 'Styling', null,
   'Leichter Halt – mattes Finish. Lässt das Haar natürlich aussehen und schafft einen raffinierten Stil für alle Haartypen.
Inhalt: 85 g', null),
  ('Defining Paste', 'Styling', null,
   'Mittlerer Halt – mattes Finish. Gibt dem Haar Struktur, flexiblen Halt und ein mattes Finish.
Inhalt: 85 g', null),
  ('Fiber', 'Styling', null,
   'Starker Halt – mattes Finish. Ideal für kurzes Haar und Looks mit viel Textur.
Inhalt: 50 g | 85 g', null),
  ('Fiber Cream', 'Styling', null,
   'Mittlerer Halt – natürlicher Glanz. Sorgt für flexibles Styling und ist besonders für mittellanges bis langes Haar geeignet.
Inhalt: 100 ml', null),
  ('Fiber Foam', 'Styling', null,
   'Mittlerer Halt – natürlicher Glanz. Verleiht Fülle und Volumen für mittellanges bis langes Haar.
Inhalt: 200 ml', null),
  ('Finishing Spray', 'Styling', null,
   'Mittelstarker Halt – natürlicher Glanz. Ideales Finish für jeden Style. Sorgt für flexiblen und lang anhaltenden Halt.
Inhalt: 200 ml', null),
  ('Grooming Spray', 'Styling', null,
   'Flexibler Halt – natürlicher Glanz. Vielseitiges, antistatisches Finish-Spray. Kann zum Stylen ins feuchte Haar oder als Finish im trockenen Haar verwendet werden.
Inhalt: 250 ml', null),
  ('Medium Hold Spray Gel', 'Styling', null,
   'Spray-Gel – natürlicher Glanz. Spray ohne Alkohol. Ideal zum Föhnen und für alle Haarlängen geeignet. Mit Sonnenschutz.
Inhalt: 250 ml', null),
  ('Alternator', 'Styling', null,
   'Mittlerer Halt – natürlicher Glanz. Flexibles Styling- und Finish-Spray in einem. Kann auf feuchtem oder trockenem Haar angewendet werden.
Inhalt: 100 ml', null),
  ('Light Hold Styling Gel', 'Styling', null,
   'Leichter Halt – natürlicher Glanz. Alkoholfreies Gel mit Hitzeschutz, ideal zum Föhnen. Hinterlässt keine Rückstände.
Inhalt: 250 ml', null),
  ('Firm Hold Styling Gel', 'Styling', null,
   'Starker Halt – natürlicher Glanz. Ohne Alkohol. Ideale Kombination aus Kontrolle und Festigkeit mit dem klassischen Look eines Gels.
Inhalt: 250 ml', null),
  ('Light Hold Texture Lotion', 'Styling', null,
   'Leichter Halt – natürlicher Glanz. Leichte Styling-Lotion für alle Männer, die nicht gestylt aussehen möchten. Für alle Haarlängen geeignet.
Inhalt: 250 ml', null),
  ('Firm Hold Styling Cream', 'Styling', null,
   'Starker Halt – mattes Finish. Styling Cream mit starkem, dennoch flexiblem Halt. Ideal für mittellanges bis langes Haar.
Inhalt: 100 ml', null),

  -- ── Precision Blend (S. 98) ───────────────────────────────
  ('Precision Blend', 'Coloration', null,
   'Farbsystem, das auf die besonderen Bedürfnisse von Männerhaar zugeschnitten ist. Für natürlich wirkende Grauabdeckung, auch für den Bart geeignet.
Nuancen: 4
Inhalt: 3 × 40 ml', null),
  ('Precision Blend Peroxide', 'Coloration', 'Entwickler 4,5 % (15 Vol.)',
   'Entwickler für Precision Blend, 4,5 % (15 Vol.).
Inhalt: 500 ml', null),

  -- ── Shaving & Skin Care (S. 99) ───────────────────────────
  ('Ultra Gliding Shave Oil', 'Pflege', null,
   'Bereitet die Haut auf die Rasur vor. Macht den Bart weicher und bereitet die Haut auf die Rasur vor.
Inhalt: 50 ml', null),
  ('Precision Shave Gel', 'Pflege', null,
   'Für eine präzise Rasur. Nicht-schäumende Formel, speziell für eine präzise Rasur bei normalen oder feinen Bärten.
Inhalt: 150 ml | 450 ml', null),
  ('Moisturizing Shave Cream', 'Pflege', null,
   'Feuchtigkeitsspendende Rasiercreme für eine gründliche Rasur. Die nicht-schäumende Formel lässt die Klinge über die Haut gleiten, ohne die Haut auszutrocknen.
Inhalt: 150 ml | 450 ml', null),
  ('Revitalizing Toner', 'Pflege', null,
   'Beruhigt die Haut nach der Rasur. Ideal, um irritierten Stellen Feuchtigkeit zuzuführen und die Poren zu schließen.
Inhalt: 150 ml', null),
  ('All-in-One Face Balm', 'Pflege', null,
   'Tägliche Feuchtigkeitspflege – beruhigt frisch rasierte Haut. Mit Lichtschutzfaktor 15, Anti-Aging-Wirkung inklusive.
Inhalt: 170 ml', null),

  -- ── Beard Care (S. 99) ────────────────────────────────────
  ('Beard Balm', 'Pflege', null,
   'Multifunktionaler Balsam. Pflegt und zähmt den Bart, verleiht ihm Glanz.
Inhalt: 60 g', null),
  ('Beard Serum', 'Pflege', null,
   'Pflegendes Bartserum. Macht den Bart geschmeidig und zieht schnell ein, ohne Rückstände zu hinterlassen.
Inhalt: 70 ml', null),
  ('2-in-1 Skin Moisturizer & Beard Conditioner', 'Pflege', null,
   'Hautfeuchtigkeitscreme und Conditioner. Versorgt den Bart mit Feuchtigkeit und macht ihn geschmeidig.
Inhalt: 100 ml', null)
) as v(titel, bereich, misch, anleitung, warn)
left join lateral (
  select t.email from public.teamapp_persons t
  where t.rolle = 'inhaberin' and t.aktiv = true
  order by t.email
  limit 1
) i on true
where not exists (
  select 1 from public.wissensbank_rezepturen r
  where r.titel = v.titel and r.produkt_marke = 'American Crew'
);

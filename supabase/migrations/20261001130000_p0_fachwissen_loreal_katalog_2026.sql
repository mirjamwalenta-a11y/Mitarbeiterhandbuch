-- ════════════════════════════════════════════════════════════
--  Fachwissen — L'Oréal Professionnel Produktkatalog 2026
--
--  Produkte aus dem Katalog als freigegebene Einträge, einsortiert
--  nach den Katalog-Kapiteln:
--    1 Coloration und Blondierung → Coloration / Tönung /
--                                    Blondierung / Farbkorrektur
--    2 Pflege                     → Pflege (Geräte → Sonstiges)
--    3 Styling                    → Styling
--    5 Umformung und Glättung     → Dauerwelle
--
--  Setzt die Kategorie "Styling" aus
--  20261001120000_p0_fachwissen_styling_american_crew.sql voraus.
--  Keine neue Tabelle, keine Änderung an RLS/Policies. Ersteller ist
--  die aktive Inhaberin aus teamapp_persons (keine E-Mail hartcodiert,
--  CLAUDE.md Regel 2).
--
--  Sicher mehrfach ausführbar (idempotent): Einträge werden nur
--  angelegt, wenn es Titel + Marke noch nicht gibt.
-- ════════════════════════════════════════════════════════════

insert into public.wissensbank_rezepturen
  (titel, anwendungsbereich, produkt_marke, mischverhaeltnis, einwirkzeit, anleitung, warnhinweise,
   status, ersteller_email, ersteller_name, freigegeben_von, freigegeben_am)
select
  v.titel, v.bereich, 'L''Oréal Professionnel', v.misch, v.einwirk, v.anleitung, v.warn,
  'freigegeben', coalesce(i.email, 'katalog-import'), 'L''Oréal Katalog 2026',
  coalesce(i.email, 'katalog-import'), now()
from (values
  -- ══ 1 COLORATION UND BLONDIERUNG ═════════════════════════
  -- ── Oxidative Coloration ──────────────────────────────────
  ('iNOA', 'Coloration',
   '1:1 – 1 Tube (60 ml) + 60 ml reichhaltiger iNOA Oxidant 10 Vol. (3 %), 20 Vol. (6 %) oder 30 Vol. (9 %)',
   '35 Minuten',
   'Ammoniakfreie oxidative Coloration („Brillanz, die bleibt“): 48 % mehr Glanz, 43 % weniger Haarporosität, 20 % mehr Feuchtigkeit für die Kopfhaut, 100 % Erhalt der natürlichen Haarstruktur.

Oxidant wählen: 10 Vol. (3 %) = bis 1 Tonhöhe Aufhellung, Ton in Ton oder dunkler; 20 Vol. (6 %) = bis 2 Tonhöhen und Weißhaarabdeckung; 30 Vol. (9 %) = bis 3 Tonhöhen.

1. Mischen, bis die Masse homogen und cremig ist.
2. Gesamte Mischung am Ansatz auftragen, bei Bedarf auf Längen und Spitzen (Farbausgleich ohne Wasser). Die Einwirkzeit beginnt nach dem Auftragen auf den Ansätzen.
   - Nuancenwechsel: sofort in Längen und Spitzen ziehen.
   - Minimal verblasst: 5 Min. vor Ende in Längen und Spitzen.
   - Verblasst: 15 Min. vor Ende in Längen und Spitzen.
3. Weißhaarabdeckung über 70 %: 1 Teil Reflexnuance + 1 Teil Natur- oder Goldgrundnuance gleicher Tonhöhe + 20 Vol. (6 %). Rotnuancen mit Rubilane, DM5 und Carmilane decken ohne Mischen ab (0–100 % Weißanteil).
   Tipp: kalte Nuance mit iNOA-Naturnuance mischen, warme mit Goldgrundton.
4. Einige Minuten aufemulgieren, ausspülen bis das Wasser klar ist. 1. Wäsche mit iNOA Post oder Metal DX Shampoo, 2. Wäsche mit Vitamino Color Spectrum Shampoo.

Extras: iNOA Clear (gemischt neue Farbeffekte/Pastell, allein Glanzveredelung + bis 2 Tonhöhen Aufhellung), iNOA High Resist (bessere Haltbarkeit der Reflexe, mit allen Nuancen mischbar), Dia light als Partner für Längen- und Spitzenausgleich.
Oxidant 1000 ml.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Handschuhe tragen, keine Metallgegenstände. Nuancen mit Carmilane, DM5 und/oder Rubilane NICHT mit anderen Nuancen mischen. Nicht für Personen unter 16 Jahren, frühestens 15 Tage nach Dauerwelle/Glättung.'),

  ('iNOA Booster', 'Coloration',
   '3 Teile Reflexnuance (45 ml) + 1 Teil Booster (15 ml) + 1 Teil Oxidant (60 ml); Verhältnis Reflexnuance/Booster je nach Bedarf anpassbar',
   null,
   'Neu. Zur Verstärkung der Reflexe oder Neutralisation unerwünschter Untertöne – für multidimensionale Reflexe. Farben: Grün, Violett, Blau.
2x mehr Farbintensität, 2x mehr Neutralisierung, Kontrolle über unerwünschte warme Untertöne bis zu 8 Wochen, über 300 mögliche Farbergebnisse. Für alle Haarstrukturen, auch auf dunklen Ausgangsfarben.
Grundregel: 1 Teil Farbcreme + 1 Teil Oxidant.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Handschuhe tragen.'),

  ('Majirel', 'Coloration',
   '1:1,5 – 1 Tube (60 ml) + 90 ml Crème Oxidant 12,5 Vol. (3,75 %), 20 Vol. (6 %) oder 30 Vol. (9 %)',
   '35 Minuten',
   'Oxidative Coloration mit Odor Trapping Technologie: 2-mal weniger Ammoniakgeruch, 3-mal mehr Pflege, gleichmäßige satte Farbe von Ansatz bis Spitze, bis zu 100 % Weißhaarabdeckung, vegane Formel.

- 20 Vol. (6 %): bis 2 Tonhöhen Aufhellung, 30 Vol. (9 %): 3 Tonhöhen Aufhellung.
- Weißhaarabdeckung bis 50 %: gewünschte Nuance auftragen. Über 50 %: Nuance zu gleichen Teilen mit Majirel- oder Majirel-Cool-Cover-Naturnuance bzw. Goldgrundton gleicher Tonhöhe + 20 Vol. (6 %) mischen.
- Kalte Nuance: mit Naturnuance (oder Cool-Cover-Naturnuance) mischen. Warme Nuance: mit Goldgrundton mischen.
- Auf ungewaschenes Haar auftragen. Längen stark verblasst → sofort durcharbeiten; leicht verblasst → nach 20 Minuten durcharbeiten.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Handschuhe tragen, keine Metallgegenstände. Nicht für Personen unter 16 Jahren, frühestens 15 Tage nach Dauerwelle/Glättung.'),

  ('Majirel Cool Cover', 'Coloration',
   '1:1,5 – 1 Tube (60 ml) + 90 ml Oxidant 12,5 Vol. (3,75 %), 20 Vol. (6 %) oder 30 Vol. (9 %)',
   '35 Minuten',
   'Oxidative Coloration mit Odor Trapping Technologie: trendige Kühle mit starker Neutralisierung und bis zu 100 % Weißhaarabdeckung. Extra-kühle, satte Farbreflexe mit anhaltender Neutralisation, tiefe intensive Deckkraft, wirkt in drei Zonen des Haares.

- Tonhöhe 3 bis 5: gewünschte Zielnuance auftragen.
- Tonhöhe 6 bis 10: natürliche Deckkraft → Zielnuance pur; satte Deckkraft → 1 Teil Zielnuance + 1 Teil Naturton gleicher Tonhöhe.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Handschuhe tragen, keine Metallgegenstände.'),

  ('Majirel High Lift', 'Coloration',
   '1:2 – 1 Tube (60 ml) + 120 ml Oxidant 30 Vol. (9 %) oder 40 Vol. (12 %)',
   '50 Minuten',
   'Hellt auf, neutralisiert und tönt in einem Schritt: kühle Blondtöne von ultra-neutral bis eisplatin, bis zu 4,5 Tonhöhen Aufhellung mit gleichzeitiger Mattierung. Für Globalaufhellungen oder Strähnen.

- Mit dem Pinsel auf trockenes, ungewaschenes Haar auftragen, am Ansatz beginnen. Gesamteinwirkzeit 50 Minuten.
- Naturhaar: auf Längen und Spitzen beginnen, 15 Min. einwirken lassen, dann Ansatz auftragen und 50 Min. einwirken lassen.
- Langer Ansatz (mehr als 2 cm): im Zwischenstück ca. 1 cm von der Kopfhaut beginnen, dann Ansatz, 50 Min.; Längen/Spitzen mit Dia light.
- Farbauffrischung: Ansatz mit Pinsel, Längen und Spitzen mit Dia light.
- Längen-/Spitzenausgleich: passende Majirel-Nuance 5 Min. vor Ende auftragen.
- Danach sorgfältig aufemulgieren, klar spülen, mit Metal DX Shampoo shampoonieren.',
   'Deckt weißes Haar NICHT ab – nur bei geringem, gleichmäßig verteiltem Weißanteil (bis 30 %). Allergieverdachtstest 48 Stunden vor jeder Anwendung. 40 Vol. voraussichtlich ab Januar 2026 verfügbar.'),

  ('Majirel Booster', 'Coloration',
   'Neutralisieren & Intensivieren: 15 ml Booster + 45 ml Majirel-Nuance + 90 ml Oxidant. Highlights auf dunkler Basis: 3 ml Booster + 7 ml Contrast Base + 15 ml Oxidant',
   '35 Minuten',
   'Intensivierer, um unerwünschte Untertöne zu neutralisieren oder Reflexe zu verstärken – für einen personalisierten Farbreflex. Farben: Blau, Violett, Grün, Orange, Magenta, Rot + Contrast Base.

- Ansatzcoloration (wie bei Majirel Mix): auf ungewaschenem Haar mit dem Pinsel auf die Ansätze, je nach Verblassen in Längen und Spitzen durcharbeiten/emulgieren.
- Highlights (wie bei Majicontrast): auf Naturtonbasis Tonhöhe 1 bis 6, auf coloriertem Haar Tonhöhe 4 bis 6.
Oxidant 1000 ml pro Flasche.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Oxidant 40 Vol. voraussichtlich ab Januar 2026 verfügbar.'),

  ('Crème Oxidant', 'Coloration',
   '12,5 Vol. (3,75 %), 20 Vol. (6 %), 30 Vol. (9 %), 40 Vol. (12 %)',
   null,
   'Oxidant für Majirel, Majirel Cool Cover, Majirel High Lift, Majirel Booster und Efassor (Tiefenreinigung).
Inhalt: 1000 ml',
   'Oxidant 40 Vol. voraussichtlich ab Januar 2026 verfügbar.'),

  ('Hair Touch Up', 'Coloration', null, 'Eine Minute trocknen lassen',
   'Direktzieher – professionelles Ansatz-Make-up (Root Concealer). Farbspray zur Ansatzkaschierung, wäscht sich ab einer Haarwäsche aus. 6 natürliche Nuancen, die sich optisch an jede Haarfarbe anpassen.

1. Vor Gebrauch gut schütteln.
2. Auf trockenes Haar aus ca. 15 cm Entfernung auf die sichtbaren Ansätze sprühen.
3. Eine Minute trocknen lassen.
4. Haar frisieren.
Inhalt: 75 ml (6–8 Anwendungen)', null),

  -- ── Intensivtönung / Ton in Ton ───────────────────────────
  ('Dia light', 'Tönung',
   '1:1,5 – 60 ml Dia light + 90 ml Dia Activateur 1,8 % (sanft), 2,7 % (regulär) oder 4,5 % (intensiv)',
   '5, 10 oder 20 Minuten',
   'Neu: Gloss Color mit Hyaluronsäure. Intensiver Feuchtigkeits-Boost für bis zu 3 Tage, 82 % mehr Farb-Glow, erhält die Faserschicht, 3x weniger Haarbruch. 80 Nuancen + 3 Oxidanten, dazu Dia light Booster.

1. Vorbereiten: Einmalhandschuhe, keine Metallgegenstände, nur mit Dia Activateur verwenden.
2. Mischen in der Farbschale: zuerst Dia Activateur dosieren (z. B. 90 ml), dann Dia light Clear (bis 30 ml) und/oder Nuance (bis 30 ml) zugeben.
3. Auf das trockene Haar auftragen.
   - 5 Min.: Glanzveredelung und softes Tönen
   - 10 Min.: Veredelung nach einem Blondservice / Glanz und Farbauffrischung Längen & Spitzen
   - 20 Min.: Farbauffrischung mit satterem Ergebnis oder bis zu 2 Tonhöhen dunkler
4. Sanft aufemulgieren, gründlich ausspülen, mit Metal DX Shampoo shampoonieren.

Services: Hyaluron Balayage (neutralisiert Untertöne nach Aufhellung), Hyaluron Color Boost (Längen/Spitzen auffrischen), Hyaluron Glow up (Glanz für Cut & Style Kund:innen).',
   'Blauen oder Grünen Booster NICHT mit chromatischen Kupfer- oder Rotnuancen (Rubilane, Carmilane, DM5) mischen. Allergieverdachtstest 48 Stunden vor jeder Anwendung.'),

  ('Dia color', 'Tönung',
   '1:1,5 – 1 Tube (60 ml) + 90 ml Dia Activateur 6 Vol. (1,8 %), 9 Vol. (2,7 %) oder 15 Vol. (4,5 %)',
   '5 bis 20 Minuten',
   'Demi-permanente Coloration (Ton in Ton): 6 Wochen Farbglanz, geschmeidigeres und gepflegteres Haar, tongetreue natürliche Reflexe. Ohne Ammoniak, angenehmer Geruch, gel-artige cremige Textur, 50 Nuancen.

- Auf das trockene Haar auftragen.
- Erstcoloration: 20 Minuten Einwirkzeit ab Ende des Auftragens.
- Ansatzcoloration: auf den Ansatz auftragen, 20 Minuten einwirken lassen; für dunkleres Ergebnis in Längen und Spitzen durcharbeiten.
- 5 Minuten in Längen und Spitzen emulgieren, klar ausspülen, shampoonieren und pflegen.',
   'Allergieverdachtstest 48 Stunden vor jeder Anwendung. Handschuhe tragen.'),

  ('Dia Activateur', 'Tönung',
   '6 Vol. (1,8 %), 9 Vol. (2,7 %), 15 Vol. (4,5 %)',
   null,
   'Entwickler für Dia light und Dia color.
1,8 % = sanfte Farbanlagerung, 2,7 % = reguläre Farbanlagerung, 4,5 % = intensive Reflexgebung und Farbanlagerung.', null),

  -- ── Blondierung ───────────────────────────────────────────
  ('Blond Studio 9', 'Blondierung',
   'Pulver : Oil Developer 1:1 bis 1:3; Oil Developer 6 % (20 Vol.), 9 % (30 Vol.), 12 % (40 Vol.) – zulässige Kombination je nach Technik laut Tabelle auf der Packung',
   'maximal 50 Minuten',
   'Staubreduzierte Blondierung, bis zu 9 Tonhöhen Aufhellung. Beginn des Blondierungsprozesses, innovativer Oxidant auf Öl-Basis, optimale Neutralisierung.
Techniken: Global, Folientechnik, Open Air / Freihand.', null),

  ('Blond Studio 9 Bonder Inside', 'Blondierung',
   'Pulver : Oil Developer 1:1 bis 1:3; Oil Developer 6 % (20 Vol.), 9 % (30 Vol.), 12 % (40 Vol.) – je nach Technik laut Tabelle',
   'maximal 50 Minuten',
   'Staubreduzierte Blondierung, bis zu 9 Tonhöhen Aufhellung, mit integriertem Bonder. Schnelle Aufhellungskraft, nachweisbarer Schutz der Brückenbindungen, Schutz-Komplex aus Zitronensäure und Glycin.
Techniken: Global, Folientechnik, Open Air / Freihand.', null),

  ('Blond Studio Multi-Technik-Balsam 8', 'Blondierung',
   'Balsam : Oxidant 1:1 bis 1:3; Oxidant 6 % (20 Vol.), 9 % (30 Vol.), 12 % (40 Vol.) – je nach Technik laut Tabelle',
   'maximal 50 Minuten',
   'Blondierbalsam mit integriertem Bonder (Bonder Inside), bis zu 8 Tonhöhen Aufhellung. Hellt auf, stärkt die Haarfaser und neutralisiert in einem Schritt (violetter Farbstoffkomplex). Ölbasierte Formel (29 % Öl), hohe Konzentration an Bonding-Komplex mit Zitronensäure und Glycin, stärkt schwache und starke Brückenbindungen. Für alle Haartypen.
Techniken: Global, Folientechnik, Open Air / Freihand.',
   'Für Strähnen mit Sweet Mèches anwenden; bei Alufolie ausschließlich L''Oréal-Folien SOFT ALLOY 8079 (20 μm) oder SOFT ALLOY 1200 (18 μm) verwenden.'),

  ('Blond Studio Multi-Technik-Pulver 8', 'Blondierung',
   'Pulver : Oxidant 1:1 bis 1:3; Oxidant 6 % (20 Vol.), 9 % (30 Vol.), 12 % (40 Vol.) – je nach Technik laut Tabelle',
   'maximal 50 Minuten',
   'Staubreduziertes Blondierpulver, bis zu 8 Tonhöhen Aufhellung. Vielseitig einsetzbar, ultrastarke Formel, angereichert mit Pro Keratin, verbesserter Geruch, hohe Haftfähigkeit. Schnelles, helles, klares Blond – ideal für Balayage und Freihand-Techniken.
Techniken: Global, Folientechnik, Open Air / Freihand.', null),

  ('Blond Studio Platinium Paste 7', 'Blondierung',
   'Paste : Nutri-Développeur 1:1 bis 1:3; 6 % (20 Vol.), 9 % (30 Vol.), 12 % (40 Vol.) – je nach Technik laut Tabelle',
   'maximal 50 Minuten',
   'Blondierpaste mit balsamartiger Konsistenz, bis zu 7 Tonhöhen Aufhellung. Staubfrei, pflegende Wirkstoffe (Nutriceride + Bienenwachs), klare Aufhellung und Glanz, hoher Auftragekomfort. Für alle Global- und Strähnentechniken.', null),

  ('Service-Artikel Blondierung', 'Blondierung', null, null,
   '- Easi Mèches (kurz & lang): für moderne Strähnentechniken – einfach, sauber, schnell, hoher Anwendungskomfort.
- Sweet Mèches: unterstützt die Wirkung der Platinium Blondierpaste, präzise gleichmäßige Aufhellung, schont die Haarfaser.
- Aluminiumfolie: für alle Strähnentechniken, speziell für die professionelle Anwendung im Salon.', null),

  -- ── Farbabzug ─────────────────────────────────────────────
  ('Efassor', 'Farbkorrektur',
   'Leichte Reinigung: 1 Beutel (28 g) + 60 ml warmes Wasser. Tiefenreinigung: 1 Beutel (28 g) + 75 ml Crème Oxidant 12,5 Vol. (3,75 %), 20 Vol. (6 %) oder 30 Vol. (9 %)',
   'Leichte Reinigung max. 20 Minuten, Tiefenreinigung max. 50 Minuten',
   'Farbabzug (Technik COLOR OUT) – ideal für zu dunkle Längen und Spitzen oder Farbüberlagerungen.
- Leichte Reinigung (entfernt oxidative Farbpigmente): global auftragen und während der Einwirkzeit emulgieren.
- Tiefenreinigung (entfernt oxidative Pigmente und hellt natürliche Pigmente auf): zuerst auf die dunkelsten Haarpartien auftragen.',
   'Gebrauchsanweisung auf der Verpackung beachten.'),

  -- ══ 2 PFLEGE (Serie Expert) ══════════════════════════════
  ('Metal DX', 'Pflege', null, null,
   'Für alle Haartypen. Gestärktes Haar, langanhaltende Farben, 2x mehr Glanz. Der Wirkstoff Glicoamin dringt in die Haarfaser ein und neutralisiert Metalle (Kupfer). Beugt Haarbruch, Farbveränderungen und Frizz vor.

Salon-exklusiver Colorationsservice:
1. Pre-Treatment (500 ml, ohne Ausspülen) – neutralisiert Metalle vor Coloration, Balayage, Blondierung
2. Shampoo (1500 ml) – reinigt nach dem technischen Service
3. Pflege und Maske (je 500 ml) – verhindern erneute Metallablagerungen
4. Leave-In (100 ml) – gegen Haarbruch & Farbveränderungen, 72 h Feuchtigkeit & Frizz-Kontrolle, UV-Filter & Hitzeschutz
5. Öl (50 ml) – konzentriertes Öl, pflegt, Glanz, schützt vor starker Hitze

Home-Routine (5 Schritte): Pre-Shampoo (250 ml), Shampoo (100/300/500 ml), Maske (150/250/500 ml, 1 Min.), Öl (50 ml), High Protection Leave-In Cream (100 ml). Schützt vor erneuten Metallablagerungen, Hitze bis 230 °C und UV. Neu: Discovery Trio in Probiergröße. Refill 1000 ml (Backbar) und 500 ml.
Auch als 1. Wäsche nach iNOA-Coloration.', null),

  ('Vitamino Color Spectrum', 'Pflege', null, null,
   'Für coloriertes Haar. Tiefgehende, mehrdimensionale Farbpflege mit Zitronensäure & Ferulasäure: erhält Glanz, Lebendigkeit, Kontrast, Farbton und Leuchtkraft – Farbbrillanz wie am ersten Tag bis zu 100 Tage lang.

- Shampoo (300/500/1500 ml, Refill 500 ml): vegan, sulfatfrei, +147 % Glanz
- Neutralisierende Shampoos (300 ml): neutralisieren unerwünschte Reflexe bei blondem, braunem und schwarzem Haar
- Deep Conditioner (200/500/750 ml): 2,5 % Zitronensäure, dringt in die Haarfaser ein
- Maske (250/500 ml): extra Geschmeidigkeit, +92 % bessere Kämmbarkeit
- Glass Shine Serum (30/50 ml, ohne Ausspülen): Glass-Hair-Effekt, Frizz-Kontrolle bis 72 h, Schutz vor Luftfeuchtigkeit, UV und Hitze

Als 2. Wäsche nach iNOA-Coloration (nach Metal DX), abschließen mit Deep Conditioner und Glass Shine Serum.', null),

  ('Absolut Repair Molecular', 'Pflege', null, null,
   'Für stark strukturgeschädigtes Haar – repariert 2 Jahre Haarschäden in einer Anwendung. Peptidbonder + 5 Aminosäuren reparieren die molekulare Haarstruktur.

Salon-exklusiver Reborn Stronger Service:
1. Pre-Treatment (190 ml, ohne Ausspülen) – dringt tief in die Haarstruktur ein
2. Shampoo (300/500/1500 ml) – reinigt, entwirrt, intensive Pflege
3. Rinse-Off Serum (75/250 ml) – molekulare Reparatur ohne zu beschweren
4. Maske (150/250/500 ml) – Geschmeidigkeit, Kämmbarkeit, Elastizität; bei mittel bis dickem Haar täglich, bei feinem 1–2x pro Woche
5. Leave-In (50/100 ml) – repariert, Hitzeschutz bis 230 °C, oder Bi-Phase Oil (30/90 ml) – durch Schütteln aktiviert, Glanz, Anti-Frizz
Neu: Discovery Trio in Probiergröße. Refill 1000 ml und 500 ml.', null),

  ('Vitamino Color (Resveratrol)', 'Pflege', null, null,
   'Für coloriertes Haar – klassischer Farbschutz auf der Haaroberfläche. Resveratrol (aus Traubenhaut, Antioxidant) verankert Farbpigmente, UV-Filter schützt.

- Farbfixierendes Shampoo (300/500/1500 ml, Refill 1500 ml)
- Pflegende Gel-Maske mit UV-Filter (250/500 ml, 1 Min.)
- Farbfixierender Conditioner (200/500/750 ml)
- Acidic Sealer (400 ml): versiegelt die Schuppenschicht nach der Coloration, keine Einwirkzeit
- Color 10 in 1 (190 ml, ohne Ausspülen): Glanz, Anti-Frizz, Hitzeschutz bis 230 °C', null),

  ('Blondifier', 'Pflege', null, null,
   'Für blondiertes, gesträhntes oder blond-coloriertes Haar. Mit Açai-Polyphenol: vermeidet Oxidation, regeneriert, neutralisiert unerwünschte Reflexe, mehr Glanz.
- Gloss Shampoo (300/500/1500 ml): für alle Blondtöne
- Conditioner: für feines Haar
- Maske: regeneriert, für feines und dickes Haar', null),

  ('Silver', 'Pflege', null, null,
   'Für ergrautes oder weißes Naturhaar – Gelbneutralisierung und Farbschutz. Gloss Protect System mit Farbpigmenten gegen Gelbstich, Magnesium schützt.
- Neutralisierendes Shampoo (300/500/1500 ml)
- Neutralisierender Conditioner (200 ml)
Refill 500 ml.', null),

  ('Curl Expression', 'Pflege', null, null,
   'Für alle Wellen, Locken und krauses Haar. Mit Glycerin, Urea H und Hibiskussamenextrakt.
- Anti-Buildup Cleansing Jelly (300/500/1500 ml): reinigt sanft, entfernt Rückstände
- Intense Moisturizing Cleansing Cream (300/500/1500 ml)
- Intensive Moisturizer Mask (250/500 ml) und Mask Rich (250/500 ml)
- 10in1 Cream-in-Mousse (250 ml): Definition, Halt, Hitzeschutz bis 230 °C
- Long Lasting Intensive Leave-In Moisturizer (250 ml)
- Definition Activator Leave-In (250 ml): Creme-Gel, Hitzeschutz bis 230 °C
- Curls Reviver Leave-In (190 ml): Auffrischungsspray, reduziert Frizz', null),

  ('Absolut Repair', 'Pflege', null, null,
   'Für strapaziertes und trockenes Haar – Wiederaufbau, Glanz, Geschmeidigkeit. Neue Co-Emulsion Technologie für intensive Reparatur ohne zu beschweren, mit Omega-9.
- Aufbauendes Shampoo (300/500/1500 ml, Refill 1500 ml)
- Aufbauender Conditioner (200/750 ml)
- Aufbauende Maske (250/500 ml)
- Gold Maske (250 ml): cremiges Gel mit goldener Textur
- 10-in-1 Öl (30/90 ml): beugt Spliss vor, glättet geschädigte Spitzen', null),

  ('Scalp Advanced Anti-Discomfort', 'Pflege', null, null,
   'Für empfindliche, irritierte Kopfhaut. Mit Niacinamid (Vitamin B3) zur Beruhigung.
- Dermo-Regulator Shampoo (300/500/1500 ml)
- Dermo-Regulator Intense Soother (200 ml)
Refill 500 ml.', null),

  ('Scalp Advanced Anti-Oiliness', 'Pflege', null, null,
   'Für ölige Kopfhaut. Bis zu 3 % AHA (Fruchtsäure) und bis zu 6 % Tonerde für ein sanftes Peeling.
- Dermo-Purifier Shampoo (300/1500 ml)
- 2in1 Deep Purifier Clay (250 ml)', null),

  ('Scalp Advanced Anti-Dandruff', 'Pflege', null, null,
   'Für schuppige Kopfhaut (trocken oder fettig). Mit antibakteriellem und antimykotischem Pirocton Olamin.
- Dermo-Clarifier Shampoo (300/1500 ml)', null),

  ('Serioxyl Advanced', 'Pflege', null, null,
   'Für feines, dünner werdendes Haar mit geringer Haardichte. Stemoxydine aktiviert ruhende Haarfollikel, Incell baut auf, Intra-Cylane für mehr Volumengefühl, Glucoboost und Neohesperidin.
- Anti Hair-thinning Bodifier Shampoo (300 ml)
- Anti Hair-thinning Density Activator Serum (90 ml, ohne Ausspülen)', null),

  ('Aminexil Advanced', 'Pflege', null, null,
   'Gegen Haarausfall und dünner werdendes Haar. 2-fach-Wirkung: bekämpft Kollagen-Verhärtungen, pflegt und kräftigt; Nutri-Komplex unterstützt die Haarwurzel.
- Anti Hair-loss Activator Serum (90 ml, ohne Ausspülen)
- Anti Hair-loss Roll-on (10 x 6 ml bzw. 42 x 6 ml): gegen nicht krankheitsbedingten Haarausfall', null),

  ('Pro Longer', 'Pflege', null, null,
   'Für langes Haar mit dünnen Spitzen. Filler A100 erneuert die Längen und füllt die Spitzen, Aminosäure schützt vor Haarbruch.
- Shampoo (300/500/1500 ml, Refill 1500 ml)
- Conditioner (200/750 ml)
- Maske (250/500 ml)
- Leave-In mit Hitzeschutz (150 ml)', null),

  ('iNOA Post', 'Pflege', null, null,
   'Salonexklusives Shampoo speziell für die Pflege nach einer iNOA-Coloration – verschönert das Farbergebnis.
Nach der Coloration sorgfältig ausspülen, anschließend zweimal shampoonieren, dazwischen gründlich ausspülen.
Alternative: 1. Wäsche Metal DX, 2. Wäsche Vitamino Color Spectrum.
Inhalt: 1500 ml', null),

  -- ── Geräte (im Katalog unter Pflege) ──────────────────────
  ('AirLight Pro', 'Sonstiges', null, null,
   'Neu: erster professioneller Haartrockner von L''Oréal Professionnel, mit Infrarotlicht-Technologie. Bis zu 21 % schnelleres Trocknen, 19 % weniger Energieverbrauch, 55 % mehr Feuchtigkeit. Digital und personalisiert: voreingestellte Profi-Modi oder eigene Modi.', null),

  ('SteamPod', 'Sonstiges', null, null,
   'Glätten mit Wasserdampf-Technologie, geeignet für jedes Haar.
- SteamPod 3
- SteamPod 4: professioneller All-in-One-Dampfstyler für jede Frisur und jeden Haartyp
- SteamPod Glättungskonzentrat (50 ml, ohne Ausspülen): Anti-Frizz bis 72 h, sofortiger Glanz, Hitzeschutz bis 230 °C, Feuchtigkeitskontrolle bis 80 % Luftfeuchtigkeit', null),

  -- ══ 3 STYLING (tecni.art) ════════════════════════════════
  ('tecni.art Fix Anti-Frizz', 'Styling', null, null,
   'Finish – Anti-Frizz-Haarspray für starken Halt. Ionic Neutralizing System mit 24 h Anti-Frizz-Schutz, rückstandsloses Ausbürsten, Compressed Technology.
Inhalt: 250 ml', null),
  ('tecni.art Fix Design', 'Styling', null, null,
   'Finish – Vapo-Haarlack für sehr starken Halt. Vapo-Sprühkopf für präzises Sprühen, für globale Fixierung oder einzelne Strähnen.
Inhalt: 200 ml | 1000 ml', null),
  ('tecni.art Fix Max', 'Styling', null, null,
   'Styling – strukturierendes Gel für ultrastarken Halt. Pure-Fix-Prinzip: sofortige globale Fixierung und Strähneneffekte, rückstandsloses Ausbürsten.
Inhalt: 200 ml', null),
  ('tecni.art Fix Paste', 'Styling', null, null,
   'Styling – Stylingpaste für einen Look ohne Grenzen. Kompakte Modellierpaste für ultimativen Halt, extremer Matt-Look, extreme Wandelbarkeit.
Inhalt: 75 ml', null),
  ('tecni.art Flex Pli', 'Styling', null, null,
   'Volumenaufbau – Thermo-Spray. Verleiht Form mit „Memory-Effekt“, Fülle und Halt, für Wickel- oder Föhn-Styling.
Inhalt: 190 ml', null),
  ('tecni.art Flex Curl Bounce', 'Styling', null, null,
   'Styling – Lockencreme für mehr Definition. Definiert jede Art von Locke, 24 h Schutz vor Luftfeuchtigkeit.
Inhalt: 200 ml', null),
  ('tecni.art Flex Liss Control', 'Styling', null, null,
   'Styling – glättende Styling-Creme. Volumenkontrolle und Glättung der Haarfaser, reduziert Frizz und schützt vor Luftfeuchtigkeit.
Inhalt: 150 ml', null),
  ('tecni.art Flex Web', 'Styling', null, null,
   'Styling – Strukturpaste für wandelbare Looks. Starke Faserbildung, Restyling-Möglichkeiten, für kurze Haare.
Inhalt: 150 ml', null),
  ('tecni.art Flex Waves', 'Styling', null, null,
   'Finish – für Wellen wie frisch vom Strand. Für alle Haartypen und Haarlängen.
Inhalt: 190 ml', null),
  ('tecni.art Flex Depolish', 'Styling', null, null,
   'Styling / Finish – destrukturierende Paste für einen ungezähmten Look. Destrukturiert und mattiert, unendlich re-modellierbar, besonders für kurzes und mittellanges Haar.
Inhalt: 150 ml', null),
  ('tecni.art Flex Blowdry', 'Styling', null, null,
   'Styling / Finish – Leave-In-Creme für Föhn-Stylings & Hitzeschutz. Ergebnisse bis zu 4 Tage, 96 h Anti-Frizz-Schutz, Hitzeschutz bis 230 °C.
Inhalt: 150 ml', null),
  ('tecni.art Volume Extra Full', 'Styling', null, null,
   'Volumenaufbau – Mousse für Volumen und extra starken Halt. Für langanhaltendes, formschönes Volumen.
Inhalt: 250 ml', null),
  ('tecni.art Volume Rootlift', 'Styling', null, null,
   'Volumenaufbau – Sprühschaum für Ansatzvolumen. Feiner Schaum für Halt und Volumen am Ansatz, ohne Längen und Spitzen zu beschweren. Mit UV-Filter.
Inhalt: 250 ml', null),
  ('tecni.art Volume Dust', 'Styling', null, null,
   'Styling – mattierendes Stylingpuder für extravagantes Volumen, auch direkt am Ansatz.
Inhalt: 7 g', null),
  ('tecni.art Volume Refresh', 'Styling', null, null,
   'Volumenaufbau / Styling – texturgebendes Sprühpuder (ehemals „Morning after Dust“). Mattierend, sehr leichter Halt, perfekt als Stylingauffrischer.
Inhalt: 200 ml', null),
  ('tecni.art Volume Panache', 'Styling', null, null,
   'Volumenaufbau / Finish – Puder-Spray für ein voluminöses, trockenes Finish. Mehr Volumen mit einem Sprühstoß, intensivste Puderkonzentration.
Inhalt: 250 ml', null),
  ('tecni.art All-in-1 Performer', 'Styling', null, null,
   'Neu: Leave-In-Treatment mit 30 Benefits in einem Spray – Pflege trifft auf Styling. Anti-Frizz & Anti-Haarbruch, Hitzeschutz & Kämmbarkeit, Definition & Glanz.
Inhalt: 190 ml', null),
  ('Infinium Pure', 'Styling', null, null,
   'Haarspray in den Stärken Soft, Stark und Extra-Stark. Trocknet in 1 Sekunde, keine Rückstände, feines Sprühverhalten; sofortiger starker Halt ohne starres Haargefühl; Glanz mit Micro-Shine-Polymeren, kein Verkleben, leichtes Ausbürsten. Hypoallergen, 100 % frei von Parfüm und Parfümduftstoffen.
Salon- und Retailgröße in einem: 300 ml mit Compressed Technology (weniger Verpackung, mehr Ergiebigkeit).', null),

  -- ══ 5 UMFORMUNG UND GLÄTTUNG ═════════════════════════════
  ('Dulcia Advanced Tonique', 'Dauerwelle',
   'Mindestens 75 ml Well-Lotion für eine durchschnittliche Haarmenge, 100 ml Fixierung',
   'Stärke 1T: 15 Minuten, Stärke 2T: 10 Minuten; Fixierung 10 Minuten',
   'Dauerwelle für langanhaltende, definierte Locken mit mehr Sprungkraft und Ansatzvolumen. „Moisture Lock Complex“ (Ionène G + Silikon) für optimalen Halt.
Stärken: 1T für normales Naturhaar, 2T für sensibilisiertes/coloriertes Naturhaar.

1. Mit Sensi Balance shampoonieren, sorgfältig handtuchtrocknen.
2. In gewünschter Wickelgröße in Frisurenform wickeln, Well-Lotion auftragen.
3. Einwirkzeit beachten; je nach Haartyp mit Plastikfolie/-haube abdecken, keine Wärmezufuhr.
4. Well-Lotion gründlich ausspülen, Wasser abtupfen.
5. 100 ml Fixierung auftragen, 10 Minuten einwirken lassen.
6. Wickler vorsichtig ausrollen, sanft durchemulgieren, mindestens 5 Minuten gründlich spülen.',
   'Keine Wärmezufuhr. Gebrauchsanweisung auf der Verpackung beachten.'),

  ('Dulcia Advanced', 'Dauerwelle',
   'Well-Lotion für eine durchschnittliche Haarmenge (Katalog: „mindestens 5 ml“ – vermutlich 75 ml), 100 ml Fixierung',
   'Stärke 0 und 1: 15 Minuten, Stärke 2: 10 Minuten; Fixierung 10 Minuten',
   'Dauerwelle mit kräftigender Umformung, respektiert die natürliche Elastizität des Haares. „Moisture Lock Complex“ (Ionène G + Silikon) für optimalen Halt.
Stärken: 0 für schwer wellbares Haar, 1 für normales Naturhaar, 2 für sensibilisiertes/coloriertes Haar.

1. Mit Sensi Balance shampoonieren, sorgfältig handtuchtrocknen.
2. In gewünschter Wickelgröße in Frisurenform wickeln, Well-Lotion auftragen.
3. Einwirkzeit beachten; je nach Haartyp mit Plastikfolie/-haube abdecken, keine Wärmezufuhr.
4. Well-Lotion gründlich ausspülen, Wasser abtupfen.
5. 100 ml Fixierung auftragen, 10 Minuten einwirken lassen.
6. Wickler vorsichtig ausrollen, sanft durchemulgieren, mindestens 5 Minuten gründlich spülen.',
   'Keine Wärmezufuhr. Gebrauchsanweisung auf der Verpackung beachten.'),

  ('X-Tenso Moisturist', 'Dauerwelle',
   'Neutralisierung: 2/3 der Fixiermilch (80 ml bei Globalanwendung), dann restliche 40 ml',
   'Widerspenstiges Naturhaar: 15 Minuten, sensibilisiertes Haar: 10 Minuten (inkl. Auftragezeit); Fixiermilch 2 x 5 Minuten',
   'Glättung – langanhaltende, hochwirksame Glättung mit Nutri-Cationic-Technologie. Zwei Stärken: Glättungscreme für widerspenstiges Naturhaar und für sensibilisiertes Haar, dazu Fixiercreme.

1. Vorbehandlung mit Presifon, Haare shampoonieren und ausspülen.
2. Haar in vier Sektionen abteilen.
3. Glättungscreme mit dem Pinsel auftragen, 1 cm am Ansatz aussparen. Am Hinterkopf im Nacken beginnen und zügig auftragen.
4. Einwirkzeit beachten, danach gründlich ausspülen.
5. Neutralisierung: 2/3 der Fixiermilch verteilen, Haare dabei glatt halten, 5 Minuten einwirken lassen; Rest auftragen, weitere 5 Minuten. Gründlich ausspülen und shampoonieren.
6. Mit Powermix oder einer passenden Maske pflegen.',
   'Gebrauchsanweisung auf der Verpackung beachten.')
) as v(titel, bereich, misch, einwirk, anleitung, warn)
left join lateral (
  select t.email from public.teamapp_persons t
  where t.rolle = 'inhaberin' and t.aktiv = true
  order by t.email
  limit 1
) i on true
where not exists (
  select 1 from public.wissensbank_rezepturen r
  where r.titel = v.titel and r.produkt_marke = 'L''Oréal Professionnel'
);

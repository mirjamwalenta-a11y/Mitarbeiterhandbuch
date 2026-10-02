-- ════════════════════════════════════════════════════════════
--  Fachwissen — Goldwell StyleSign (Styling)
--
--  27 Produkte aus dem StyleSign Education Manual (Relaunch 2024)
--  als freigegebene Einträge unter "Styling": Segmente Volume,
--  Curls, Smooth, Texture, Heat Styling, Hairspray, jeweils mit
--  Halt, Glanz, "ideal für", Vorteilen, Anwendung, Expertentipps.
--
--  Keine neue Tabelle, keine Änderung an RLS/Policies. Ersteller ist
--  die aktive Inhaberin aus teamapp_persons (keine E-Mail hartcodiert,
--  CLAUDE.md Regel 2).
--
--  Im Supabase SQL-Editor ausführen. Sicher mehrfach ausführbar:
--  Einträge werden nur angelegt, wenn es Titel + Marke noch nicht gibt.
-- ════════════════════════════════════════════════════════════

insert into public.wissensbank_rezepturen
  (titel, anwendungsbereich, produkt_marke, anleitung,
   status, ersteller_email, ersteller_name, freigegeben_von, freigegeben_am)
select
  v.titel, 'Styling', 'Goldwell', v.anleitung,
  'freigegeben', coalesce(i.email, 'katalog-import'), 'Goldwell StyleSign Manual',
  coalesce(i.email, 'katalog-import'), now()
from (values
  ('StyleSign Ansatzvolumenspray',
   'Volume · Halt 4/5 · Glanz 0/3 · ideal für feines bis mittelstarkes Haar

Verleiht feinen und kraftlosen Haaransätzen sofortiges Volumen für bis zu 48 Stunden. Kontrollierte, präzise Anwendung für gezieltes Volumen. Schnell zerfallender Aerosolschaum mit Polymerkombination für langanhaltendes Volumen, auch bei Regen und Feuchtigkeit.

Anwendung: Auf den handtuchtrockenen Haaransatz sprühen.

Expertentipps:
- Für alle Haarlängen geeignet.
- Kann partiell angewendet werden (z. B. nur am Scheitel) und mit anderen Produkten kombiniert werden.
- Auch für ölige Kopfhaut geeignet: der Lifting-Effekt hält die Haare von der Kopfhaut fern, sie wirken nicht so schnell fettig.
- Zuerst mit einer Paddle Brush den Ansatz föhnen, dann mit der Rundbürste finalisieren.

Frei von Sulfaten und Mineralöl, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Füllegebendes Bändigungs-Mousse',
   'Volume · Halt 4/5 · Glanz 1/3 · ideal für alle Haartexturen

Gibt dem Haar beim Föhnen bis zu 100 % mehr langanhaltendes Volumen und Fülle, mit maximaler Kontrolle, auch bei sprödem und geschädigtem Haar. Schützt vor Hitzeschäden.

Anwendung: Auf das handtuchtrockene Haar auftragen.

Expertentipps:
- Für alle Haarlängen, ideal für klassische und voluminöse Stylings.
- Locken mit der „Bowl-Methode“: Definierende Creme ins nasse Haar, das Haar mehrmals in eine Schüssel mit Wasser tauchen und kneten, vor dem Lufttrocknen das Bändigungs-Mousse auftragen.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Füllegebendes Brillanz-Mousse',
   'Volume · Halt 3/5 · Glanz 2/3 · ideal für feines bis mittelstarkes Haar

Verleiht beim Föhnen sofort bis zu 100 % mehr langanhaltende Fülle und Farbbrillanz für bis zu 72 Stunden. Kräftigt selbst sehr feines Haar und schützt vor Hitzeschäden und Haarbruch beim Föhnen. Mit natürlicher Reisstärke, gibt Volumen ohne zu beschweren. Der Spezialist für feines und/oder gefärbtes Haar.

Anwendung: Auf das handtuchtrockene Haar auftragen.

Expertentipps:
- Leichter Schaum mit weicher, fluffiger Textur.
- Ideale Grundlage für weitere Styling-Schritte (wie eine Make-up-Grundierung).
- Für gleichmäßige Verteilung auf einen Kamm geben und einarbeiten.

Frei von Sulfaten und Mineralöl, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Definierende Creme',
   'Curls · Halt 3/5 · Glanz 2/3 · ideal für mittelstarkes bis kräftiges Haar

Pflegt Locken sofort und bündelt sie intensiv, für gesund aussehende, definierte Ergebnisse. Pflegt strapazierte und geschädigte Locken (Sheabutter und Rizinusöl). Schützt vor Hitzeschäden. Ideal, um kräftiges, lockiges Haar zu bändigen.

Anwendung: Um die Locke zu verlängern, ins nasse Haar nach unten eindrehen. Für mehr Sprungkraft ins handtuchtrockene Haar Richtung Ansatz einkneten.

Expertentipps:
- Kopf der Kundin neigen oder mit dem Nacken auf die Stuhlkante legen, um das Produkt „im freien Fall“ von der Spitze zum Ansatz zu verteilen.
- Am nächsten Tag im trockenen Haar erneut einkneten, um Definition aufzufrischen.

Frei von Sulfaten, Mineralöl und Silikonen, ohne Alkohol, bis zu 97 % biologisch abbaubar.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Bündelndes Gel',
   'Curls · Halt 3/5 · Glanz 2/3 · ideal für feines bis mittelstarkes Haar

Sofortige Definition und Feuchtigkeit für gebündelte, elastische Locken für bis zu 72 Stunden. Bekämpft Frizz und bändigt Locken, ohne sie zu verkleben. Schützt vor Hitzeschäden. Leichte Gel-Konsistenz mit natürlichem Feuchtigkeitsspender (Propandiol).

Anwendung: In das handtuchtrockene Haar nach oben einkneten.

Expertentipps:
- Auftragen, kneten, an der Luft trocknen lassen und danach leicht nachkneten.
- Mit Diffusor: Locken auf den Diffusor legen und ruhen lassen.
- Ideal, um Locken in kraftlosem und feinem Haar zu verstärken; auch für Flechtfrisuren.
- Großzügig dosieren für die besten Ergebnisse.

Frei von Sulfaten, Mineralöl und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Schwereloses Fluid',
   'Curls · Halt 2/5 · Glanz 2/3 · ideal für alle Haartexturen

Sofortige Definition für sanft gebündelte, natürlich aussehende Locken und Wellen, die sich durch Hochkneten wieder reaktivieren lassen. Schützt vor Hitzeschäden.

Anwendung: Im handtuchtrockenen Haar mit den Fingern twisten oder im trockenen Haar zum Auffrischen des Stylings anwenden.

Expertentipps:
- Für leichte, griffige Locken- oder Wellen-Looks, die sich einfach umstylen lassen.
- Lockenstyling über Nacht: ins handtuchtrockene Haar, Zopf flechten, am nächsten Tag lösen.

Frei von Sulfaten und Mineralöl, bis zu 97 % biologisch abbaubar.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Hochglanz Gel-Wachs',
   'Curls · Halt 1/5 · Glanz 3/3 · ideal für mittelstarkes bis kräftiges Haar

Bündelt Locken sofort und spendet Feuchtigkeit, für ein flexibles Finish mit maximalem Glanz. Verbindet die Feuchtigkeit eines Gels mit dem Glanz von Wachs. Schützt vor Hitzeschäden.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Lässt strapazierte, glanzlose Locken gesund und glänzend aussehen.
- Für Glanz und Kontrolle; Locken bleiben den ganzen Tag gebündelt und mit Feuchtigkeit versorgt.

Frei von Sulfaten und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Glanzspray',
   'Smooth · Halt 0/5 · Glanz 3/3 · ideal für alle Haartexturen

Verleiht sofort Ultra-Hochglanz und schützt bis zu 72 Stunden vor Luftfeuchtigkeit und Frizz. Seidenweiches Gefühl, glänzendes, schwereloses Finish.

Anwendung: Auf das trockene Haar sprühen, aus einer Armlänge Entfernung.

Expertentipps:
- Veredelt farbbehandeltes Haar und perfektioniert jede Farbdienstleistung.
- Wirkt wie ein Regenschirm für das Haar.
- Auch für Flechtfrisuren, um kleine Härchen zu bändigen.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign BB Creme zum Lufttrocknen',
   'Smooth · Halt 2/5 · Glanz 2/3 · ideal für alle Haartexturen

Neu. Hybrid aus Styling und Pflege: pflegt sofort und reduziert Frizz für glattes, kontrolliertes, gesund aussehendes Haar, ohne zu föhnen. Schützt vor Feuchtigkeitsverlust und Frizz. Ideal zum Lufttrocknen, kann aber auch zum Föhnen verwendet werden.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Auftragen, durchkämmen, an der Luft trocknen lassen. Sehr natürlich aussehende Styles.
- Ideal für Kund:innen, die ein schnelles Styling möchten.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Schwereloses Glanz-Öl',
   'Smooth · Halt 0/5 · Glanz 3/3 · ideal für alle Haartexturen

Neu. Sofortige Kontrolle bei jeder Haarstruktur, Ultra-Hochglanz-Finish und bis zu 72 Stunden Frizz-Kontrolle. Schließt Feuchtigkeit ein, ohne das Haar zu beschweren. Bis zu 4-mal mehr Farbleuchtkraft und Glanz.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Mit anderen Stylingprodukten kombinierbar, besonders bei kräftigem und geschädigtem Haar.
- Dank leichter Formulierung auch bei feinem Haar gegen Frizz und fliegende Haare.

Frei von Sulfaten und Mineralöl, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Roughman Texturgebende Paste',
   'Texture · Halt 5/5 · Glanz -1/3 · ideal für mittelstarkes bis kräftiges Haar

Sofortiger Halt und totale Kontrolle für matte Styles, die bis zu 72 Stunden halten. Die legendäre, schnell trocknende Paste mit maximalem Halt und starkem Bündelungseffekt.

Anwendung: In das trockene Haar einarbeiten (maximaler Matteffekt auf trockenem Haar).

Expertentipps:
- Für dauerhafte, glatte Looks mit einem Kamm im handtuchtrockenen Haar einarbeiten.

Frei von Sulfaten und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Lagoom Jam Styling Gel',
   'Texture · Halt 5/5 · Glanz 2/3 · ideal für alle Haartexturen

Sofortiger Glanz, ultrastarker Halt, Textur und Volumen für bis zu 72 Stunden. Vielseitiges Styling, zum Föhnen oder Stylen mit den Händen. Stärkster Halt auf handtuchtrockenem Haar.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Hält auch im nassen Haar, für Looks wie den Mohawk.
- Im trockenen Haar für Volumen und Textur, im handtuchtrockenen für starken Halt oder Wet Looks.
- Am Ansatz ideal für voluminöse Föhnstylings.

Frei von Sulfaten, Mineralöl und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Formgebende Creme',
   'Texture · Halt 4/5 · Glanz 3/3 · ideal für mittelstarkes bis kräftiges Haar

Kreiert strukturierte Looks mit intensivem Glanz und starkem, aber flexiblem Halt für bis zu 72 Stunden. Die am intensivsten glänzende Paste von StyleSign, mit Carnaubawachs, Rizinusöl und Algenöl.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Bändigt selbst widerspenstiges Haar.
- Beliebt bei Mützen- und Hutträger:innen: nach dem Abnehmen ist der Style schnell wieder da.
- Gute Grundlage für Flechtfrisuren.

Frei von Sulfaten, Mineralöl und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Trockenes Spray Wachs',
   'Texture · Halt 4/5 · Glanz 2/3 · ideal für alle Haartexturen

Sofortiger Glanz mit Undone-Textur, Definition und starkem, aber flexiblem Halt. Vielseitig wie ein Wachs, einfach wie ein Finishing Spray. Sprühen und stylen in einem Schritt.

Anwendung: Auf das trockene Haar sprühen.

Expertentipps:
- Ideal für „Spray & Go“-Styles und Hochsteckfrisuren.
- Auch bei langem Haar als Finish.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Meersalz-Spray',
   'Texture · Halt 4/5 · Glanz 0/3 · ideal für alle Haartexturen

Sofortiger strukturierter Beach Look und definierte Wellen. Verleiht Fülle und erhält die Feuchtigkeit der Haare. Mit natürlichem Salz.

Anwendung: In das handtuchtrockene oder trockene Haar sprühen.

Expertentipps:
- Für Griffigkeit und Textur, perfekt für undone Looks bei kurzem und mittellangem Haar.
- Auch als Styling-Grundlage und zum Föhnen von kurzem Haar mit der Rundbürste.
- Ideal zum Auffrischen von trockenem Haar.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Trockenes Textur-Spray',
   'Texture · Halt 2/5 · Glanz -1/3 · ideal für feines bis mittelstarkes Haar

Gibt sofort starke Textur, Griff und Volumen. Absorbiert Öl am Ansatz und verleiht ein leichtes, mattes Finish. Frischt jeden Style auf, ohne sichtbare pudrige Rückstände.

Anwendung: Auf das trockene Haar sprühen und einarbeiten.

Expertentipps:
- Gibt das Gefühl von dichterem Haar, ideal für feines Haar.
- Für Hochsteckfrisuren, zum Toupieren und um Beach Waves zu fixieren.
- Für Textur das Deckhaar anheben und im Fallen aufsprühen; für Ansatzvolumen direkt auf den Ansatz sprühen.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Mattierende Paste',
   'Texture · Halt 3/5 · Glanz -2/3 · ideal für alle Haartexturen

Neu. Sofortige matte, texturierte und strukturierte Styles mit Fülle. Das matteste Produkt im Sortiment: supermattes Finish mit flexiblem, dauerhaftem Halt (Stylingpolymer auf Maisbasis). Lange Verarbeitungszeit, auch für Einsteiger:innen.

Anwendung: In das handtuchtrockene oder trockene Haar einarbeiten.

Expertentipps:
- Um einzelne Partien bei mittellangem Haar oder die Spitzen bei kurzem Haar zu akzentuieren.
- Für matte Hochsteckfrisuren.
- Bändigt Babyhaare und fliegende Haare, ohne fettig zu wirken.
- Extra Volumen und Halt für feines und dünner werdendes Haar.

Frei von Silikonen und Mineralöl, mit natürlichem Rizinusöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Definierendes Wachs',
   'Texture · Halt 3/5 · Glanz 3/3 · ideal für mittelstarkes bis kräftiges Haar

Neu. Sofortige Definition und langanhaltende Kontrolle mit Ultra-Hochglanz-Finish für bis zu 72 Stunden. Weiche, schmelzende Creme-Konsistenz, ein klassisches Wachs mit glänzendem, nicht fettendem Finish. Bis zu 96 % Inhaltsstoffe natürlichen Ursprungs.

Anwendung: In das trockene Haar einarbeiten.

Expertentipps:
- Für geschmeidige Styles, ohne fettig zu wirken.
- Das beste Produkt des Sortiments, um stark strukturiertes Haar zu glätten und zu bändigen.

Frei von Sulfaten, Mineralöl und Silikonen, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Tägliches Föhnspray',
   'Heat Styling · Halt 3/5 · Glanz 2/3 · ideal für feines bis mittelstarkes Haar

Gibt sofort Kontrolle und Hitzeschutz beim Föhnen. Föhnlotion auf Basis natürlicher Maisstärke. Bis zu 98 % Inhaltsstoffe natürlichen Ursprungs.

Anwendung: Auf das handtuchtrockene Haar aufsprühen.

Expertentipps:
- Für natürlich aussehende Styles, mit oder ohne Bürste.
- Ideal für feines Haar: Styling ohne zu beschweren, geschmeidiges Volumen.
- Gibt stumpfem Haar Glanz.
- Zum Nachstylen am nächsten Tag das Haar mit dem Produkt leicht anfeuchten.

Frei von Sulfaten, Mineralöl und Silikonen, bis zu 99 % biologisch abbaubar. Hinweis: Hitzeschutz bis 230 °C gilt laut Goldwell nicht für dieses Produkt.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Form- & Finish-Spray',
   'Heat Styling · Halt 3/5 · Glanz 2/3 · ideal für alle Haartexturen

2-in-1: für sofort glatt gestyltes Haar oder für Locken und Wellen. Schutz vor Frizz, Luftfeuchtigkeit und Hitze bis 230 °C. Reduziert Haarbruch beim Hitzestyling. Ideal auch als Finish-Spray. Wasserfreie Formulierung.

Anwendung: Auf das trockene Haar sprühen, bevor Hot Tools verwendet werden.

Expertentipps:
- Macht Stylings mit Lockenstab und Glätteisen länger haltbar.
- Beliebt für den Restyle-Effekt am zweiten Tag.
- Kann Abteilung für Abteilung verwendet werden, ohne umliegendes Haar zu befeuchten.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Glättungsbalsam',
   'Heat Styling · Halt 2/5 · Glanz 3/3 · ideal für mittelstarkes bis kräftiges Haar

Glättet sofort selbst geschädigtes oder kräftiges Haar für bis zu 72 Stunden. Schützt vor Frizz, Luftfeuchtigkeit und Hitzeschäden bis 230 °C. Reduziert Haarbruch beim Styling um bis zu 83 %.

Anwendung: In das handtuchtrockene Haar einarbeiten, föhnen und gegebenenfalls mit dem Glätteisen glätten.

Expertentipps:
- Von den Spitzen zum Ansatz auftragen.
- Partiell möglich, z. B. nur in Längen und Spitzen, um das Volumen am Ansatz zu erhalten.
- Auch zum Lufttrocknen von besonders kräftigem Haar.
- Ideal für geschädigtes oder sprödes Haar.

Frei von Sulfaten und Mineralöl, ohne Alkohol.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Föhn- & Textur-Spray',
   'Heat Styling · Halt 2/5 · Glanz 3/3 · ideal für alle Haartexturen

2-in-1-Spray: auf handtuchtrockenem Haar ideal für Föhntechniken mit bis zu 100 % mehr Volumen, auf trockenem Haar formbarer Halt und Textur. Volumen und Textur lassen sich durch Einkneten sofort reaktivieren. Nicht klebrig.

Anwendung: Im handtuchtrockenen Haar als Volumenspray verwenden. Im trockenen Haar, um Fülle und Finish des gestylten Haares zu fixieren.

Expertentipps:
- Zweimal verwenden: zuerst am Ansatz im handtuchtrockenen Haar, dann im trockenen Haar in Längen und Spitzen zum Fixieren.
- Ideal für Hochsteckfrisuren.

Frei von Sulfaten, Mineralöl und Silikonen. Hinweis: Hitzeschutz bis 230 °C gilt laut Goldwell nicht für dieses Produkt.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Glättendes Serum Spray',
   'Heat Styling · Halt 0/5 · Glanz 3/3 · ideal für alle Haartexturen

Sofort langanhaltend seidenglattes Haar. Lässt das Glätteisen leichter gleiten und schützt vor Frizz, Luftfeuchtigkeit und Hitze bis 230 °C. Reduziert Haarbruch beim Styling um bis zu 83 %.

Anwendung: Auf das trockene Haar sprühen, dann föhnen oder mit dem Glätteisen glätten. Flasche ca. 20–30 cm vom Haar entfernt halten und das Produkt einkämmen.

Expertentipps:
- Der perfekte Partner für das Glätteisen.
- Auch als aerosolfreies Glanz- und Feuchtigkeitsschutzprodukt.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Flexibles Haarspray',
   'Hairspray · Halt 3/5 · Glanz 2/3 · ideal für alle Haartexturen

Sofortiger mittelstarker Halt und maximaler Glanz. Lässt sich leicht auskämmen. Ideal für gefärbtes und strapaziertes Haar; laut Goldwell das beste Haarspray für geschädigtes, poröses Haar.

Anwendung: Auf das trockene Haar sprühen.

Expertentipps:
- Bändigt fliegende Haare, trocknet schnell.
- Ideal für Hochsteckfrisuren und zum Nachstylen.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Komprimiertes Flexibles Haarspray',
   'Hairspray · Halt 3/5 · Glanz 2/3 · ideal für alle Haartexturen

Neu. Mikrofeines, punktuelles Spray mit sofortigem Halt, intensivem Glanz und Schutz vor Luftfeuchtigkeit und Frizz. Stark konzentriert: gleiche Anzahl Anwendungen wie das Flexible Haarspray bei halb so großer Dose.

Anwendung: Auf das trockene Haar sprühen.

Expertentipps:
- Abgestimmt auf strapaziertes und farbbehandeltes Haar.
- Bändigt fliegende Haare, lässt sich leicht ausbürsten.

Frei von Sulfaten und Mineralöl.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Starkes Haarspray',
   'Hairspray · Halt 4/5 · Glanz 1/3 · ideal für alle Haartexturen

Sofortiger starker Halt. Extra trockenes, mikrofeines Spray für mehr Volumen und ein schnell trocknendes Finish mit Feuchtigkeitsschutz.

Anwendung: Auf das trockene Haar sprühen.

Expertentipps:
- Perfektes Pony-Haarspray: einfach unter den Pony sprühen.
- Sehr fest, ohne zu kleben.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.'),
  ('StyleSign Extra starkes Haarspray',
   'Hairspray · Halt 5/5 · Glanz 2/3 · ideal für alle Haartexturen

Sofortiger maximaler Halt mit lackartigem, glänzendem Finish. Für extrem haltbare Styles.

Anwendung: Auf das trockene Haar sprühen.

Expertentipps:
- Für Avantgarde-, Festival- und Red-Carpet-Looks.
- Zuerst das Starke Haarspray zum Aufbau, dann das Extra starke für maximalen Halt.

Frei von Sulfaten, Mineralöl und Silikonen.
StyleSign: vegane Formulierung mit Marine Bamboo, dermatologisch getestet, CO₂-kompensiert.')
) as v(titel, anleitung)
left join lateral (
  select t.email from public.teamapp_persons t
  where t.rolle = 'inhaberin' and t.aktiv = true
  order by t.email
  limit 1
) i on true
where not exists (
  select 1 from public.wissensbank_rezepturen r
  where r.titel = v.titel and r.produkt_marke = 'Goldwell'
);

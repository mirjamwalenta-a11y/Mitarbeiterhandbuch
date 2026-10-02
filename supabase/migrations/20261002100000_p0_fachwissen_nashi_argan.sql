-- ════════════════════════════════════════════════════════════
--  Fachwissen — Nashi Argan (Pflege)
--
--  5 Produkte als freigegebene Einträge unter "Pflege":
--  Classic Shampoo, Classic Conditioner, Argan Oil, Deep Infusion,
--  Instant Mask. Texte, Anwendung und Inhaltsstoffe laut Hersteller
--  (stylistenprodukte.at).
--
--  Keine neue Tabelle, keine Änderung an RLS/Policies. Ersteller ist
--  die aktive Inhaberin aus teamapp_persons (keine E-Mail hartcodiert,
--  CLAUDE.md Regel 2).
--
--  Im Supabase SQL-Editor ausführen. Sicher mehrfach ausführbar:
--  Einträge werden nur angelegt, wenn es Titel + Marke noch nicht gibt.
-- ════════════════════════════════════════════════════════════

insert into public.wissensbank_rezepturen
  (titel, anwendungsbereich, produkt_marke, einwirkzeit, anleitung,
   status, ersteller_email, ersteller_name, freigegeben_von, freigegeben_am)
select
  v.titel, 'Pflege', 'Nashi Argan', v.einwirk, v.anleitung,
  'freigegeben', coalesce(i.email, 'katalog-import'), 'Nashi Argan Produktinfo',
  coalesce(i.email, 'katalog-import'), now()
from (values
  ('Classic Shampoo', '3 Minuten',
   'Sanfte Reinigung für alle Haartypen, spendet Feuchtigkeit, erhält die natürliche Geschmeidigkeit und schützt die Farbe. Ideal für den täglichen Einsatz. Die spezielle Formel vermeidet ein Ungleichgewicht im Feuchtigkeitshaushalt und sorgt für eine schöne, glatte Haarstruktur. Mit zertifiziertem, organischem Arganöl und Leinsamenöl.

Wirkung:
- pflegt die Haare, ohne sie zu belasten
- schützt die Haarfarbe
- reinigt sanft und spendet Feuchtigkeit
- verleiht Geschmeidigkeit und natürlichen Glanz

Anwendung: Auf das nasse Haar auftragen, sanft einmassieren, nach 3 Minuten ausspülen. Vorgang wiederholen.
Tipp vom Profi: Bei täglicher Anwendung reicht es, einmal zu shampoonieren.

Frei von: SLES, SLS, Phosphate, Parabene.
Inhaltsstoffe: Aqua (Wasser), Natrium-C14-16-Olefinsulfonat, Laureth-4, Peg-15-Cocopolyamin, Cocamidopropylbetain, Peg-150-Pentaerythrityltetrastearat, Glycerin, Polyquaternium-70, PPG-2-Hydroxyethylcocamid, Parfüm (Duft), Benzophenon-4, hydrolysierte Seide, Argania-Spinosa-Kernöl (Arganöl), Linum-usitatissimum-Samenöl (Leinsamenöl), Macadamia-Ternifolia-Samenöl, Tocopherylacetat, Glucose, Sorbit, Natriumglutamat, Harnstoff, Natrium-PCA, Glycin, hydrolysiertes Weizenprotein, Panthenol, Peg-40 hydriertes Rizinusöl, Phenoxyethanol, Ethylhexylglycerin, Milchsäure, Tetranatrium-EDTA, Peg-150-Distearat, Dipropylenglykol, Triethanolamin, Natriumbenzoat, Propylenglykol, Benzylalkohol, Benzylsalicylat, Cumarin, Hexylzimt, Linalool.'),
  ('Classic Conditioner', '3 Minuten',
   'Professionelle, feuchtigkeitsspendende Haarpflege mit einer Mischung aus kostbaren, biologisch angebauten Stoffen. Für alle Haartypen: pflegt sanft, baut die Haarstruktur auf, ohne zu beschweren, und schützt die Haarfarbe. Mit zertifiziertem, organischem Arganöl und Leinsamenöl.

Wirkung:
- optimale Ergänzung zum Nashi Argan Shampoo
- leichtere Kämmbarkeit, auch bei empfindlichem und feinem Haar
- stellt den natürlichen Glanz wieder her
- schützt die Haarfarbe

Anwendung: Auf frisch gewaschenes, handtuchtrockenes Haar auftragen, in Längen und Spitzen einmassieren, 3 Minuten einwirken lassen und gründlich ausspülen.

Frei von: SLES, SLS, Phosphate, Parabene.
Inhaltsstoffe: Aqua (Wasser), Cetearylalkohol, Behentrimoniummethosulfat, Dimethicone, Cetrimoniumchlorid, Propylenglycol, Argania Spinosa Kernel (Argan) Öl, Linum Usitatissimum Samen (Leinsamen) Öl, Panthenol, hydrolysiertes Keratin, Glycerin, Cetylalkohol, Parfüm (Duft), Butylenglykol, Polyquaternium-37, Laureth-3, Laureth-23, Cetylethylhexanoat, Peg-8, Peg-8/SMDI-Copolymer, Palmitoylmyristylserinat, hydriertes Polydecen, Natriumpolyacrylat, Trideceth-6, Weizenaminosäuren, Zitronensäure, Dinatrium-EDTA, Hydroxycitronellal, Limonen, Linalool.'),
  ('Argan Oil', 'ohne Ausspülen',
   'Öl mit einem hohen Anteil ungesättigter Fettsäuren, die wie eine Barriere gegen Feuchtigkeitsverlust im Haar wirken. Mit viel Linolsäure und Vitamin E; repariert, pflegt und gibt dem Haar strahlenden Glanz. Mit zertifiziertem, organischem Arganöl und Leinsamenöl, angereichert mit UV-Filtern.

Wirkung (laut Hersteller):
- wird sofort tiefenwirksam vom Haar aufgenommen
- schützt das Haar vor freien Radikalen (Anti-Aging-Wirkung fürs Haar)
- verleiht schlaffem, farblosem Haar neuen Glanz und Spannkraft
- baut strukturverändertes/geschädigtes Haar sofort auf
- bändigt widerspenstiges, dickes Haar
- verhilft feinem Haar zu mehr Volumen
- erleichtert die Kämmbarkeit

Anwendung: Eine kleine Menge, je nach Länge und Bedürfnis des Haares, auf das feuchte Haar auftragen, mit einem Kamm gleichmäßig verteilen und wie gewohnt stylen. Nicht ausspülen.

Frei von: Sulfate, Phosphate, Parabene.
Inhaltsstoffe: Cyclopentasiloxan, Dimethicon, Trimethylsiloxysilicat, Argania Spinosa Kernel (Argan) Oil, PPG-3 Benzylether Myristate, Disiloxan, Linum Usitatissimum Seed (Leinsamen) Oil, Parfum (Duft), Linalool, Limonen, CI 47000, CI 26100.'),
  ('Deep Infusion', 'bis zu 7 Minuten',
   'Intensiv regenerierende Feuchtigkeitsmaske, wahlweise wöchentlich statt des Conditioners oder als Intensivkur. Zieht tief ins Haar ein, repariert beanspruchtes Haar langfristig und stellt die Haarstruktur wieder her. Mit zertifiziertem, organischem Arganöl und Leinsamenöl.

Wirkung:
- baut beanspruchtes, strukturverändertes Haar langfristig auf
- besonders intensive Pflege für dickes, undiszipliniertes Haar
- regeneriert und revitalisiert
- verleiht Glanz und Geschmeidigkeit
- schützt vor schädlichen Umwelteinflüssen, ohne das Haar zu beschweren

Anwendung: Eine kleine Menge auf frisch gewaschene, handtuchtrockene Längen auftragen, sanft einmassieren und gleichmäßig verteilen. Bis zu 7 Minuten einwirken lassen, je nach Bedürfnis des Haares oder für einen stark restrukturierenden Effekt.

Frei von: Phosphate, Parabene.
Inhaltsstoffe: Aqua (Wasser), Cetearylalkohol, Quaternium-80, Cetrimoniumchlorid, Glycerin, Phenyltrimethicon, Cetylalkohol, Argania Spinosa Kernel (Argan) Öl, Linum Usitatissimum Samen (Leinsamen) Öl, Propylenglykol, Parfüm (Duft), Amodimethicon, Trideceth-12, Chamomilla recutita (Matricaria)-Blütenextrakt, Tocopherylacetat, Aloe-Barbadensis-Blattextrakt, Macadamia-ternifolia-Samenöl, Crataegus Oxyacantha (Weißdorn)-Extrakt, Behentrimoniummethosulfat, Zitronensäure, Phenoxyethanol, Ethylhexylglycerin, Hydroxycitronellal, Limonen, Linalool.'),
  ('Instant Mask', 'keine Einwirkzeit, ohne Ausspülen',
   'Feuchtigkeitsspendende Sprühpflege, die im Haar bleibt. Stärkt selbst feinstes Haar, beugt Spliss vor und schützt vor der Hitze von Glätteisen und Föhn. Dank ultraleichter Formel auch auf trockenem Haar anwendbar. Mit zertifiziertem, organischem Arganöl und Leinsamenöl.

Wirkung:
- Repair- und Feuchtigkeitskur
- Hitzeschutz vor Föhn und Glätteisen
- beugt Spliss vor
- diszipliniert krauses Haar
- macht feines Haar leichter kämmbar
- auch auf trockenem Haar anwendbar

Anwendung: Nach der Haarwäsche auf frisch gewaschenes, handtuchtrockenes Haar sprühen, mit einem Kamm in Längen und Spitzen verteilen, nicht ausspülen, wie gewohnt stylen. Jederzeit auch auf trockenes Haar sprühen und mit den Händen verteilen, um neuen Schwung zu geben.

Frei von: Phosphate, Parabene.
Inhaltsstoffe: Aqua (Wasser), Cetearylalkohol, Behentrimoniumchlorid, Parfum (Duft), Argania Spinosa Kernel (Argan) Öl, hydrolysierte Seide, Linum usitatissimum Samen (Leinsamen) Öl, Panthenol, Ethylhexyl Methoxycinnamate, Quaternium-80, Propylenglykol, Cyclopentasiloxan, Phenoxyethanol, Ethylhexylglycerin, Milchsäure, Hydroxycitronellal, Limonen, Citronellol, Linalool.')
) as v(titel, einwirk, anleitung)
left join lateral (
  select t.email from public.teamapp_persons t
  where t.rolle = 'inhaberin' and t.aktiv = true
  order by t.email
  limit 1
) i on true
where not exists (
  select 1 from public.wissensbank_rezepturen r
  where r.titel = v.titel and r.produkt_marke = 'Nashi Argan'
);

-- ════════════════════════════════════════════════════════════
--  Wissensbank — Artikel "HaarKompass in der Beratung"
--
--  Ein freigegebener Artikel in wissensbank_artikel (Kategorie
--  "Beratung"): wofür der HaarKompass da ist, wie man ihn im Salon
--  mit der Kundin/dem Kunden nutzt, Link zum Beratungs-Werkzeug,
--  die wichtigsten Regeln und Sätze auf Deutsch und Englisch.
--
--  Keine neue Tabelle, keine Änderung an RLS/Policies. Ersteller ist
--  die aktive Inhaberin aus teamapp_persons (keine E-Mail hartcodiert,
--  CLAUDE.md Regel 2).
--
--  Im Supabase SQL-Editor ausführen. Sicher mehrfach ausführbar:
--  Der Artikel wird nur angelegt, wenn es den Titel noch nicht gibt.
-- ════════════════════════════════════════════════════════════

insert into public.wissensbank_artikel
  (titel, kategorie, inhalt, status, ersteller_email, ersteller_name, freigegeben_von, freigegeben_am)
select
  'HaarKompass in der Beratung', 'Beratung',
$txt$Der HaarKompass ist unser ehrlicher Pflege-Guide: 7 Fragen zu Haar, Kopfhaut und Alltag, danach eine Pflege-Routine mit Begründung. Kund:innen nutzen ihn zu Hause auf greathairday.at/haarkompass/ (Deutsch und Englisch). Im Salon nutzt du die Team-Version mit unseren Salonprodukten.

WERKZEUG FÜR DEN SALON
https://mirjamwalenta-a11y.github.io/Mitarbeiterhandbuch/haarkompass-beratung.html
(auch verlinkt im Handbuch, Kapitel 05 Haar- und Kopfhautpflege)

SO GEHST DU VOR
1. Fragen gemeinsam beantworten (dauert unter 2 Minuten). Hat die Kundin/der Kunde den HaarKompass schon zu Hause gemacht: Link einfügen, dann ist alles ausgefüllt.
2. Sprache wählen: Deutsch oder English.
3. Den Satz unter „So erklärst du es“ sagen. Dann die Salonprodukte zeigen, jedes mit einem kurzen Grund.
4. Auf Wunsch den Link kopieren und der Kundin/dem Kunden schicken. Dort steht die Routine ohne Marken.

DIE 3 TEILE DER EMPFEHLUNG
- Basis-Routine: Shampoo, Conditioner, bei täglicher Hitze Hitzeschutz. Die Kopfhaut bestimmt das Shampoo, Haarstärke, Haarform und Zustand bestimmen den Conditioner.
- Spezial-Impuls: höchstens 1 Extra (plus 1 optionales). Jedes Extra sammelt Punkte aus den Antworten, das beste wird ab 3 Punkten empfohlen.
- Was weggelassen werden kann: Wir sagen ehrlich, was die Kundin/der Kunde NICHT braucht. Das schafft Vertrauen.

REGELN, DIE DU KENNEN SOLLTEST
- Schuppen oder trockene Kopfhaut? Trocken: kleine, weiße, puderfeine Schüppchen, Kopfhaut spannt. Schuppen: größer, gelblich, leicht fettig, haften, jucken. Nur echte Schuppen brauchen Anti-Schuppen-Shampoo.
- Feines Haar oder fettende Kopfhaut: kein Haaröl, keine schweren Seren.
- Spliss lässt sich nicht reparieren, nur schneiden (alle 8–12 Wochen).
- Silbershampoo nur bei blondiertem Haar (bei grauem/weißem Naturhaar: Silver).
- Molecular-Repair nur bei Blondierung, Dauerwelle oder starkem Hitzeschaden, am besten im Salon direkt beim Färben.
- Glattes Haar + Wunsch Locken: ehrlich sagen, dass kein Produkt Locken macht. Locken auf Zeit oder Umformung im Salon.
- Bei Schuppen oder empfindlicher Kopfhaut, die nach 4 Wochen nicht besser wird: zum Hautarzt.

AUF ENGLISCH ERKLÄREN (die wichtigsten Sätze)
- "Let me ask you seven quick questions about your hair and scalp." = Ich stelle dir sieben kurze Fragen zu Haar und Kopfhaut.
- "For your hair I recommend a mild, color-safe shampoo." = Für dein Haar empfehle ich ein mildes, farbschonendes Shampoo.
- "Your scalp comes first." = Bei dir zuerst die Kopfhaut.
- "You don't need this." = Das brauchst du nicht.
- "Split ends can't be repaired, only cut." = Spliss kann man nicht reparieren, nur schneiden.
- "Use heat protection before every blow-dry." = Vor jedem Föhnen Hitzeschutz verwenden.
- "Apply it to the lengths and ends only, keep it off the roots." = Nur in Längen und Spitzen, nicht an den Ansatz.
- "Leave it on for two to three minutes." = 2–3 Minuten einwirken lassen.
- Fachbegriffe: Spezial-Impuls = special boost, Ansatz = roots, Längen = lengths, Spitzen = ends, Kopfhaut = scalp, kräftiges Haar = coarse hair, feines Haar = fine hair, Schuppen = dandruff, Gelbstich = brassiness, Hitzeschutz = heat protection.

Im Lernquiz gibt es dazu Fragen unter „Beratungsgespräch & Kundenkommunikation“ und „Englisch im Salon“.$txt$,
  'freigegeben', coalesce(i.email, 'katalog-import'), 'HaarKompass',
  coalesce(i.email, 'katalog-import'), now()
from (select 1) x
left join lateral (
  select t.email from public.teamapp_persons t
  where t.rolle = 'inhaberin' and t.aktiv = true
  order by t.email
  limit 1
) i on true
where not exists (
  select 1 from public.wissensbank_artikel w where w.titel = 'HaarKompass in der Beratung'
);

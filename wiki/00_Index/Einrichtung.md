# Laufzettel: Wiki-Einrichtung Mitarbeiterhandbuch

## Stand

**Abgeschlossen (alle 6 Schritte).** Schritt 6: Abnahme mit den 17 Testfragen über
einen unabhängigen Agenten (ohne Zugriff auf Testfragen.md) durchgespielt.
Trefferquote 17/17, beide Fangfragen bestanden (nichts erfunden). Skill liegt
bereit unter `wiki-skill/` bzw. als `wiki-mitarbeiterhandbuch.skill`. Noch nicht
committed/gepusht — das Repo `mirjamwalenta-a11y/mitarbeiterhandbuch` ist in
dieser Session nur lesend angebunden; Mirjam entscheidet, ob das ins Repo soll
oder sie die `.skill`-Datei direkt in Cowork installiert.

## Ausgangslage

Quelle: `Mitarbeiterhandbuch_App.html` (Repo `mirjamwalenta-a11y/mitarbeiterhandbuch`),
eine einzelne HTML-Seite mit 20 fest eingebauten Kapiteln, kein Ordner mit
Einzeldokumenten. Die 20 Kapitel + Vorwort + Salon-Info wurden wortgetreu in
Einzeldateien extrahiert (`wiki/`).

## Getroffene Entscheidungen

- Keine zentrale Vorgabe/Praxis-Unterscheidung nötig — das ganze Handbuch ist ein
  einziger Verhaltensstandard, festgelegt von der Inhaberin.
- Kein Rohmaterial-/Eingangsordner — Handbuch ist ein fertiger, abgeschlossener Text,
  keine laufende Sammlung.
- Keine Bilder, keine personenbezogenen Daten außer der Inhaberin (im Text selbst
  namentlich genannt, unproblematisch).
- Profil (Schritt 2), von Mirjam mit "passt alles" bestätigt:
  1. Nutzer:innen: alle Mitarbeiter:innen des Salons
  2. Risiko bei Fehler: Standard wird im Salon falsch gelebt / Mitarbeiter:in verunsichert
  3. Pflege & Freigabe: Mirjam Walenta
  4. Beispielfragen: „Wie begrüße ich am Telefon?", „Was mache ich bei einer
     Reklamation?", „Was ziehe ich an?", „Wie läuft die Dauerwelle ab?", „Was gehört
     zum Teamkodex?"
  5. Fangfragen: fachfremd = „Wie viel Urlaub habe ich?" (steht nicht im Handbuch);
     fachnah noch zu bestimmen (Claude schlägt in Schritt 4 eine aus einer echten
     Lücke im Text vor)

## Offene Punkte

- Keine mehr aus Schritt 3 — Zustimmung zu Kopfblöcken erteilt ("ja das passt so"),
  Kopfblöcke in allen 22 Dateien ergänzt. Umräumen war nicht nötig.
- ID-Präfix `MH-` verwendet: MH-00 (Vorwort), MH-01…MH-20 (Kapitel), MH-INFO
  (Salon-Info). Nächste freie Nummer für ein neues Kapitel: MH-21.
- Zentrale Unterscheidung (nachträglich mit Mirjam geklärt, "Gästekontakt ja,
  Farbservice nein - eher Beratung" → Kategorie umbenannt):
  - **Gästekontakt** (`typ: gaestekontakt`): MH-01, 02, 03, 06, 07, 12, 13, 14, 15,
    16, 17, 18, 19, 20
  - **Beratung** (`typ: beratung`): MH-04, 05, 08, 09, 10, 11
  - MH-00 (Vorwort) und MH-INFO bleiben `typ: standard`, unklassifiziert.

## Angelegte Dateien

- `wiki/00_Vorwort.md`, `wiki/00_Salon-Info.md`, `wiki/01_Kundenempfang.md` …
  `wiki/20_Teamkodex.md` (22 Kapiteldateien, wortgetreu extrahiert)
- `wiki/wiki.json`
- `wiki/README.md` (Wiki-Regeln und Dokumentstandard)
- `wiki/00_Index/INDEX.md`
- `wiki/00_Index/Glossar.md`
- `wiki/00_Index/Aenderungsprotokoll.md`
- `wiki/00_Index/Testfragen.md` (17 Fragen inkl. 2 Fangfragen, 3 Pflege-Szenarien)
- `wiki/00_Index/Einrichtung.md` (dieser Laufzettel)

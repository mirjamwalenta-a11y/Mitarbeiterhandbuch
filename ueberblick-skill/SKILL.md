---
name: mitarbeiterhandbuch-vorstellung
description: >-
  Erklärt, was das Mitarbeiterhandbuch- und Wissensbank-System von A Great Hair Day
  ist, woraus es besteht und wie es entstanden ist. Verwenden bei Meta-Fragen über das
  System selbst: „was ist das hier“, „erklär mir das Mitarbeiterhandbuch“, „was kann
  die Wissensbank“, „wie funktioniert das System“, „stell mir das Projekt vor“, wenn
  ein neues Teammitglied eingeführt wird, oder wenn das Projekt einer anderen Gruppe
  (z. B. einer AI-Gruppe, Interessierten, potenziellen Kund:innen) präsentiert werden
  soll. NICHT verwenden für fachliche Fragen aus dem Wiki oder der Wissensbank selbst
  (Empfang, Beratung, Farbe, Rezepturen, Teamkodex usw.) — dafür den
  wiki-mitarbeiterhandbuch-Skill verwenden. Auch nicht verwenden, um am Wiki oder an
  der App etwas zu ändern — das ist ebenfalls Aufgabe des wiki-mitarbeiterhandbuch-Skills
  bzw. eine reguläre Programmieraufgabe.
---

# Vorstellung: Mitarbeiterhandbuch & Wissensbank (A Great Hair Day)

Diese Datei ist die Antwortgrundlage für Meta-Fragen über das System selbst — nicht
für Fachfragen aus dem Wiki. Beantworte solche Fragen kurz und in der Sprache der
fragenden Person, mit dem Wichtigsten zuerst; biete am Ende an, bei Interesse tiefer
in einen der Punkte zu gehen, anstatt alles auf einmal auszubreiten. Erfinde nichts,
was hier oder im Repository nicht steht — bei Detailfragen, die diese Datei nicht
abdeckt, direkt in den passenden Dateien nachsehen (`CLAUDE.md`, `wiki-skill/SKILL.md`,
`Mitarbeiterhandbuch_App.html`, `supabase/migrations/`).

## Kurzfassung (Elevator Pitch)

A Great Hair Day, ein Friseursalon in Wien, hat sein Mitarbeiterwissen in zwei
miteinander verwandte Systeme gegossen:

1. **Ein Wiki** (Markdown-Dateien) mit einem KI-Assistenten davor, der Alltagsfragen
   aus dem Handbuch beantwortet — immer mit Quellenangabe, nie aus Vorwissen.
2. **Eine Web-App** (`Mitarbeiterhandbuch_App.html`, Supabase-Backend) mit dem
   digitalen Handbuch zum Nachlesen und zwei gemeinsam gepflegten Wissensbanken:
   einer allgemeinen und „Fachwissen Farbe“ für strukturiertes Coloration-Wissen.

Beides ist vollständig im Dialog mit Claude Code entstanden — die Inhaberin hat keine
Zeile Code selbst geschrieben, sondern beschrieben, was sie braucht.

## Baustein 1: Das Wiki + KI-Assistent

- Liegt im Ordner `wiki/`: 21 Kapitel als Markdown-Dateien (`00_Vorwort.md` bis
  `20_Teamkodex.md`), plus `00_Index/` mit Inhaltsverzeichnis, Glossar,
  Änderungsprotokoll und Testfragen.
- Jedes Kapitel ist als `gaestekontakt` (Umgang, Kommunikation) oder `beratung` (die
  eigentliche Behandlung) eingeordnet, mit Status (`freigegeben`, `entwurf`,
  `veraltet`), Version und Prüfdatum im Kopfblock.
- Der Assistent (`wiki-skill/SKILL.md`, verpackt als `wiki-mitarbeiterhandbuch.skill`)
  durchsucht die Dateien, liest die passenden ganz und antwortet mit exakter Quelle
  (z. B. „MH-12, Punkt 12.1, Gästekontakt“). Findet er nichts, sagt er das offen,
  statt zu raten.
- Änderungen laufen über einen Freigabeprozess: Vorschläge landen in `wiki/Eingang/`,
  nur die Inhaberin arbeitet sie ins freigegebene Handbuch ein.

## Baustein 2: Die Web-App

`Mitarbeiterhandbuch_App.html` ist eine Single-Page-App mit echtem Login
(Supabase Auth, Rollen „Mitarbeiter:in“ und „Inhaberin“) und drei Bereichen:

- **Digitales Handbuch** — die Wiki-Kapitel zum Nachlesen direkt in der App.
- **Wissensbank** — Freitext-Artikel zu Betrieb, Produkten & mehr, mit Kategorien
  und Suche. Team reicht ein, Inhaberin gibt frei.
- **Fachwissen Farbe** — strukturiertes Rezeptur-Wissen (Produkt/Marke,
  Mischverhältnis, Einwirkzeit, Anleitung, Warnhinweise) statt Freitext, mit
  Kategorien (Blondierung, Coloration, Tönung, Farbkorrektur, Dauerwelle, Pflege,
  Sonstiges), optionalem Foto-Anhang, Freigabe-Workflow, Bearbeiten-Funktion und
  alphabetischer Sortierung zum schnellen Nachschlagen am Kundenstuhl.

Beide Wissensbanken teilen sich denselben Freigabe-Rhythmus: `entwurf`/`eingereicht`
→ Prüfung durch die Inhaberin → `freigegeben`.

## Ein Praxisbeispiel

13 Fachblätter von L'Oréal Professionnel (Majirel, iNOA, Dia light, Dia color,
Blond Studio) wurden als Fotos geschickt, aus den Bildern strukturiert ausgelesen
(Text und Tabellen) und als geprüfte Einträge in „Fachwissen Farbe“ angelegt — ganz
ohne Abtippen.

## Sicherheit als Grundprinzip, nicht Nachgedanke

Festgehalten in `CLAUDE.md`, verbindlich für jede Änderung:

- Jede neue Datenbank-Tabelle bekommt Row-Level-Security, bevor sie live geht.
- Rollenprüfungen (wer ist Inhaberin) laufen serverseitig, nie nur im Browser-JS.
- Keine Zugangsdaten oder privaten Daten im Klartext, auch nicht als bequeme
  Vorbefüllung eines Feldes.
- Sessions beruhen auf zufälligen, ablaufenden Tokens, nie auf erratbaren IDs.
- Ein wöchentlicher automatischer Check (`rls-audit.yml`) prüft alle Tabellen und
  meldet fehlende Absicherung von selbst.

Diese Regeln entstanden aus echten, am 2026-09-14 gefundenen und behobenen Lücken
(offene Tabelle, erratbare Session-ID, hartcodierte private E-Mail) — Details dazu
stehen in `CLAUDE.md`.

## Wie ist das entstanden?

Nicht programmiert im klassischen Sinn, sondern im Gespräch mit Claude Code gebaut:

1. Anfrage in normaler Sprache („ich möchte ein Foto zur Rezeptur hinzufügen können“).
2. Claude Code plant und baut — Datenbank-Migration, Sicherheitsregeln, Formular.
3. Ein Pull Request auf GitHub macht die Änderung nachvollziehbar und versioniert.
4. Freigabe durch die Inhaberin (ein Klick) — die App ist danach sofort aktuell.

## Wenn mehr gebraucht wird

- Eine Präsentation dieses Überblicks als Folien-Deck existiert bereits
  (im Chat verlinkt) — bei Bedarf danach fragen oder neu erstellen lassen.
- Für Fachinhalte aus dem Wiki oder eine Recherche darin: den
  wiki-mitarbeiterhandbuch-Skill verwenden, nicht diesen hier.

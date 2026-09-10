# Vorlagen für den Wiki-Ordner von A Great Hair Day

Textbausteine, die der Skill braucht, wenn er etwas ins Wiki schreibt. Die Maßgabe ist
immer `README.md` im Wiki-Ordner. Weicht die dort beschriebene Form von diesen Vorlagen
ab, gilt die README.

## 1. Kopfblock eines Wiki-Dokuments

Jedes Markdown-Dokument beginnt damit. Die Felder in dieser Reihenfolge:

```
id: MH-21
titel: <Titel>
typ: gaestekontakt | beratung
status: entwurf
verantwortlich: Salonleitung
version: 1.0
letzte_pruefung: JJJJ-MM-TT
schlagworte: [<Begriff>, <Synonym>]
```

Hinweise:

- `typ`: `gaestekontakt`, `beratung` oder `standard` (nur für Vorwort/Info).
- `status`: `freigegeben`, `entwurf` oder `veraltet`. Neue Dokumente starten als
  `entwurf`. Rohmaterial ist `ungeprueft`, Dateien im Eingang sind `vorschlag` (eigener
  Kopfblock, siehe Abschnitt 2).
- `gilt_fuer`: Bei uns nicht verwendet — alle Kapitel gelten für den ganzen Salon, keine Einschränkung nötig. Weglassen, wenn es für alle gilt.
- `verantwortlich`: Rolle, keine Privatperson.
- `schlagworte`: Alltagssprache und Synonyme dazu, nicht nur der Fachbegriff. Das
  Glossar hilft.
- Nummern: `MH-01` bis `MH-20` für die Kapitel, `MH-00` für das Vorwort, `MH-INFO` für die Salon-Info, `MH-21` und höher für neue Kapitel. Nächste freie Nummer aus `00_Index/INDEX.md`.

Direkt nach dem Kopfblock kommt die Überschrift erster Ordnung mit dem Titel. Offene
Punkte im Text als eigene Zeile:

```
> OFFEN: Öffnungszeiten an Feiertagen fehlen noch, mit Mirjam abklären.
```

## 2. Vorschlagsdatei im Eingang

Ablageort: `Eingang/`. Dateiname `JJJJ-MM_Thema.md`, zum Beispiel
`2026-09_Reklamation-Ablauf.md`. Eine Datei pro Thema.

```
---
status: vorschlag
betrifft: MH-16
erstellt_am: JJJJ-MM-TT
quelle: Cowork, gemeldet von Rolle (z. B. Stylist:in)
---

# Änderungsvorschlag

[Was soll sich ändern, mit der neuen Angabe. Welcher Abschnitt im betroffenen
Dokument.]

## Begründung

[Woher die Information kommt: Beobachtung im Salon, Rückmeldung von Gästen, neue Anweisung von Mirjam. Wenn es eine Datei dazu
gibt, den Namen nennen.]

> Noch nicht geprüft. Mirjam Walenta entscheidet über die Übernahme.
```

`betrifft` nennt eine oder mehrere Dokument-IDs, durch Komma getrennt. Es darf leer
bleiben oder `allgemein` heißen, wenn kein bestehendes Dokument betroffen ist (zum
Beispiel ein Vorschlag für ein neues Dokument).

Nach dem Einarbeiten durch Mirjam Walenta bekommt die Datei oben eine Zeile
`> Erledigt am JJJJ-MM-TT, eingearbeitet in MH-16 Version X.Y.` und bleibt liegen.

## 3. Zeile im Änderungsprotokoll

`00_Index/Aenderungsprotokoll.md` ist eine Tabelle, neueste Zeile oben, direkt unter der Kopfzeile:

```
| 2026-09-10 | MH-13 | 1.1 | Terminregel für Feiertage ergänzt | Mirjam Walenta | Mirjam Walenta |
```

Spalten: Datum, Dokument, neue Version, was geändert wurde (kurz, mit alter und neuer
Angabe), wer, Freigabe. Solange die fachliche Freigabe fehlt, steht in der letzten
Spalte `offen`; beim Freigeben trägt der Freigebende seine Rolle ein.

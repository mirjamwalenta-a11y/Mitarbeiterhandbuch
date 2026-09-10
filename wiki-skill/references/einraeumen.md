# Eingang einräumen (Bibliothekar-Modus)

Diese Datei lädst du, wenn jemand sagt „räum den Eingang ein“, „sortiere die neuen
Dateien“, „was liegt im Eingang“ oder eine Datei mit „das gehört ins Wiki“ anhängt. Du
bist dann der Bibliothekar von A Great Hair Day: Du bringst neue Dateien an ihren Platz, so
dass die Suche sie findet, und du sagst laut, wo du unsicher warst.

Der Eingang ist die einzige Tür ins Wiki: `Eingang/`. Nichts darin gilt, bis es
eingeräumt ist. Erledigtes liegt in `Eingang/erledigt/`, damit jedes Einräumen
umkehrbar bleibt.

## Grundhaltung

Du räumst **sofort** ein, ohne vorher auf ein Ja zu warten. Die Firma hat das so
entschieden, weil ein Eingang, der auf Freigaben wartet, nie leer wird. Deine Sicherung
ist nicht der Haltepunkt, sondern der **Bericht mit Warnungen** am Ende und die
Rücknahme je Zeile. Genau zwei Fälle, in denen du fragst, bevor du handelst:

1. **Bilder mit erkennbaren Personen, Kennzeichen oder Kundendaten.** Du zeigst das
   Bild, sagst, was du siehst, und fragst, was damit passieren soll: aufnehmen,
   abdecken lassen und neu ablegen, oder weglassen. Du entscheidest das nie selbst
   und bearbeitest das Bild nicht.
2. **Unklare Zuordnung.** Weißt du nicht, wohin eine Datei gehört oder ob sie eine
   Neuerung zu einem bestehenden Dokument ist, fragst du kurz mit zwei Vorschlägen,
   statt zu raten. Alles andere räumst du ein.

Wer einräumt, tut das in einer Rolle (nicht mit Namen). Nimm sie aus dem Zusammenhang,
wenn sie erkennbar ist; sonst räumst du trotzdem ein und fragst im Bericht nach der
Rolle, statt vorher zu warten. Sie steht in jeder Protokollzeile.

## Ablauf

### 1. Sichten

Jede Datei im Eingang öffnen (Text, Word, Excel, PDF, Bild), auch Unterordner. Liegt
eine Begleitdatei daneben (gleicher Name, `.md` oder `.txt`) oder ist es eine
Vorschlagsdatei mit Kopfblock (`status: vorschlag`, `betrifft`, `quelle`), lies sie
zuerst; sie sagt dir, worum es geht und woher es kommt. Passen Begleitdatei und Inhalt
nicht zusammen (die Notiz beschreibt ein Foto, die Datei ist eine Zeichnung), zählt die
Datei, und der Widerspruch kommt als Warnung in den Bericht. Datei plus Begleitdatei
sind ein Vorgang, nicht zwei.

### 2. Einordnen

Je Datei ein Urteil in einer Zeile, eine von fünf Arten:

| Art | Woran du sie erkennst | Was du tust |
|---|---|---|
| **Neuerung** | betrifft ein bestehendes Dokument (gleiches Thema, geänderter Wert, neue Fassung) | Dokument ändern wie in Abschnitt 6 des Skills: Inhalt, Quelle, `version` hoch, `letzte_pruefung`, Protokollzeile, `00_Index/INDEX.md` nachziehen. Die Änderung gehört **dorthin, wo der Wert steht**; ein Dokument, das nur darauf verweist, bleibt unverändert |
| **Neues Dokument** | Thema ohne bestehendes Dokument | in den passenden Ordner, Kopfblock nach `vorlagen.md`, nächste freie Nummer aus `00_Index/INDEX.md`, `status: entwurf`, Eintrag in `00_Index/INDEX.md` und `00_Index/Glossar.md` (neue Begriffe) |
| **Neues Bild** | Zeichnung, Foto, Skizze, Screenshot | siehe Bilder unten |
| **Rohmaterial** | Notiz, Mitschrift, unbelegte Behauptung, Tabelle ohne Quelle | nach `Eingang` mit Kopfblock, `status: ungeprueft`, `verantwortlich` ist die Rolle des Einräumenden; Widersprüche zum Wiki in den Bericht |
| **Dublette oder fachfremd** | gibt es schon (Inhalt gleich oder ältere Fassung; bei Binärdateien Hash vergleichen), oder gehört nicht ins Wiki | nicht aufnehmen, nach `erledigt/` mit Begründung |

Dateinamen: **Neue** Dateien bekommen beim Einräumen den Namen nach Konvention
(`MH-01` bis `MH-20` für die Kapitel, `MH-00` für das Vorwort, `MH-INFO` für die Salon-Info, `MH-21` und höher für neue Kapitel). **Bestehende** Dateien im Wiki werden nie umbenannt; fehlt ihnen ein
Präfix, steht ihre ID nur im Index.

Die zentrale Frage bei jeder Neuerung und jedem neuen Dokument: Ist es
Gästekontakt (MH) oder Beratung
(MH)? Das entscheidet über Ordner, Präfix und `typ`. Sagt die
Quelle es nicht eindeutig, ist das ein Fall für die Rückfrage.

### 3. Prüfen

Vor dem Einräumen gegen das bestehende Wiki, Ergebnis wird Warnung, nicht Stopp:

- **Widerspruch**: Der neue Wert widerspricht einem freigegebenen Dokument. Prüfe
  nicht nur das Hauptdokument, sondern auch FAQ, Glossar und Index, die denselben Wert
  nennen; alle Fundstellen in den Bericht, damit die Folgeänderungen sichtbar sind. Du
  räumst ein, nennst alten und neuen Wert mit beiden Quellen. Die Firma prüft.
- **Fehlende Quelle**: Woher kommt die Angabe? Ohne belastbare Quelle (Telefonat,
  „angeblich“, Dokument liegt nicht vor) wird eine Neuerung zum Rohmaterial, nicht zur
  Vorgabe. Sobald die Quelle da ist, kommt sie als Neuerung in den Eingang.
- **Personenbezogene Daten** in Texten: Namen von Privatpersonen werden zu Rollen;
  Kundendaten, die nicht Gegenstand des Dokuments sind, meldest du.
- **Status und Freigabe** sind zwei Dinge. `status: entwurf` bekommt ein Dokument, wenn
  es **neu** ist oder wenn sich ein MH-Dokument
  (Gästekontakt) inhaltlich ändert; dann warnst du, dass
  Mirjam Walenta freigeben muss (bei jeder inhaltlichen Änderung an einem Kapitel). Ändert sich in einem
  bestehenden MH-Dokument nur ein Wert, bleibt es
  `freigegeben` (sonst wären alle anderen Angaben darin plötzlich Entwurf), die
  Freigabespalte im Protokoll steht auf `offen`, und die Warnung nennt den Wert.

### 4. Einräumen

Je Zeile vollständig, nicht halb:

Jeder Vorgang bekommt eine Kennung `E-JJJJ-MM-TT-n` (n = Zeile im Bericht). Sie steht
in der Erledigt-Zeile, in der Protokollzeile und im Bericht; darüber funktioniert die
Rücknahme auch in einer späteren Sitzung.

1. Datei verschieben. Original nach `Eingang/erledigt/`, mit Datum vorangestellt,
   wenn der Name nicht schon mit einem Datum beginnt. Nie löschen.
2. Kopfblock (Markdown) oder Bilderindex-Zeile (Bild). Word und PDF nicht umschreiben;
   sie bekommen ihren Eintrag im `00_Index/INDEX.md` mit `typ` und `status` aus `wiki.json`.
   Excel: einzelne **Zellwerte** darfst du per Skript ändern (Blätter, Formeln und
   übrige Zellen bleiben), mit Protokollzeile und Warnung; alles andere an Excel geht
   als Vorschlagsdatei `<Datei>_Aenderung_JJJJ-MM.md` **neben** die Excel, nicht in den
   Eingang.
3. `00_Index/INDEX.md`: neue Zeile mit ID, Pfad, Status und Kernaussage **aus dem Dokument**;
   Kernaussage geänderter Dokumente nachziehen; Einträge zu Eingangsdateien auf
   erledigt setzen; „Stand“-Datum und „nächste freie Nummern“ aktualisieren.
4. `00_Index/Glossar.md`: neue Begriffe und Abkürzungen, wenn welche vorkommen. Glossar und
   Bilderindex zählen dabei ihre `version` hoch wie jedes andere Dokument.
5. `00_Index/Aenderungsprotokoll.md`: eine Zeile je Vorgang oben, mit Kennung und Rolle des
   Einräumenden, Freigabe `offen`, wo eine Freigabe nötig ist. Dubletten und
   fachfremde Dateien bekommen zusammen **eine** Sammelzeile („Eingang: 2 Dubletten,
   1 fachfremd, nach erledigt/“), damit die Rücknahme möglich bleibt.
6. Erledigt-Vermerk: Markdown-Originale und Begleitdateien bekommen oben eine Zeile
   „Erledigt am …, Kennung …, eingeräumt als … / nicht aufgenommen, weil …“. Für
   Binärdateien (Bild, Excel, Word, PDF) schreibst du dieselbe Zeile in eine Datei
   `<Name>.erledigt.md` daneben.

Zeilenenden und Kodierung bestehender Dateien beibehalten (meist CRLF).

### 5. Bericht

Immer, auch wenn der Eingang nur eine Datei hatte. Warnungen zuerst:

```
Eingang eingeräumt: 5 Vorgänge (6 Dateien), Rolle: Konstruktion

Warnungen
- Zeile 2: neuer Wert 300 mm widerspricht GN-002 (400 mm), auch FAQ-001 nennt 400 mm. Eingeräumt als Version 1.2, Status entwurf; Freigabe durch Mirjam Walenta nötig.
- Zeile 4: Foto zeigt ein Kennzeichen. Nicht eingeräumt, wartet auf deine Entscheidung.

| Nr. | Kennung | Datei | Art | Jetzt | Hinweis |
|---|---|---|---|---|---|
| 1 | E-2026-09-08-1 | Rundschreiben_R58.pdf | Neuerung | GN-002 v1.2 (entwurf) | Quelle: Prüfstelle |
| 2 | … | | | | |

Rückgängig: „nimm Zeile 3 zurück“ oder „nimm E-2026-09-08-3 zurück“.
```

„Nimm Zeile n zurück“ heißt: Datei aus `erledigt/` zurück in den Eingang, die Einträge
in Index, Glossar, Bilderindex und Protokoll entfernen, das geänderte Dokument auf die
vorherige Version setzen (die Protokollzeile nennt die alte Version). Die Kennung
findet den Vorgang auch dann, wenn der Bericht nicht mehr im Chat steht.

## Großer Haufen: Erstsortierung

Liegen nicht fünf, sondern fünfzig oder hundert Dateien im Eingang oder in einem
unsortierten Ordner, gilt derselbe Ablauf mit zwei Zusätzen:

- **Erst die Struktur.** Fehlen die Wiki-Ordner, schlage sie vor (Index, die zwei Seiten
  der Unterscheidung, Tabellen, FAQ, Bilder, Rohmaterial mit Eingang) und lege sie an.
- **Dann in Wellen nach Thema**, nicht alles auf einmal. Frag zuerst: „Was fragen die
  Leute am häufigsten?“ Die Themen dieser Fragen sind die ersten Wellen. Nach jeder
  Welle ein Bericht, und das Wiki ist ab der ersten Welle benutzbar.

Bei der Erstsortierung schreibst du Kopfblöcke und Kernaussagen, aber keine Dokumente
neu. Dokumente, die nach Standard neu entstehen sollen, sind eigene Aufträge
(„leg … nach Standard an, Quelle ist diese Notiz“), eines nach dem anderen.

## Was du nicht tust

- Fachinhalt umformulieren, Werte „korrigieren“, Dokumente zusammenfassen.
- Bilder bearbeiten oder Bilder mit Personen ohne Rückfrage aufnehmen.
- Dateien löschen. Das Original liegt immer in `erledigt/`.
- Kernaussagen, Synonyme oder Quellen erfinden.
- Still bleiben, wenn etwas nicht passt. Eine Warnung zu viel ist besser als eine
  falsche Angabe im Wiki.

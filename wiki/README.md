# Wissensdatenbank A Great Hair Day – Wiki-Regeln

## Zweck

Dieses Wiki ist die Quelle für alle Mitarbeiter:innen des Salons (Stylist:innen und
Rezeption), wenn es um Fragen wie diese geht:

- „Wie begrüße ich am Telefon?"
- „Was mache ich bei einer Reklamation?"
- „Was ziehe ich an?"
- „Wie läuft die Dauerwelle ab?"
- „Was gehört zum Teamkodex?"

Ziel: Standards im Salon einheitlich leben, unabhängig davon, wer gerade da ist oder
wie lange jemand schon dabei ist.

## Ordnerstruktur

| Ordner | Inhalt | Typische Dateien |
|---|---|---|
| `00_Index` | Inhaltsverzeichnis, Fragen/Situationen, Glossar, Änderungsprotokoll, Testfragen, Laufzettel | `INDEX.md`, `Fragen-und-Situationen.md`, `Glossar.md` |
| `.` (Wiki-Ordner) | Die 20 Kapitel des Mitarbeiterhandbuchs, Vorwort, Salon-Info | `01_Kundenempfang.md` … `20_Teamkodex.md` |

Es gibt hier keine Vorgabe/Praxis-Unterscheidung wie bei anderen Firmen (z. B. Gesetz
vs. interne Anweisung). Stattdessen zwei fachliche Kategorien:

- **Gästekontakt** (`typ: gaestekontakt`) — Umgang, Kommunikation, Auftreten: Empfang,
  Einstiegs- und Beratungsgespräch, Neukundenbetreuung, Service, Telefon, Termin,
  Kasse, Verabschiedung, Reklamationen, Beschwerden, Auftreten, Teamkodex.
- **Beratung** (`typ: beratung`) — die eigentliche Behandlung: Haarwäsche, Haar- und
  Kopfhautpflege, Haare schneiden, Styling/Finish, Farbbehandlung, Dauerwelle.

Vorwort und Salon-Info sind Infotexte ohne diese Einordnung (`typ: standard`).

## Dokumentstandard (gilt für jedes Wiki-Dokument)

Jedes Markdown-Dokument beginnt mit einem Kopfblock:

    ---
    id: MH-01
    titel: Kundenempfang
    typ: gaestekontakt
    status: freigegeben
    verantwortlich: Salonleitung
    version: 1.0
    letzte_pruefung: 2026-09-10
    schlagworte: [Empfang, Begrüßung, Neukund:innen]
    ---

Regeln:

1. **Ein Thema = ein Dokument.** Jedes Kapitel bleibt für sich.
2. **Nichts erfinden.** Jede Aussage kommt aus dem Handbuch selbst.
3. **Schlagworte in der Sprache des Alltags.** Auch Abkürzungen, so wie im Salon
   tatsächlich gesprochen wird.
4. **Status pflegen.** Wird ein Kapitel überarbeitet, bekommt die alte Fassung
   `status: veraltet` und einen Verweis auf die neue.
5. **Keine personenbezogenen Daten von Kund:innen oder Mitarbeiter:innen.** Rollen
   statt Namen (Ausnahme: die Inhaberin selbst, die im Handbuch namentlich auftritt).

## Pflegeprozess

| Schritt | Wer | Wann |
|---|---|---|
| Neue Info oder Änderung am Standard entdeckt | jedes Teammitglied | laufend, bei Mirjam melden |
| Prüfen und ins Wiki einarbeiten | Mirjam Walenta | bei Bedarf |
| Fachliche Freigabe | Mirjam Walenta | vor jeder inhaltlichen Änderung |
| Eintrag im `Aenderungsprotokoll.md` | wer ändert | bei jeder Änderung |

## Nutzung mit Claude (Cowork)

1. Diesen Ordner in Cowork verbinden.
2. Frage stellen, so wie man sie im Alltag stellen würde.
3. Claude antwortet nur aus den Wiki-Dokumenten und nennt die Quelldatei. Steht etwas
   nicht im Wiki, sagt es das und rät nicht.

Testfragen: `00_Index/Testfragen.md`.

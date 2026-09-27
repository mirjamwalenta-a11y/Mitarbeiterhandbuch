# Sicherheits-Check: RLS und Logins

Kurze Checkliste für jede Änderung, die eine neue Tabelle oder einen neuen
Login-Weg einführt (siehe `CLAUDE.md`), plus die Einrichtung der
automatischen wöchentlichen Prüfung.

## Checkliste vor dem Merge

- [ ] Jede neue Tabelle: `ALTER TABLE … ENABLE ROW LEVEL SECURITY` im selben Schritt wie `CREATE TABLE`.
- [ ] Unsicher bei der Policy? Erst **keine** anon-Policy anlegen und nachfragen.
- [ ] Chefin-Rechte nur serverseitig (RLS, `teamapp_ist_inhaberin()`, SECURITY DEFINER-Funktion, Edge Function) — nie nur `if (istChefin())` im Browser.
- [ ] Keine Zugangsdaten, Schlüssel (außer dem öffentlichen anon-Key) oder privaten Daten in Code, Kommentaren oder Vorbefüllungen.
- [ ] Sessions nur mit zufälligem, ablaufendem Token.
- [ ] Edge Functions, die Claude aufrufen: Modell, Anleitung und Länge fest auf dem Server, Browser schickt nur `zweck` + Text, Login und Rolle werden geprüft (Muster: `rapid-service` im Team-Repo).
- [ ] Mitarbeiter:in scheidet aus: in den Apps austragen **und** die Supabase-Logins sperren (Authentication → Users → Ban/Delete).

## Automatische Prüfung (`.github/workflows/rls-audit.yml`)

Läuft jeden Montag und auf Knopfdruck (Actions → RLS-Audit → Run workflow).
Sie liest nur die Systemkataloge (`supabase/rls-audit.sql`) und legt bei einem
Fund ein Issue mit dem Label `rls-audit` an (oder kommentiert das offene):

- **OHNE_RLS** — Tabelle ohne Row Level Security. Sofort beheben.
- **ANON_OFFEN** — Policy lässt anon ohne Bedingung durch. Kann gewollt sein,
  bitte prüfen. Ist sie gewollt, in `supabase/rls-audit.sql` in die Liste der
  bewusst offenen Policies eintragen (dort steht schon
  `abw_team_anon_login_view` für die Login-Auswahl).

### Einrichtung (einmalig)

1. **Prüf-Konto anlegen**, das nur nachschauen, aber keine Daten lesen darf.
   Im Supabase SQL-Editor ausführen und dabei ein eigenes, langes Passwort
   einsetzen (nirgends sonst speichern als im GitHub-Secret):

   ```sql
   create role rls_audit login password 'HIER-EIN-LANGES-ZUFÄLLIGES-PASSWORT';
   ```

   Die Rolle bekommt keine weiteren Rechte. Die Systemkataloge
   (`pg_class`, `pg_policies`) darf in Postgres jede Rolle lesen, Tabellen nicht.

2. **Verbindungs-URL bauen**: Supabase → Project Settings → Database →
   Connection string → **Session pooler** (GitHub-Runner können die direkte
   Verbindung nicht erreichen). Darin den Benutzer durch
   `rls_audit.wrxlaltgtgkdomklgrlj` und das Passwort durch das aus Schritt 1
   ersetzen. Ergebnis sieht so aus:

   ```
   postgresql://rls_audit.wrxlaltgtgkdomklgrlj:PASSWORT@aws-0-….pooler.supabase.com:5432/postgres
   ```

3. **Als Secret speichern**: GitHub → dieses Repo → Settings → Secrets and
   variables → Actions → New repository secret, Name `SUPABASE_DB_URL`.

4. **Testlauf**: Actions → RLS-Audit → Run workflow. Grün ohne Issue heißt:
   nichts gefunden. Ein Issue mit Funden heißt: prüfen.

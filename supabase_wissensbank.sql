-- ════════════════════════════════════════════════════════════
--  Wissensbank — editierbare Wissensdatenbank im Mitarbeiterhandbuch
--
--  Ergänzt die 20 fixen Handbuch-Kapitel um frei erweiterbare
--  Artikel, die Mirjam (Rolle "inhaberin") direkt veröffentlichen
--  kann und die das Team (Rolle "mitarbeiter") als Vorschlag
--  einreichen kann. Nutzt dieselbe Supabase-Instanz und dieselbe
--  Rollen-Tabelle (teamapp_persons) wie team.html/lernquiz.html —
--  Team-Mitglieder melden sich mit ihrem bestehenden Account an.
--
--  Diese Datei muss von einem Menschen mit Supabase-Zugriff
--  ausgeführt werden (SQL-Editor im Supabase-Dashboard, Projekt
--  wrxlaltgtgkdomklgrlj). Sicher mehrfach ausführbar.
-- ════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.wissensbank_artikel (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titel text NOT NULL,
  kategorie text,
  inhalt text NOT NULL,
  status text NOT NULL DEFAULT 'entwurf'
    CHECK (status IN ('entwurf', 'eingereicht', 'freigegeben')),
  ersteller_email text NOT NULL,
  ersteller_name text,
  erstellt_am timestamptz NOT NULL DEFAULT now(),
  aktualisiert_am timestamptz NOT NULL DEFAULT now(),
  freigegeben_von text,
  freigegeben_am timestamptz
);

CREATE INDEX IF NOT EXISTS wissensbank_artikel_status_idx ON public.wissensbank_artikel (status);

ALTER TABLE public.wissensbank_artikel ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Lesen: freigegeben, eigene, oder Inhaberin" ON public.wissensbank_artikel;
CREATE POLICY "Lesen: freigegeben, eigene, oder Inhaberin" ON public.wissensbank_artikel
  FOR SELECT TO authenticated
  USING (
    status = 'freigegeben'
    OR ersteller_email = (auth.jwt() ->> 'email')
    OR EXISTS (
      SELECT 1 FROM public.teamapp_persons tp
      WHERE tp.email = (auth.jwt() ->> 'email') AND tp.rolle = 'inhaberin'
    )
  );

DROP POLICY IF EXISTS "Einfügen: nur eigene E-Mail, Status je nach Rolle" ON public.wissensbank_artikel;
CREATE POLICY "Einfügen: nur eigene E-Mail, Status je nach Rolle" ON public.wissensbank_artikel
  FOR INSERT TO authenticated
  WITH CHECK (
    ersteller_email = (auth.jwt() ->> 'email')
    AND (
      status IN ('entwurf', 'eingereicht')
      OR EXISTS (
        SELECT 1 FROM public.teamapp_persons tp
        WHERE tp.email = (auth.jwt() ->> 'email') AND tp.rolle = 'inhaberin'
      )
    )
  );

DROP POLICY IF EXISTS "Bearbeiten: eigene (nicht freigegeben) oder Inhaberin" ON public.wissensbank_artikel;
CREATE POLICY "Bearbeiten: eigene (nicht freigegeben) oder Inhaberin" ON public.wissensbank_artikel
  FOR UPDATE TO authenticated
  USING (
    (ersteller_email = (auth.jwt() ->> 'email') AND status <> 'freigegeben')
    OR EXISTS (
      SELECT 1 FROM public.teamapp_persons tp
      WHERE tp.email = (auth.jwt() ->> 'email') AND tp.rolle = 'inhaberin'
    )
  )
  WITH CHECK (
    (ersteller_email = (auth.jwt() ->> 'email') AND status IN ('entwurf', 'eingereicht'))
    OR EXISTS (
      SELECT 1 FROM public.teamapp_persons tp
      WHERE tp.email = (auth.jwt() ->> 'email') AND tp.rolle = 'inhaberin'
    )
  );

DROP POLICY IF EXISTS "Löschen: eigene (nicht freigegeben) oder Inhaberin" ON public.wissensbank_artikel;
CREATE POLICY "Löschen: eigene (nicht freigegeben) oder Inhaberin" ON public.wissensbank_artikel
  FOR DELETE TO authenticated
  USING (
    (ersteller_email = (auth.jwt() ->> 'email') AND status <> 'freigegeben')
    OR EXISTS (
      SELECT 1 FROM public.teamapp_persons tp
      WHERE tp.email = (auth.jwt() ->> 'email') AND tp.rolle = 'inhaberin'
    )
  );

-- Bewusst KEINE Policy für anon — anonymes Lesen/Schreiben ist damit
-- für alle Befehle gesperrt, RLS ohne passende Policy verweigert per Default.

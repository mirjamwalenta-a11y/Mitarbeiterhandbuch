-- ════════════════════════════════════════════════════════════
--  Fachwissen Farbe — Foto-Anhang für Rezepturen
--
--  Neue Spalte bild_pfad + privater Storage-Bucket, RLS von
--  Anfang an aktiv (CLAUDE.md Regel 1). Der Bucket ist NICHT
--  public: jedes Objekt liegt unter "<rezeptur_id>/<dateiname>",
--  und die Storage-Policies spiegeln exakt dieselbe Sichtbarkeit
--  wie rezepturen_select/-update/-delete auf der Tabelle selbst
--  (freigegeben, eigener Entwurf, oder Inhaberin) — kein Gast/
--  keine unbeteiligte Person kann ein Foto erraten oder auflisten.
--
--  Sicher mehrfach ausführbar (idempotent).
-- ════════════════════════════════════════════════════════════

alter table public.wissensbank_rezepturen
  add column if not exists bild_pfad text;

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('rezeptur-bilder', 'rezeptur-bilder', false, 5242880, array['image/jpeg', 'image/png', 'image/webp'])
on conflict (id) do nothing;

-- Lesen: wie rezepturen_select — freigegeben, eigener Entwurf/
-- Vorschlag, oder Inhaberin.
drop policy if exists "rezeptur_bilder_select" on storage.objects;
create policy "rezeptur_bilder_select" on storage.objects
  for select to authenticated
  using (
    bucket_id = 'rezeptur-bilder'
    and exists (
      select 1 from public.wissensbank_rezepturen r
      where r.id::text = (storage.foldername(name))[1]
        and (
          r.status = 'freigegeben'
          or r.ersteller_email = auth.email()
          or public.teamapp_ist_inhaberin()
        )
    )
  );

-- Hochladen: nur zur eigenen Rezeptur (Ersteller:in) oder durch
-- die Inhaberin. Die Zeile in wissensbank_rezepturen muss dafür
-- bereits angelegt sein — das Formular legt erst die Zeile an und
-- lädt danach das Foto in <id>/... hoch.
drop policy if exists "rezeptur_bilder_insert" on storage.objects;
create policy "rezeptur_bilder_insert" on storage.objects
  for insert to authenticated
  with check (
    bucket_id = 'rezeptur-bilder'
    and exists (
      select 1 from public.wissensbank_rezepturen r
      where r.id::text = (storage.foldername(name))[1]
        and (r.ersteller_email = auth.email() or public.teamapp_ist_inhaberin())
    )
  );

-- Löschen: wie rezepturen_delete — eigener, noch nicht
-- freigegebener Eintrag, oder Inhaberin. Wird beim Löschen/
-- Ablehnen der Rezeptur mitgenutzt, damit keine verwaisten
-- Fotos im Bucket zurückbleiben.
drop policy if exists "rezeptur_bilder_delete" on storage.objects;
create policy "rezeptur_bilder_delete" on storage.objects
  for delete to authenticated
  using (
    bucket_id = 'rezeptur-bilder'
    and exists (
      select 1 from public.wissensbank_rezepturen r
      where r.id::text = (storage.foldername(name))[1]
        and (
          (r.ersteller_email = auth.email() and r.status <> 'freigegeben')
          or public.teamapp_ist_inhaberin()
        )
    )
  );

// Service Worker dieser App: macht sie offline nutzbar.
// Die eigentliche Logik (Dateien merken, Supabase-Daten merken, Änderungen
// ohne Netz in einer Warteschlange sammeln und nachschicken, Konfliktregel
// „nichts überschreiben“) steckt zentral in ghd-offline-sw.js im Repo
// abwesenheiten-ghd und gilt für alle Great-Hair-Day-Apps gleich.
// Neue Seiten/Dateien dieser App hier bei `vorab` ergänzen.
self.GHD_OFFLINE = {
  app: 'handbuch',
  version: '2026-11-09a',
  start: './Mitarbeiterhandbuch_App.html',
  vorab: [
    './',
    './Mitarbeiterhandbuch_App.html',
    './manifest.json',
    './haarkompass-beratung.html',
    './haarkompass-produkte.js',
    './farbkompass-team.html',
    'https://mirjamwalenta-a11y.github.io/index.greathairday/farbkompass-kern.js',
    'https://mirjamwalenta-a11y.github.io/index.greathairday/ghd-verzeichnis.js',
    'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js',
    'https://mirjamwalenta-a11y.github.io/abwesenheiten-ghd/icon-512.png'
  ]
};
// HaarKompass-Beratung: Regelwerk und Übersetzung kommen von greathairday.at
// (andere Adresse, die der gemeinsame Teil nicht speichert). Hier: erst Netz,
// damit immer dieselbe Empfehlung wie für Kund:innen gilt; ohne Netz der
// zuletzt geladene Stand. Muss VOR importScripts stehen, damit dieser
// Abruf-Handler zuerst drankommt.
(function () {
  var HK = 'https://www.greathairday.at/haarkompass/';
  var HK_CACHE = 'ghd-haarkompass-regelwerk';
  var HK_DATEIEN = ['engine.js', 'en.js', 'wasser.js'];
  self.addEventListener('install', function (event) {
    event.waitUntil(caches.open(HK_CACHE).then(function (cache) {
      return Promise.all(HK_DATEIEN.map(function (d) {
        return fetch(new Request(HK + d, { mode: 'no-cors', cache: 'reload' }))
          .then(function (res) { if (res.ok || res.type === 'opaque') return cache.put(HK + d, res); })
          .catch(function () { /* ohne Netz bei der Installation: beim nächsten Öffnen */ });
      }));
    }));
  });
  self.addEventListener('fetch', function (event) {
    var req = event.request;
    if (req.method !== 'GET' || req.url.indexOf(HK) !== 0 || !/\.js$/.test(new URL(req.url).pathname)) return;
    event.respondWith(caches.open(HK_CACHE).then(function (cache) {
      return fetch(req).then(function (res) {
        if (res.ok || res.type === 'opaque') cache.put(req.url, res.clone());
        return res;
      }).catch(function () {
        return cache.match(req.url).then(function (t) { return t || Response.error(); });
      });
    }));
  });
})();
importScripts('https://mirjamwalenta-a11y.github.io/abwesenheiten-ghd/ghd-offline-sw.js');

/* ==================================================================
   Test: HaarKompass-Produktzuordnung (haarkompass-produkte.js)

   Rechnet alle Antwort-Kombinationen des HaarKompass durch und prüft:
   - jede Produktart, die empfohlen werden kann, steht in HK_PRODUKTE
   - Produkte haben Marke, Name und einen Grund auf Deutsch + Englisch
   - "fuer"-Filter nennen nur echte Fragen/Antworten
   - kein Filter führt dazu, dass eine Produktart ohne Produkt bleibt,
     obwohl Produkte hinterlegt sind

   Start:  node tests/haarkompass-produkte.test.js [pfad/zu/engine.js]
   Ohne Pfad wird engine.js von greathairday.at geladen.
================================================================== */
"use strict";
const fs = require("fs"), path = require("path"), vm = require("vm");

async function engineQuelle(){
  const p = process.argv[2];
  if (p) return fs.readFileSync(p, "utf8");
  const res = await fetch("https://www.greathairday.at/haarkompass/engine.js?t=" + Date.now());
  if (!res.ok) throw new Error("engine.js nicht erreichbar: " + res.status);
  return res.text();
}

(async () => {
  const ctx = vm.createContext({});
  vm.runInContext(await engineQuelle() + "\n;this.__e = { QUESTIONS, recommend };", ctx);
  vm.runInContext(fs.readFileSync(path.join(__dirname, "..", "haarkompass-produkte.js"), "utf8") + "\n;this.__p = { HK_PRODUKTE, hkProdukte, HK_PRODUKTE_TEILWEISE };", ctx);
  const { QUESTIONS, recommend } = ctx.__e, { HK_PRODUKTE, hkProdukte, HK_PRODUKTE_TEILWEISE } = ctx.__p;

  const fehler = new Map();
  const fail = (regel, detail) => { const e = fehler.get(regel) || { n:0, bsp:detail }; e.n++; fehler.set(regel, e); };

  // Aufbau der Einträge
  const QV = Object.fromEntries(QUESTIONS.map(q => [q.id, new Set(q.options.map(o => o.v))]));
  for (const [art, liste] of Object.entries(HK_PRODUKTE)){
    if (!Array.isArray(liste)) { fail("Eintrag ist keine Liste", art); continue; }
    for (const p of liste){
      for (const f of ["marke", "produkt", "de", "en"]) if (typeof p[f] !== "string" || !p[f].trim()) fail("Produkt ohne " + f, art);
      if (typeof p.en === "string" && /[äöüßÄÖÜ]/.test(p.en)) fail("Englischer Grund mit Umlaut", art + ": " + p.en);
      for (const [k, werte] of Object.entries(p.fuer || {})){
        if (!QV[k]) fail("fuer: unbekannte Frage", art + " → " + k);
        else for (const w of werte) if (!QV[k].has(w)) fail("fuer: unbekannte Antwort", art + " → " + k + "=" + w);
      }
    }
  }

  // Alle Kombinationen
  const auswahl = q => {
    if (q.type === "single") return q.options.map(o => o.v);
    const v = q.options.map(o => o.v), out = [];
    for (let m = 1; m < (1 << v.length); m++){
      const s = v.filter((_, i) => m >> i & 1);
      if (q.max && s.length > q.max) continue;
      if (q.none && s.includes(q.none) && s.length > 1) continue;
      out.push(s);
    }
    return out;
  };
  const A = QUESTIONS.map(auswahl), gebraucht = new Set();
  let n = 0;
  const profil = a => QUESTIONS.map(q => q.id + "=" + (q.type === "multi" ? [...a[q.id]].join("+") : a[q.id])).join(" ");
  (function durch(i, a){
    if (i === QUESTIONS.length){
      n++;
      const r = recommend(a);
      for (const x of [...r.basis, ...r.special]){
        gebraucht.add(x.name);
        const p = hkProdukte(x.name, a);
        if (p === null) fail("Produktart fehlt in haarkompass-produkte.js", JSON.stringify(x.name));
        else if (!p.length && HK_PRODUKTE[x.name].length && !HK_PRODUKTE_TEILWEISE.has(x.name)) fail("Filter lässt kein Produkt übrig", x.name + " bei " + profil(a));
      }
      return;
    }
    const q = QUESTIONS[i];
    for (const v of A[i]){ a[q.id] = q.type === "multi" ? new Set(v) : v; durch(i + 1, a); }
  })(0, {});

  for (const art of Object.keys(HK_PRODUKTE)) if (!gebraucht.has(art)) console.log("  Hinweis: Produktart wird nie empfohlen: " + art);
  const ohne = Object.entries(HK_PRODUKTE).filter(([, l]) => !l.length).map(([k]) => k);
  console.log(`HaarKompass-Produkte: ${n.toLocaleString("de-AT")} Kombinationen, ${gebraucht.size} Produktarten geprüft.`);
  if (ohne.length) console.log("  Ohne Salonprodukt (wird ehrlich angezeigt): " + ohne.join(" | "));
  if (fehler.size){
    console.error("\n✗ Fehler:");
    for (const [r, e] of fehler) console.error(`  - ${r}: ${e.n}×, z. B. ${e.bsp}`);
    process.exit(1);
  }
  console.log("✓ Alle Produktarten zugeordnet");
})().catch(e => { console.error(e); process.exit(1); });

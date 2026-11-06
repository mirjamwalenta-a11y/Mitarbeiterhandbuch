/* ==================================================================
   HaarKompass im Salon: welches SALONPRODUKT zu welcher Produktart passt

   Der HaarKompass (greathairday.at/haarkompass/engine.js) empfiehlt nur
   Produktarten, keine Marken. Diese Datei ordnet jeder Produktart die
   Produkte zu, die wir im Salon führen. Grundlage sind die Fachwissen-
   Einträge im Handbuch (L'Oréal Professionnel Katalog 2026, Nashi Argan,
   Goldwell StyleSign).

   Aufbau:  "Produktart (genau wie im HaarKompass)": [ Produkt, … ]
   Produkt: marke, produkt, de/en = kurzer Grund für Kundin/Kunde,
            optional "fuer" = nur bei diesen Antworten zeigen, z. B.
            fuer:{ zustand:["blondiert"] } oder fuer:{ staerke:["fein","normal"] }
   Leere Liste [] = kein passendes Salonprodukt, die Seite sagt das ehrlich.

   Neues Produkt im Sortiment? Hier eintragen. Der Test
   (tests/haarkompass-produkte.test.js) prüft, dass jede Produktart, die
   der HaarKompass empfehlen kann, hier vorkommt.
================================================================== */
"use strict";

const LOR = "L'Oréal Professionnel", NASHI = "Nashi Argan", GW = "Goldwell";

const HK_PRODUKTE = {
  /* ---------------- Shampoo ---------------- */
  "Anti-Schuppen-Shampoo, im Wechsel mit einem milden Shampoo": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Dandruff Dermo-Clarifier Shampoo",
      de:"Mit Pirocton Olamin gegen Schuppen, für trockene und fettige Kopfhaut.",
      en:"With piroctone olamine against dandruff, for dry and oily scalps." },
    { marke:NASHI, produkt:"Classic Shampoo", de:"Für die Tage dazwischen: sanft und feuchtigkeitsspendend.",
      en:"For the days in between: gentle and moisturizing." } ],
  "Sehr mildes, parfümfreies Shampoo": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Discomfort Dermo-Regulator Shampoo",
      de:"Für empfindliche, gereizte Kopfhaut, mit beruhigendem Niacinamid.",
      en:"For sensitive, irritated scalps, with soothing niacinamide." } ],
  "Mildes, leichtes Shampoo ohne pflegende Öle": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Oiliness Dermo-Purifier Shampoo",
      de:"Für fettende Kopfhaut, reinigt gründlich, ohne zu beschweren.",
      en:"For oily scalps, cleanses thoroughly without weighing hair down." } ],
  "Mildes, feuchtigkeitsspendendes Shampoo": [
    { marke:NASHI, produkt:"Classic Shampoo", de:"Sanfte Reinigung, spendet Feuchtigkeit, ohne SLES/SLS.",
      en:"Gentle cleansing that adds moisture, free from SLES/SLS." } ],
  "Mildes, sulfatfreies Shampoo": [
    { marke:LOR, produkt:"Curl Expression Intense Moisturizing Cleansing Cream",
      de:"Reinigungscreme für Wellen und Locken, mit Glycerin für Feuchtigkeit.",
      en:"Cleansing cream for waves and curls, with glycerin for moisture." } ],
  "Mildes, farbschonendes Shampoo": [
    { marke:LOR, produkt:"Vitamino Color Spectrum Shampoo", fuer:{ zustand:["coloriert"] },
      de:"Sulfatfrei, schützt Farbbrillanz und Glanz.", en:"Sulfate-free, protects color vibrancy and shine." },
    { marke:LOR, produkt:"Blondifier Gloss Shampoo", fuer:{ zustand:["blondiert"] },
      de:"Für blondiertes und gesträhntes Haar, mehr Glanz, neutralisiert unerwünschte Reflexe.",
      en:"For bleached and highlighted hair, more shine, neutralizes unwanted tones." } ],
  "Leichtes Shampoo ohne schwere Pflegestoffe": [
    { marke:NASHI, produkt:"Classic Shampoo", de:"Pflegt, ohne zu belasten, auch für feines Haar.",
      en:"Cares without weighing hair down, also for fine hair." } ],
  "Ein mildes Basis-Shampoo": [
    { marke:NASHI, produkt:"Classic Shampoo", de:"Sanft für jeden Tag, für alle Haartypen.",
      en:"Gentle for every day, for all hair types." } ],

  /* ---------------- Conditioner ---------------- */
  "Reparierender Conditioner, dazu 1× pro Woche eine Maske": [
    { marke:LOR, produkt:"Absolut Repair Conditioner + Maske",
      de:"Wiederaufbau für strapaziertes Haar, ohne zu beschweren.",
      en:"Rebuilds damaged hair without weighing it down." },
    { marke:LOR, produkt:"Blondifier Conditioner / Maske", fuer:{ zustand:["blondiert"] },
      de:"Speziell für Blond: regeneriert und bringt Glanz.", en:"Made for blonde hair: regenerates and adds shine." },
    { marke:NASHI, produkt:"Deep Infusion (Maske)", de:"Intensive Feuchtigkeitsmaske, 1× pro Woche statt Conditioner.",
      en:"Intensive moisture mask, once a week instead of conditioner." } ],
  "Reichhaltiger Conditioner": [
    { marke:LOR, produkt:"Curl Expression Intensive Moisturizer Mask", fuer:{ form:["lockig","kraus"] },
      de:"Reichhaltige Feuchtigkeit für Locken, nach jeder Wäsche statt Conditioner.",
      en:"Rich moisture for curls, after every wash instead of conditioner." },
    { marke:LOR, produkt:"Absolut Repair Conditioner", fuer:{ form:["glatt","wellig"] },
      de:"Für kräftiges, trockenes Haar: Geschmeidigkeit und Glanz.", en:"For coarse, dry hair: softness and shine." } ],
  "Leichter Conditioner (oder Sprüh-Conditioner)": [
    { marke:NASHI, produkt:"Classic Conditioner", de:"Leichte Kämmbarkeit, auch bei feinem Haar, beschwert nicht.",
      en:"Easy combing, also for fine hair, doesn't weigh it down." },
    { marke:NASHI, produkt:"Instant Mask (Sprühpflege)", de:"Als leichte Alternative zum Aufsprühen.",
      en:"A light spray-on alternative." } ],
  "Conditioner nach jeder Wäsche": [
    { marke:LOR, produkt:"Vitamino Color Spectrum Deep Conditioner", fuer:{ zustand:["coloriert"] },
      de:"Mit Zitronensäure, hält die Farbe länger leuchtend.", en:"With citric acid, keeps color vibrant for longer." },
    { marke:NASHI, produkt:"Classic Conditioner", de:"Für alle Haartypen, pflegt sanft und schützt die Farbe.",
      en:"For all hair types, gentle care that protects color." } ],

  /* ---------------- Hitzeschutz ---------------- */
  "Hitzeschutz vor jedem Föhnen oder Glätten": [
    { marke:NASHI, produkt:"Instant Mask", fuer:{ staerke:["fein","normal"] },
      de:"Leichte Sprühpflege mit Hitzeschutz, beugt Spliss vor.", en:"Light spray care with heat protection, helps prevent split ends." },
    { marke:GW, produkt:"StyleSign Glättendes Serum Spray", fuer:{ form:["glatt","wellig"] },
      de:"Hitzeschutz bis 230 °C, das Glätteisen gleitet leichter.", en:"Heat protection up to 230 °C, the flat iron glides more easily." },
    { marke:LOR, produkt:"Curl Expression 10in1 Cream-in-Mousse", fuer:{ form:["lockig","kraus"] },
      de:"Definiert Locken, mit Hitzeschutz bis 230 °C.", en:"Defines curls, with heat protection up to 230 °C." } ],

  /* ---------------- Spezial-Impulse ---------------- */
  "Molecular-Repair-Pflege": [
    { marke:LOR, produkt:"Absolut Repair Molecular (Rinse-Off Serum / Leave-In)",
      de:"Peptidbonder repariert die innere Haarstruktur. Im Salon als Reborn-Stronger-Service.",
      en:"Peptide bonder repairs the inner hair structure. In the salon as the Reborn Stronger service." },
    { marke:LOR, produkt:"Metal DX (beim Färben/Blondieren im Salon)", fuer:{ zustand:["blondiert"] },
      de:"Neutralisiert Metalle im Haar, beugt Haarbruch und Farbveränderung vor.",
      en:"Neutralizes metals in the hair, helps prevent breakage and color changes." } ],
  "Leichter Leave-in-Spray": [
    { marke:NASHI, produkt:"Instant Mask", de:"Sprühpflege, die im Haar bleibt, bändigt Frizz, erleichtert das Kämmen.",
      en:"Leave-in spray, tames frizz and makes combing easier." } ],
  "Farbauffrischende Pflege (Color-Conditioner)": [
    { marke:LOR, produkt:"Vitamino Color Spectrum Neutralisierendes Shampoo",
      de:"Neutralisiert unerwünschte Reflexe bei blondem, braunem und schwarzem Haar.",
      en:"Neutralizes unwanted tones in blonde, brown and black hair." },
    { marke:LOR, produkt:"Vitamino Color Spectrum Maske", de:"Pflegt die Farbe zwischen zwei Terminen.",
      en:"Looks after the color between two appointments." } ],
  "Silber-Pflege gegen Gelbstich (1× pro Woche)": [
    { marke:LOR, produkt:"Blondifier Gloss Shampoo / Maske",
      de:"Neutralisiert unerwünschte Reflexe in Blond, mehr Glanz. Bei grauem oder weißem Naturhaar: Silver.",
      en:"Neutralizes unwanted tones in blonde hair, more shine. For grey or white natural hair: Silver." } ],
  "Saure Glanzspülung (1× pro Woche)": [
    { marke:LOR, produkt:"Vitamino Color Spectrum Deep Conditioner", fuer:{ zustand:["coloriert","blondiert"] },
      de:"Mit 2,5 % Zitronensäure: schließt die Oberfläche, mehr Glanz.", en:"With 2.5 % citric acid: closes the surface, more shine." } ],
  "Ausgleichendes Kopfhaut-Tonikum": [],
  "Beruhigendes Kopfhaut-Serum (parfümfrei)": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Discomfort Intense Soother",
      de:"Beruhigt empfindliche, gereizte Kopfhaut, mit Niacinamid.", en:"Soothes sensitive, irritated scalps, with niacinamide." } ],
  "Beruhigendes Kopfhaut-Serum": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Discomfort Intense Soother",
      de:"Beruhigt die Kopfhaut, ergänzt das Anti-Schuppen-Shampoo.", en:"Soothes the scalp, complements the anti-dandruff shampoo." } ],
  "Feuchtigkeitsspendendes Kopfhaut-Serum": [],
  "Kopfhaut-Serum": [],
  "Leave-in-Conditioner oder Lockencreme": [
    { marke:LOR, produkt:"Curl Expression Definition Activator Leave-In",
      de:"Creme-Gel für definierte Locken, mit Hitzeschutz.", en:"Cream gel for defined curls, with heat protection." },
    { marke:GW, produkt:"StyleSign Definierende Creme", de:"Pflegt und bündelt, für mittelstarkes bis kräftiges Haar.",
      en:"Cares and groups curls, for medium to coarse hair." } ],
  "Leichte Lockenmousse oder Leave-in-Spray": [
    { marke:LOR, produkt:"Curl Expression 10in1 Cream-in-Mousse", de:"Leichte Definition und Halt.",
      en:"Light definition and hold." },
    { marke:GW, produkt:"StyleSign Bündelndes Gel", de:"Elastische Locken, für feines bis mittelstarkes Haar.",
      en:"Bouncy curls, for fine to medium hair." } ],
  "Ein paar Tropfen Haaröl für die Spitzen": [
    { marke:NASHI, produkt:"Argan Oil", de:"Glanz und Schutz vor Feuchtigkeitsverlust, mit UV-Filtern.",
      en:"Shine and protection against moisture loss, with UV filters." },
    { marke:GW, produkt:"StyleSign Schwereloses Glanz-Öl", de:"Bis 72 Std. Frizz-Kontrolle, beschwert nicht.",
      en:"Up to 72 h frizz control, doesn't weigh hair down." } ],
  "Kopfhaut-Peeling, alle 1–2 Wochen": [
    { marke:LOR, produkt:"Scalp Advanced Anti-Oiliness 2in1 Deep Purifier Clay",
      de:"Mit Fruchtsäure und Tonerde, wirkt wie ein sanftes Peeling für fettende Kopfhaut.",
      en:"With fruit acid and clay, works like a gentle scrub for oily scalps." } ],
  "Trockenshampoo für den Tag dazwischen": [
    { marke:GW, produkt:"StyleSign Trockenes Textur-Spray", de:"Für Tag 2: nimmt Öl am Ansatz auf, gibt Griff und Fülle.",
      en:"For day 2: absorbs oil at the roots, adds grip and fullness." } ],
  "UV-Schutz-Spray für die Haare": [
    { marke:LOR, produkt:"Vitamino Color Spectrum Glass Shine Serum", fuer:{ zustand:["coloriert","blondiert"] },
      de:"Ohne Ausspülen, schützt vor UV, Hitze und Luftfeuchtigkeit.", en:"Leave-in, protects against UV, heat and humidity." },
    { marke:NASHI, produkt:"Argan Oil (nur Spitzen)", fuer:{ staerke:["normal","kraeftig"] },
      de:"Enthält UV-Filter, ein paar Tropfen in die Spitzen.", en:"Contains UV filters, a few drops on the ends." } ],
  "Ansatz-Volumenspray oder leichter Föhnschaum": [
    { marke:GW, produkt:"StyleSign Ansatzvolumenspray", de:"Sofortiges Ansatzvolumen bis 48 Std.",
      en:"Instant root volume for up to 48 h." },
    { marke:LOR, produkt:"tecni.art Volume Rootlift", de:"Feiner Sprühschaum für Volumen am Ansatz, beschwert die Längen nicht.",
      en:"Fine spray mousse for volume at the roots, doesn't weigh down the lengths." } ]
};

/* Produktarten, für die wir NUR bei manchen Antworten ein Salonprodukt haben
   (sonst zeigt die Seite ehrlich: kein passendes Produkt im Sortiment). */
const HK_PRODUKTE_TEILWEISE = new Set([
  "Saure Glanzspülung (1× pro Woche)",
  "UV-Schutz-Spray für die Haare"
]);

/* Passende Salonprodukte für eine Produktart und die Antworten a */
function hkProdukte(name, a){
  const liste = HK_PRODUKTE[name];
  if (!liste) return null;            // unbekannte Produktart
  return liste.filter(p => !p.fuer || Object.entries(p.fuer).every(([k, werte]) => werte.includes(a[k])));
}

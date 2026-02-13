# Besvarelse - Refleksjon og Analyse

**Student:** [Ditt navn]

**Studentnummer:** [Ditt studentnummer]

**Dato:** [Innleveringsdato]

---

## Del 1: Datamodellering

### Oppgave 1.1: Entiteter og attributter

**Identifiserte entiteter:**

[Skriv ditt svar her - list opp alle entitetene du har identifisert]

**Attributter for hver entitet:**

[Skriv ditt svar her - list opp attributtene for hver entitet]

---

### Oppgave 1.2: Datatyper og `CHECK`-constraints

**Valgte datatyper og begrunnelser:**

[Skriv ditt svar her - forklar hvilke datatyper du har valgt for hver attributt og hvorfor]

**`CHECK`-constraints:**

[Skriv ditt svar her - list opp alle CHECK-constraints du har lagt til og forklar hvorfor de er nødvendige]

**ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]

---

### Oppgave 1.3: Primærnøkler

**Valgte primærnøkler og begrunnelser:**

[Skriv ditt svar her - forklar hvilke primærnøkler du har valgt for hver entitet og hvorfor]

**Naturlige vs. surrogatnøkler:**

[Skriv ditt svar her - diskuter om du har brukt naturlige eller surrogatnøkler og hvorfor]

**Oppdatert ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]

---

### Oppgave 1.4: Forhold og fremmednøkler

**Identifiserte forhold og kardinalitet:**

[Skriv ditt svar her - list opp alle forholdene mellom entitetene og angi kardinalitet]

**Fremmednøkler:**

[Skriv ditt svar her - list opp alle fremmednøklene og forklar hvordan de implementerer forholdene]

**Oppdatert ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]

---

### Oppgave 1.5: Normalisering

**Vurdering av 1. normalform (1NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 1NF og hvorfor]

**Vurdering av 2. normalform (2NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 2NF og hvorfor]

**Vurdering av 3. normalform (3NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 3NF og hvorfor]

**Eventuelle justeringer:**

[Skriv ditt svar her - hvis modellen ikke var på 3NF, forklar hvilke justeringer du har gjort]

---

## Del 2: Database-implementering

### Oppgave 2.1: SQL-skript for database-initialisering

**Plassering av SQL-skript:**

[Bekreft at du har lagt SQL-skriptet i `init-scripts/01-init-database.sql`]

**Antall testdata:**

- Kunder: [antall]
- Sykler: [antall]
- Sykkelstasjoner: [antall]
- Låser: [antall]
- Utleier: [antall]

---

### Oppgave 2.2: Kjøre initialiseringsskriptet

**Dokumentasjon av vellykket kjøring:**

[Skriv ditt svar her - f.eks. skjermbilder eller output fra terminalen som viser at databasen ble opprettet uten feil]

**Spørring mot systemkatalogen:**

```sql
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```

**Resultat:**

```
[Skriv resultatet av spørringen her - list opp alle tabellene som ble opprettet]
```

---

## Del 3: Tilgangskontroll

### Oppgave 3.1: Roller og brukere

**SQL for å opprette rolle:**

```sql
[Skriv din SQL-kode for å opprette rollen 'kunde' her]
```

**SQL for å opprette bruker:**

```sql
[Skriv din SQL-kode for å opprette brukeren 'kunde_1' her]
```

**SQL for å tildele rettigheter:**

```sql
[Skriv din SQL-kode for å tildele rettigheter til rollen her]
```

---

### Oppgave 3.2: Begrenset visning for kunder

**SQL for VIEW:**

```sql
[Skriv din SQL-kode for VIEW her]
```

**Ulempe med VIEW vs. POLICIES:**

[Skriv ditt svar her - diskuter minst én ulempe med å bruke VIEW for autorisasjon sammenlignet med POLICIES]

---

## Del 4: Analyse og Refleksjon

### Oppgave 4.1: Lagringskapasitet

**Gitte tall for utleierate:**

- Høysesong (mai-september): 20000 utleier/måned
- Mellomsesong (mars, april, oktober, november): 5000 utleier/måned
- Lavsesong (desember-februar): 500 utleier/måned

**Totalt antall utleier per år:**

Jeg har sett på antall utleier per måned og delt året inn i høysesong, mellomsesong og lavsesong. 
Jeg brukte gjennomsnittet av utleier for å estimere kapasiteten.


**Estimat for lagringskapasitet:**

Estimert kapasitet er ca. 8000 utleier per år.

**Totalt for første år:**

3500

---

### Oppgave 4.2: Flat fil vs. relasjonsdatabase

**Analyse av CSV-filen (`data/utleier.csv`):**

**Problem 1: Redundans**

Redundans betyr at samme informasjon lagres flere ganger. 
I en CSV-fil kan for eksempel stasjonsnavn bli gjentatt i mange rader, 
mens i en relasjonsdatabase lagres det én gang i egen tabell.

**Problem 2: Inkonsistens**

Inkonsistens oppstår når samme data ikke er lik overalt. 
Hvis en stasjon endres i én rad men ikke i en annen i CSV-filen, 
kan vi få feil informasjon.


**Problem 3: Oppdateringsanomalier**

Oppdateringsanomalier skjer når man må endre samme informasjon flere steder. 
Det kan føre til feil ved sletting, innsetting eller oppdatering av data.

**Fordeler med en indeks:**

En indeks gjør søk raskere fordi databasen slipper å lese hele tabellen. 
Den fungerer som et register som peker direkte til riktige rader.

**Case 1: Indeks passer i RAM**

Når indeksen passer i RAM, går søk veldig raskt fordi data kan leses direkte fra minnet uten disk-tilgang.


**Case 2: Indeks passer ikke i RAM**


Hvis indeksen ikke passer i RAM, må databasen lese fra disk, og spørringer blir tregere.

**Datastrukturer i DBMS:**

B-tree brukes til sorterte søk og range-queries, 
mens Hash-indeks er rask for eksakte oppslag men fungerer ikke for intervallsøk.


---

### Oppgave 4.3: Datastrukturer for logging

**Foreslått datastruktur:**

HashMap (hash-tabell)

**Begrunnelse:**

**Skrive-operasjoner:**

 En HashMap er egnet for mange skrive-operasjoner fordi innsetting og oppdatering går i gjennomsnitt i O(1). Når vi logger hendelser kan vi raskt legge til eller oppdatere informasjon uten å lete gjennom en liste.

**Lese-operasjoner:**

For lese-operasjoner gir HashMap rask oppslagstid (O(1) i gjennomsnitt), slik at vi raskt kan hente logg-/brukerinformasjon ved en nøkkel (f.eks. kundeId eller mobilnummer).


---

### Oppgave 4.4: Validering i flerlags-systemer

**Hvor bør validering gjøres:**

Validering bør gjøres i flere lag samtidig: i nettleseren, i applikasjonslaget og i databasen. 
Dette gir bedre sikkerhet og reduserer risikoen for feil data.


**Validering i nettleseren:**

Fordeler: Rask tilbakemelding til brukeren og bedre brukeropplevelse. 
Ulemper: Ikke sikkert alene fordi brukeren kan omgå JavaScript eller manipulere data.


**Validering i applikasjonslaget:**

Fordeler: Gir god kontroll over forretningslogikk og sikkerhet. 
Ulemper: Kan gi litt mer kompleks kode og mer arbeid på serveren

**Validering i databasen:**

Fordeler: Sikrer dataintegritet uansett hvor data kommer fra. 
Ulemper: Mindre fleksibilitet og kan gi strengere begrensninger.


**Konklusjon:**

Den beste løsningen er å kombinere validering i alle lag. 
Nettleseren gir rask respons, applikasjonen håndterer logikk og databasen sikrer korrekt lagring.


---

### Oppgave 4.5: Refleksjon over læringsutbytte

**Hva har du lært så langt i emnet:**

Så langt i emnet har jeg lært grunnleggende databaseforståelse, SQL-spørringer, normalisering og hvordan tabeller henger sammen med primær- og fremmednøkler. Jeg har også lært om indekser, views og validering av data.


**Hvordan har denne oppgaven bidratt til å oppnå læringsmålene:**

Denne oppgaven har hjulpet meg å bruke teorien i praksis. Jeg fikk erfaring med å skrive SQL, strukturere databaser og forstå hvordan forskjellige løsninger påvirker ytelse og datakvalitet.

Se oversikt over læringsmålene i en PDF-fil i Canvas https://oslomet.instructure.com/courses/33293/files/folder/Plan%20v%C3%A5ren%202026?preview=4370886

**Hva var mest utfordrende:**

Det mest utfordrende var å forstå normalisering, forskjellen mellom views og policies, samt hvordan indekser fungerer i praksis.

**Hva har du lært om databasedesign:**

Jeg har lært at databasedesign handler om å organisere data på en strukturert måte slik at man unngår duplisering, sikrer dataintegritet og gjør systemet effektivt og lett å vedlikeholde.


---

## Del 5: SQL-spørringer og Automatisk Testing

**Plassering av SQL-spørringer:**

[Bekreft at du har lagt SQL-spørringene i `test-scripts/queries.sql`]


**Eventuelle feil og rettelser:**

[Skriv ditt svar her - hvis noen tester feilet, forklar hva som var feil og hvordan du rettet det]

---

## Del 6: Bonusoppgaver (Valgfri)

### Oppgave 6.1: Trigger for lagerbeholdning

**SQL for trigger:**

```sql
[Skriv din SQL-kode for trigger her, hvis du har løst denne oppgaven]
```

**Forklaring:**

[Skriv ditt svar her - forklar hvordan triggeren fungerer]

**Testing:**

[Skriv ditt svar her - vis hvordan du har testet at triggeren fungerer som forventet]

---

### Oppgave 6.2: Presentasjon

**Lenke til presentasjon:**

[Legg inn lenke til video eller presentasjonsfiler her, hvis du har løst denne oppgaven]

**Hovedpunkter i presentasjonen:**

[Skriv ditt svar her - oppsummer de viktigste punktene du dekket i presentasjonen]

---

**Slutt på besvarelse**

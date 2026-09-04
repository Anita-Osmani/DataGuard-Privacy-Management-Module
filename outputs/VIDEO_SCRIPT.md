# DataGuard — Skript për video prezantuese

Titulli akademik: **Modul për Menaxhimin e Miratimeve të Privatësisë, Regjistrimin e Qasjeve dhe Ruajtjen e të Dhënave për Aplikacione të NVM-ve**

Kohëzgjatja e rekomanduar: 4–6 minuta.

## 1. Hyrja (20 sekonda)

"DataGuard është një modul i thjeshtë për aplikacione të vogla dhe të mesme. Ai mundëson menaxhimin e politikave të privatësisë, miratimeve të përdoruesve, auditimit, ruajtjes së të dhënave dhe kërkesave për eksportim ose fshirje."

## 2. Hyrja si Administrator (25 sekonda)

- Hyni me llogarinë Administrator.
- Hapni Dashboard.
- Shpjegoni shkurt numrat: përdoruesit, consent-et aktive, politikat dhe kërkesat në pritje.

## 3. Privacy Policy dhe versionimi (50 sekonda)

- Hapni **Privacy Policies**.
- Klikoni **Create Policy**.
- Krijoni `Customer Privacy Policy`, versioni `1.0`.
- Klikoni **View** për të shfaqur tekstin e policy-së.
- Klikoni **New version** dhe krijoni `1.1`.
- Theksoni se versionet e vjetra mbeten në histori.

## 4. Aplikacioni demonstrues SME (45 sekonda)

- Hapni **SME Customer App**.
- Klikoni **Add Customer**.
- Shtoni një klient me emër, email, telefon dhe adresë.
- Hapni View, pastaj Edit ose Delete.
- Shpjegoni se këto veprime regjistrohen në Audit Logs.

## 5. Miratimi i përdoruesit (45 sekonda)

- Dilni nga Administrator dhe hyni me një llogari User.
- Hapni **My Privacy**.
- Lexoni policy-n aktuale.
- Klikoni **Accept Privacy Policy**.
- Theksoni që sistemi ruan versionin e policy-së dhe datën e miratimit.

## 6. Eksportimi/fshirja e të dhënave (45 sekonda)

- Te **My Privacy**, klikoni **Request & Download My Data**.
- Tregoni që krijohet kërkesë dhe shkarkohet JSON i thjeshtë i të dhënave personale.
- Klikoni edhe **Request Data Deletion**.

## 7. Përpunimi nga Administrator (45 sekonda)

- Hyni përsëri si Administrator.
- Hapni **Data Requests**.
- Aprovoni një kërkesë dhe klikoni **Mark completed**.
- Hapni **Audit Logs** dhe shfaqni CREATE, CONSENT, EXPORT ose UPDATE.

## 8. Retention Policies dhe mbyllja (30 sekonda)

- Hapni **Retention Policies**.
- Shtoni ose editoni një policy, p.sh. `Customer Data — 2 years — Delete`.
- Klikoni **Process Retention**.
- Mbyllni: "DataGuard demonstron një zgjidhje të thjeshtë dhe të përdorshme për privatësinë në aplikacione SME, e ndërtuar me React, TypeScript, Supabase dhe PostgreSQL."

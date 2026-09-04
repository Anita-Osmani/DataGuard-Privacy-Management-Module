# Test Cases — DataGuard

| ID | Funksioni | Hapat | Rezultati i pritur |
|---|---|---|---|
| TC-01 | Register | Krijo account me email/password | Krijohet user dhe profile me rol `user` |
| TC-02 | Admin role | Vendos rolin `admin` në profiles dhe hyn përsëri | Shfaqen faqet administrative |
| TC-03 | Policy create | Krijo policy v1.0 | Policy dhe versioni ruhen në Supabase |
| TC-04 | Policy version | Shto versionin v1.1 | Historia shfaq v1.0 dhe v1.1 |
| TC-05 | Consent | User klikon Accept Privacy Policy | Consent ruhet me policy version ID |
| TC-06 | Consent withdraw | User klikon Withdraw Consent | Ruhet statusi `withdrawn` |
| TC-07 | Customer CRUD | Add, Edit, Delete customer | Ndryshimet ruhen te tabela customers |
| TC-08 | Data export | User kërkon export | Krijohet request dhe shkarkohet JSON |
| TC-09 | Data deletion | User kërkon fshirje | Krijohet request `data_deletion` |
| TC-10 | Request processing | Admin aprovon dhe përfundon request | Statusi ndryshon në Approved/Completed |
| TC-11 | Audit log | Kryej një create/update/delete | Veprimi shfaqet te Audit Logs |
| TC-12 | Retention | Krijo/edit retention policy | Policy ruhet dhe Process Retention logon veprimin |

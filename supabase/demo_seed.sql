-- Run this once in Supabase SQL Editor to add safe demo records.
-- It creates policies, versions, retention rules and SME customers.

insert into public.privacy_policies (title, status)
select 'Customer Privacy Policy', 'current'
where not exists (select 1 from public.privacy_policies where title = 'Customer Privacy Policy');

insert into public.policy_versions (policy_id, version, content, effective_date)
select id, '1.0', 'This policy explains how the SME collects, uses, stores and protects customer name, email, phone number and address. Customers can request access to or deletion of their personal data at any time.', current_date
from public.privacy_policies
where title = 'Customer Privacy Policy'
  and not exists (select 1 from public.policy_versions where policy_versions.policy_id = privacy_policies.id and version = '1.0');

insert into public.retention_policies (data_type, retention_period, action, status)
select 'Customer Data', '2 years', 'Delete', 'Active'
where not exists (select 1 from public.retention_policies where data_type = 'Customer Data');

insert into public.retention_policies (data_type, retention_period, action, status)
select 'Audit Logs', '1 year', 'Archive', 'Active'
where not exists (select 1 from public.retention_policies where data_type = 'Audit Logs');

insert into public.retention_policies (data_type, retention_period, action, status)
select 'Consent Records', '3 years', 'Keep', 'Active'
where not exists (select 1 from public.retention_policies where data_type = 'Consent Records');

insert into public.customers (name, email, phone, address)
select 'Arben Krasniqi', 'arben.krasniqi@example.com', '+383 44 123 456', 'Prishtina, Kosovo'
where not exists (select 1 from public.customers where email = 'arben.krasniqi@example.com');

insert into public.customers (name, email, phone, address)
select 'Elira Gashi', 'elira.gashi@example.com', '+383 45 234 567', 'Prizren, Kosovo'
where not exists (select 1 from public.customers where email = 'elira.gashi@example.com');

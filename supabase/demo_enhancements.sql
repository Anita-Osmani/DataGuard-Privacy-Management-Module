-- Optional demo records for the DataGuard SME Customer App.
-- Run once in Supabase SQL Editor. This only adds records if the email does not exist.

insert into public.customers (name, email, phone, address)
select 'Diona Berisha', 'diona.berisha@example.com', '+383 49 345 678', 'Mitrovicë, Kosovë'
where not exists (select 1 from public.customers where email = 'diona.berisha@example.com');

insert into public.customers (name, email, phone, address)
select 'Liridona Shala', 'liridona.shala@example.com', '+383 43 456 789', 'Pejë, Kosovë'
where not exists (select 1 from public.customers where email = 'liridona.shala@example.com');

insert into public.customers (name, email, phone, address)
select 'Blerim Hoxha', 'blerim.hoxha@example.com', '+383 48 567 890', 'Gjilan, Kosovë'
where not exists (select 1 from public.customers where email = 'blerim.hoxha@example.com');

insert into public.customers (name, email, phone, address)
select 'Era Kelmendi', 'era.kelmendi@example.com', '+383 44 678 901', 'Ferizaj, Kosovë'
where not exists (select 1 from public.customers where email = 'era.kelmendi@example.com');

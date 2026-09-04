-- DataGuard final prototype improvements
-- Run this file once in the Supabase SQL Editor after schema.sql has been run.
-- It permits an authenticated user to create an audit entry only for their own actions.
-- Reading and managing the complete audit history remains restricted to administrators.

create policy "users insert own audit entries"
on public.audit_logs
for insert
to authenticated
with check (actor_id = auth.uid());

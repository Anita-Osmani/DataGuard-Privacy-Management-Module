-- Privacy Management Module: basic Supabase/PostgreSQL schema
create type public.user_role as enum ('admin', 'user');
create type public.consent_status as enum ('accepted', 'rejected', 'withdrawn');
create type public.request_type as enum ('data_export', 'data_deletion');
create type public.request_status as enum ('pending', 'approved', 'completed', 'rejected');

create table public.profiles (id uuid primary key references auth.users(id) on delete cascade, full_name text not null, role public.user_role not null default 'user', created_at timestamptz not null default now());
create table public.privacy_policies (id uuid primary key default gen_random_uuid(), title text not null, status text not null default 'draft' check(status in ('draft','current','archived')), created_by uuid references public.profiles(id), created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.policy_versions (id uuid primary key default gen_random_uuid(), policy_id uuid not null references public.privacy_policies(id) on delete cascade, version text not null, content text not null default '', effective_date date, created_at timestamptz not null default now(), unique(policy_id, version));
create table public.consents (id uuid primary key default gen_random_uuid(), user_id uuid not null references public.profiles(id) on delete cascade, policy_version_id uuid not null references public.policy_versions(id), status public.consent_status not null, decided_at timestamptz not null default now());
create table public.audit_logs (id bigint generated always as identity primary key, actor_id uuid references public.profiles(id) on delete set null, action text not null check(action in ('LOGIN','VIEW','CREATE','UPDATE','DELETE','CONSENT','EXPORT')), resource text not null, status text not null default 'Success', created_at timestamptz not null default now());
create table public.retention_policies (id uuid primary key default gen_random_uuid(), data_type text not null, retention_period text not null, action text not null check(action in ('Delete','Archive','Keep')), status text not null default 'Active', created_at timestamptz not null default now());
create table public.data_requests (id uuid primary key default gen_random_uuid(), user_id uuid not null references public.profiles(id) on delete cascade, type public.request_type not null, status public.request_status not null default 'pending', requested_at timestamptz not null default now(), reviewed_by uuid references public.profiles(id), reviewed_at timestamptz);
create table public.customers (id uuid primary key default gen_random_uuid(), name text not null, email text not null, phone text, address text, created_at timestamptz not null default now(), updated_at timestamptz not null default now());

-- Create a profile automatically whenever a person registers through Supabase Auth.
create or replace function public.handle_new_user() returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, role)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'full_name', split_part(new.email, '@', 1)), 'user');
  return new;
end;
$$;
create trigger on_auth_user_created after insert on auth.users for each row execute procedure public.handle_new_user();

-- Enable RLS. Prototype policies: users see their own records; administrators manage all.
alter table public.profiles enable row level security; alter table public.privacy_policies enable row level security; alter table public.policy_versions enable row level security; alter table public.consents enable row level security; alter table public.audit_logs enable row level security; alter table public.retention_policies enable row level security; alter table public.data_requests enable row level security; alter table public.customers enable row level security;
create function public.is_admin() returns boolean language sql stable security definer set search_path = public as $$ select coalesce((select role = 'admin' from public.profiles where id = auth.uid()), false) $$;
create policy "profiles read own or admin" on public.profiles for select using (id = auth.uid() or public.is_admin());
create policy "policy documents are readable" on public.privacy_policies for select using (true); create policy "policy versions are readable" on public.policy_versions for select using (true);
create policy "admins manage policies" on public.privacy_policies for all using (public.is_admin()) with check (public.is_admin()); create policy "admins manage versions" on public.policy_versions for all using (public.is_admin()) with check (public.is_admin());
create policy "users manage own consents" on public.consents for all using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
create policy "users manage own requests" on public.data_requests for all using (user_id = auth.uid() or public.is_admin()) with check (user_id = auth.uid() or public.is_admin());
create policy "admins manage audit logs" on public.audit_logs for all using (public.is_admin()) with check (public.is_admin()); create policy "admins manage retention" on public.retention_policies for all using (public.is_admin()) with check (public.is_admin()); create policy "admins manage customers" on public.customers for all using (public.is_admin()) with check (public.is_admin());

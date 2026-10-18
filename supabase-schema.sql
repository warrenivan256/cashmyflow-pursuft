-- CashMyFlow @ Pursuft: private per-user finance state
-- Run this in Supabase Dashboard > SQL Editor > New query.
create table if not exists public.user_finance_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default jsonb_build_object(
    'baseBalance', 0,
    'transactions', '[]'::jsonb,
    'budgets', '[]'::jsonb,
    'goals', '[]'::jsonb,
    'fees', '[]'::jsonb,
    'displayCurrency', 'MYR'
  ),
  updated_at timestamptz not null default now()
);

alter table public.user_finance_state enable row level security;

drop policy if exists "Users can read their own finance state" on public.user_finance_state;
create policy "Users can read their own finance state"
on public.user_finance_state for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Users can insert their own finance state" on public.user_finance_state;
create policy "Users can insert their own finance state"
on public.user_finance_state for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own finance state" on public.user_finance_state;
create policy "Users can update their own finance state"
on public.user_finance_state for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

grant select, insert, update on public.user_finance_state to authenticated;

import { createClient } from '@supabase/supabase-js'

// Add these values to .env.local after creating a Supabase project.
// The UI uses demo data so it remains explorable before a connection is configured.
const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = url && key ? createClient(url, key) : null

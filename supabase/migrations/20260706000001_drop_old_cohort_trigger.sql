-- Drop old cohort trigger that referenced renamed tables
-- These tables were renamed to semesters / student_semesters
DROP TRIGGER IF EXISTS trg_assign_active_cohort_on_user_create ON public.users;
DROP FUNCTION IF EXISTS assign_active_cohort_on_user_create;

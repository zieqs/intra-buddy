# INTRA Buddy Mobile

Student-facing mobile app for UniKL internship (INTRA) management.

Built with **Flutter** + **Supabase** + **Riverpod**.

## Features

- **Auth** — Email/password login and signup with student validation
- **Dashboard** — Progress overview with milestone, job, document, and logbook stats
- **Checklist** — Milestone checklist with toggle completion and progress tracking
- **Job Applications** — Track company, position, and status (Pending/Interview/Offer/Rejected/Accepted)
- **My Documents** — Upload, view, and delete documents via Supabase Storage
- **Weekly Logbook** — Mark weeks as submitted with progress tracking
- **Notifications** — Grouped inbox (Today / This Week / Earlier) with swipe-to-delete
- **Chatbot** — Rule-based FAQ assistant with session history
- **Profile** — View and edit student name and phone number
- **Settings** — App version and sign out

## Architecture

Feature-first Clean Architecture with three layers per feature:

```
feature/
  domain/       — Entities, repository interfaces, use cases (pure Dart)
  data/         — Datasources, models, repository implementations (Supabase)
  presentation/ — Riverpod controllers, screens (UI)
```

**State management:** Riverpod 3 (`AsyncNotifier`, `FutureProvider`, `Notifier`)
**Routing:** GoRouter with `StatefulShellRoute.indexedStack` (4 tabs + More menu)
**Backend:** Supabase PostgreSQL + Auth + Storage

## Getting Started

### Prerequisites

- Flutter SDK ^3.11.5
- A Supabase project with the schema from `docs/CONTEXT.md`

### Setup

```bash
# Install dependencies
flutter pub get

# Generate JSON serialization code
dart run build_runner build

# Configure environment
cp .env.example .env
# Edit .env with your Supabase URL and anon key

# Run the app
flutter run
```

### Code Quality

```bash
flutter analyze
dart format .
```

## Project Structure

```
lib/
  main.dart
  src/
    app/          — Theme, router, app widget
    core/         — Shared services, providers, constants, errors
    features/     — auth, dashboard, checklist, jobs, my_documents,
                    logbook, notifications, chatbot, profile, settings
```

Each feature follows the same `domain/data/presentation` layout.

## Database

Full schema documented in `docs/CONTEXT.md` (section 12). Key tables:
`users`, `semesters`, `checklist_templates`, `student_checklists`,
`job_applications`, `digital_wallet_items`, `weekly_logbook_tracking`,
`faqs`, `notifications`, `chat_sessions`, `chat_messages`

## Team

| Role | Repo |
|------|------|
| Mobile App (this) | `zieqs/intra-buddy` |
| Web Dashboard | (separate repo — admin/coordinator tools) |

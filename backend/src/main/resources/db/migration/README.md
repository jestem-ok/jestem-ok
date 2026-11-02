# Database migrations (Flyway)

Every change to the database structure is a new SQL file in this folder. Flyway runs the new ones automatically when the backend starts.

## Naming

`V<number>__<description>.sql` with **two** underscores, for example:

- `V1__create_seniors.sql`
- `V2__add_checkin_time_to_seniors.sql`

## Rules

- **Never edit a migration that is already on `main`.** Fix mistakes with a new migration.
- One topic per migration.
- Two PRs with the same version number will conflict. The second one to merge renumbers its file.

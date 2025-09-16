-- Truncate all tables in proper dependency order

-- Child tables first (tables with foreign keys)
TRUNCATE TABLE acme.hu_inet_population CASCADE;
TRUNCATE TABLE acme.hu_inet_roster CASCADE;
TRUNCATE TABLE acme.hu_mail_population CASCADE;
TRUNCATE TABLE acme.gq_mail_population CASCADE;
TRUNCATE TABLE acme.gq_mail_group_quarters CASCADE;

-- Parent tables (tables referenced by foreign keys)
TRUNCATE TABLE acme.hu_inet_housing CASCADE;
TRUNCATE TABLE acme.hu_mail_housing CASCADE;
TRUNCATE TABLE acme.gq_mail_housing CASCADE;

-- Independent tables (no foreign key relationships)
TRUNCATE TABLE acme.gq_inet_population CASCADE;
TRUNCATE TABLE acme.final_mail_inet_2025 CASCADE;
TRUNCATE TABLE acme.final_mail_inet_2026 CASCADE;
TRUNCATE TABLE acme.input_file_inventory CASCADE;

-- Change tracking table
TRUNCATE TABLE acme.change_tracker CASCADE;
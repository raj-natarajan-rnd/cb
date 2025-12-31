## Summary: `create_dynamic_population_view()`

### Purpose
A configurable function that dynamically creates audit views for any tracked table. It displays current data alongside original values for modified fields, filtered by process step and year. Only fields with actual changes get `_original` columns.

### Parameters

| Parameter | Type | Description | Example |
|-----------|------|-------------|---------|
| `p_process_step` | VARCHAR(20) | Filter changes by process step, or `'ALL'` for all changes | `'EDIT'`, `'REVIEW'`, `'ALL'` |
| `p_response_table` | VARCHAR(100) | Base table name (without year suffix) | `'hu_inet_population'` |
| `p_year` | VARCHAR(4) | Year suffix for table/view naming | `'2024'` |
| `p_key_cols` | VARCHAR(100) | Comma-separated primary key columns | `'cmid, pnum'` |

### How It Works

1. **Parses key columns** into an array for dynamic join conditions
2. **Builds table/view names** with year suffix (e.g., `hu_inet_population_2024`)
3. **Queries change_tracker** for modified fields, optionally filtered by process step
4. **Generates a view** with:
   - All columns from the source table
   - `{field}_original` columns only for fields with tracked changes
5. **Creates appropriate joins** using the specified key columns

### Dependencies

| Object | Purpose |
|--------|---------|
| `acme.{response_table}_{year}` | Source table being tracked |
| `acme.change_tracker` | Change history with `process_step`, `var_name`, `original_value`, `created_dt`, and key columns |

### Usage Examples

```sql
-- View all changes for hu_inet_population_2024
SELECT create_dynamic_population_view('ALL', 'hu_inet_population', '2024', 'cmid, pnum');
-- Creates: acme.hu_inet_population_2024_all

-- View only EDIT step changes
SELECT create_dynamic_population_view('EDIT', 'hu_inet_population', '2024', 'cmid, pnum');
-- Creates: acme.hu_inet_population_2024_edit

-- Different table with different keys
SELECT create_dynamic_population_view('ALL', 'hh_inet_household', '2024', 'cmid');
-- Creates: acme.hh_inet_household_2024_all

-- Query the resulting view
SELECT * FROM acme.hu_inet_population_2024_edit;
```

### View Naming Convention

| Process Step | Resulting View Name |
|--------------|---------------------|
| `'ALL'` | `{table}_{year}_all` |
| `'EDIT'` | `{table}_{year}_edit` |
| `'REVIEW'` | `{table}_{year}_review` |

### Example Output

For `hu_inet_population_2024_edit` where `email` and `status` were edited:

| cmid | pnum | email | status | name | email_original | status_original |
|------|------|-------|--------|------|----------------|-----------------|
| 101 | 1 | new@x.com | Active | John | old@x.com | Pending |
| 102 | 1 | test@y.com | Active | Jane | NULL | NULL |

### When to Run

- When setting up audit views for a new table/year
- After a new field type first appears in `change_tracker`
- When you need process-step-specific views for different user roles or reports

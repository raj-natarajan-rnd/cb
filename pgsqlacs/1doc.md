## Generic Change Tracker Trigger Function

### Purpose

This PostgreSQL trigger function automatically tracks field-level changes to database records, creating an audit trail in the `acme.change_tracker` table. It captures what changed, from what value, to what value, and when—without requiring custom triggers for each table.

### How It Works

**1. Trigger Activation**

The function fires on UPDATE operations. When a row is modified in any table with this trigger attached, the function compares the old and new row states.

**2. Data Conversion**

```sql
old_data := to_jsonb(OLD);
new_data := to_jsonb(NEW);
```

Both the previous (`OLD`) and updated (`NEW`) row states are converted to JSONB format. This allows dynamic field iteration without knowing the table structure at design time.

**3. Record Identification**

```sql
record_cmid := COALESCE(new_data->>'cmid', 'N/A');
record_pnum := new_data->>'pnum';
```

Extracts the primary identifiers (`cmid` and optionally `pnum`) from the updated record. These link audit entries back to the source record.

**4. Field-by-Field Comparison**

The function loops through every field in the record and compares old vs. new values. For each changed field (excluding system/audit columns), it inserts a row into the change tracker:

| Column | Description |
|--------|-------------|
| `cmid` | Primary record identifier |
| `pnum` | Secondary identifier (population number), if applicable |
| `response_table` | Source table name (via `TG_TABLE_NAME`) |
| `action_code` | Operation type (`UPDATE`) |
| `var_name` | Name of the changed field |
| `original_value` | Previous value |
| `modified_value` | New value |
| `process_step` | Hardcoded as `DATA_CHANGE` |

**5. Excluded Fields**

These columns are intentionally skipped to avoid recursive/redundant logging:
- `created_dt`, `created_by` — immutable creation metadata
- `modified_dt`, `modified_by` — auto-updated by this trigger
- `cmid`, `pnum` — primary keys (changes would indicate a different record)

**6. Automatic Timestamp/User Update**

If the target table contains `modified_dt` and `modified_by` columns, they're automatically set to the current timestamp and session user, ensuring consistent audit metadata without application-level code.

### Usage

Attach the trigger to any table requiring change tracking:

```sql
CREATE TRIGGER track_changes
    BEFORE UPDATE ON acme.your_table
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();
```

### Dependencies

- Target tables should have `cmid` (and optionally `pnum`) columns for proper record linking
- The `acme.change_tracker` table must exist with the expected schema
- Tables benefit from having `modified_dt` and `modified_by` columns for automatic metadata updates

### Limitations

- Only handles UPDATE operations (INSERT/DELETE not tracked)
- Stores all values as text (type information lost)
- Per-field inserts may impact performance on wide tables with many changes

---

Want me to format this differently or add a diagram showing the data flow?

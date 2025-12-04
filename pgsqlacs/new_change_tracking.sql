-- Generic change tracking trigger function using change_tracker table
-- JSONB-based version (no hstore required)
CREATE OR REPLACE FUNCTION generic_change_tracker()
RETURNS TRIGGER AS $$
DECLARE
    old_data      jsonb;
    new_data      jsonb;
    field_name    text;
    old_val       text;
    new_val       text;
    record_cmid   varchar(9);
    record_pnum   varchar(9);
BEGIN
    IF TG_OP = 'UPDATE' THEN
        -- Convert rows to jsonb for comparison
        old_data := to_jsonb(OLD);
        new_data := to_jsonb(NEW);

        -- Get cmid (primary identifier for most tables)
        record_cmid := COALESCE(new_data->>'cmid', 'N/A');

        -- Get pnum if it exists (for population tables)
        record_pnum := new_data->>'pnum';

        -- Loop through all fields and check for changes
        FOR field_name IN
            SELECT jsonb_object_keys(new_data)
        LOOP
            old_val := old_data->>field_name;
            new_val := new_data->>field_name;

            -- Skip system fields and primary keys
            IF field_name NOT IN ('created_dt',
                                  'modified_dt',
                                  'created_by',
                                  'modified_by',
                                  'cmid',
                                  'pnum')
               AND (old_val IS DISTINCT FROM new_val)
            THEN
                INSERT INTO acme.change_tracker (
                    cmid,
                    pnum,
                    response_table,
                    action_code,
                    var_name,
                    original_value,
                    modified_value,
                    process_step
                ) VALUES (
                    record_cmid,
                    record_pnum,
                    TG_TABLE_NAME,
                    'UPDATE',
                    field_name,
                    old_val,
                    new_val,
                    'DATA_CHANGE'
                );
            END IF;
        END LOOP;

        -- Update modified timestamp and user if columns exist
        IF 'modified_dt' = ANY (
              SELECT column_name
              FROM information_schema.columns
              WHERE table_schema = TG_TABLE_SCHEMA
                AND table_name   = TG_TABLE_NAME
                AND column_name  = 'modified_dt'
           )
        THEN
            NEW.modified_dt := CURRENT_TIMESTAMP;
        END IF;

        IF 'modified_by' = ANY (
              SELECT column_name
              FROM information_schema.columns
              WHERE table_schema = TG_TABLE_SCHEMA
                AND table_name   = TG_TABLE_NAME
                AND column_name  = 'modified_by'
           )
        THEN
            NEW.modified_by := SESSION_USER;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


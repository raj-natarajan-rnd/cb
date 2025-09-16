-- Function to create dynamic view with only columns that have changes

CREATE OR REPLACE FUNCTION create_dynamic_hu_inet_population_view()
RETURNS TEXT AS $$
DECLARE
    changed_fields TEXT[];
    view_sql TEXT;
    field_name TEXT;
BEGIN
    -- Get list of fields that have been changed
    SELECT ARRAY_AGG(DISTINCT var_name)
    INTO changed_fields
    FROM acme.change_tracker 
    WHERE response_table = 'hu_inet_population';
    
    -- Start building the view SQL
    view_sql := 'CREATE OR REPLACE VIEW acme.hu_inet_population_dynamic AS
WITH original_values AS (
    SELECT 
        cmid,
        pnum,
        var_name,
        original_value,
        ROW_NUMBER() OVER (PARTITION BY cmid, pnum, var_name ORDER BY created_dt) as rn
    FROM acme.change_tracker 
    WHERE response_table = ''hu_inet_population''
),
first_originals AS (
    SELECT cmid, pnum, var_name, original_value
    FROM original_values 
    WHERE rn = 1
)
SELECT 
    p.cmid,
    p.pnum';
    
    -- Add all regular columns first
    FOR field_name IN 
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_schema = 'acme' 
        AND table_name = 'hu_inet_population' 
        AND column_name NOT IN ('cmid', 'pnum')
        ORDER BY ordinal_position
    LOOP
        view_sql := view_sql || ',
    p.' || field_name;
        
        -- Add original column only if this field has changes
        IF changed_fields IS NOT NULL AND field_name = ANY(changed_fields) THEN
            view_sql := view_sql || ',
    CASE WHEN o_' || field_name || '.original_value IS NOT NULL THEN o_' || field_name || '.original_value END as ' || field_name || '_original';
        END IF;
    END LOOP;
    
    -- Add FROM clause
    view_sql := view_sql || '
FROM acme.hu_inet_population p';
    
    -- Add LEFT JOINs only for fields that have changes
    IF changed_fields IS NOT NULL THEN
        FOREACH field_name IN ARRAY changed_fields
        LOOP
            view_sql := view_sql || '
LEFT JOIN first_originals o_' || field_name || ' ON p.cmid = o_' || field_name || '.cmid AND p.pnum = o_' || field_name || '.pnum AND o_' || field_name || '.var_name = ''' || field_name || '''';
        END LOOP;
    END IF;
    
    -- Execute the dynamic SQL
    EXECUTE view_sql;
    
    RETURN 'Dynamic view created with ' || COALESCE(array_length(changed_fields, 1), 0) || ' original columns';
END;
$$ LANGUAGE plpgsql;

-- Function to refresh the dynamic view (call this after data changes)
CREATE OR REPLACE FUNCTION refresh_dynamic_view()
RETURNS TEXT AS $$
BEGIN
    RETURN create_dynamic_hu_inet_population_view();
END;
$$ LANGUAGE plpgsql;

-- Create the initial dynamic view
SELECT create_dynamic_hu_inet_population_view();
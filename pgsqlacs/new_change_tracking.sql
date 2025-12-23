-- Function to create dynamic view with configurable parameters

CREATE OR REPLACE FUNCTION create_dynamic_population_view(
    p_process_step VARCHAR(20),
    p_response_table VARCHAR(100),
    p_year VARCHAR(4),
    p_key_cols VARCHAR(100)
)
RETURNS TEXT AS $$
DECLARE
    changed_fields TEXT[];
    view_sql TEXT;
    field_name TEXT;
    key_cols_array TEXT[];
    full_table_name TEXT;
    view_name TEXT;
    process_step_filter TEXT;
BEGIN
    -- Parse key columns from comma-separated string into array
    key_cols_array := STRING_TO_ARRAY(REPLACE(p_key_cols, ' ', ''), ',');
    
    -- Build full table name with year suffix
    full_table_name := p_response_table || '_' || p_year;
    
    -- Build view name with process step suffix (no 'dynamic' word)
    IF UPPER(p_process_step) = 'ALL' THEN
        view_name := full_table_name || '_all';
        process_step_filter := '';
    ELSE
        view_name := full_table_name || '_' || LOWER(p_process_step);
        process_step_filter := ' AND process_step = ''' || p_process_step || '''';
    END IF;
    
    -- Get list of fields that have been changed (with optional process_step filter)
    EXECUTE format(
        'SELECT ARRAY_AGG(DISTINCT var_name)
         FROM acme.change_tracker 
         WHERE response_table = %L %s',
        full_table_name,
        process_step_filter
    ) INTO changed_fields;
    
    -- Start building the view SQL
    view_sql := 'CREATE OR REPLACE VIEW acme.' || view_name || ' AS
WITH original_values AS (
    SELECT 
        ' || ARRAY_TO_STRING(key_cols_array, ', ') || ',
        var_name,
        original_value,
        ROW_NUMBER() OVER (PARTITION BY ' || ARRAY_TO_STRING(key_cols_array, ', ') || ', var_name ORDER BY created_dt) as rn
    FROM acme.change_tracker 
    WHERE response_table = ''' || full_table_name || '''' || process_step_filter || '
),
first_originals AS (
    SELECT ' || ARRAY_TO_STRING(key_cols_array, ', ') || ', var_name, original_value
    FROM original_values 
    WHERE rn = 1
)
SELECT ';
    
    -- Add key columns first
    FOR i IN 1..array_length(key_cols_array, 1) LOOP
        IF i > 1 THEN
            view_sql := view_sql || ',
    ';
        END IF;
        view_sql := view_sql || 'p.' || key_cols_array[i];
    END LOOP;
    
    -- Add all regular columns (excluding key columns)
    FOR field_name IN 
        EXECUTE format(
            'SELECT column_name 
             FROM information_schema.columns 
             WHERE table_schema = ''acme'' 
             AND table_name = %L 
             AND column_name NOT IN (%s)
             ORDER BY ordinal_position',
            full_table_name,
            (SELECT STRING_AGG('''' || col || '''', ', ') FROM UNNEST(key_cols_array) AS col)
        )
    LOOP
        view_sql := view_sql || ',
    p.' || field_name;
        
        -- Add original column only if this field has changes
        IF changed_fields IS NOT NULL AND field_name = ANY(changed_fields) THEN
            view_sql := view_sql || ',
    CASE WHEN o_' || field_name || '.original_value IS NOT NULL THEN o_' || field_name || '.original_value END AS ' || field_name || '_original';
        END IF;
    END LOOP;
    
    -- Add FROM clause
    view_sql := view_sql || '
FROM acme.' || full_table_name || ' p';
    
    -- Add LEFT JOINs only for fields that have changes
    IF changed_fields IS NOT NULL THEN
        FOREACH field_name IN ARRAY changed_fields
        LOOP
            view_sql := view_sql || '
LEFT JOIN first_originals o_' || field_name || ' ON ';
            
            -- Add join conditions for all key columns
            FOR i IN 1..array_length(key_cols_array, 1) LOOP
                IF i > 1 THEN
                    view_sql := view_sql || ' AND ';
                END IF;
                view_sql := view_sql || 'p.' || key_cols_array[i] || ' = o_' || field_name || '.' || key_cols_array[i];
            END LOOP;
            
            view_sql := view_sql || ' AND o_' || field_name || '.var_name = ''' || field_name || '''';
        END LOOP;
    END IF;
    
    -- Execute the dynamic SQL
    EXECUTE view_sql;
    
    RETURN 'View acme.' || view_name || ' created with ' || COALESCE(array_length(changed_fields, 1), 0) || ' original columns';
END;
$$ LANGUAGE plpgsql;

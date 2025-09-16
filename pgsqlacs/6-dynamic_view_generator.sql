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

-- Function to refresh the population dynamic view (call this after data changes)
CREATE OR REPLACE FUNCTION refresh_population_dynamic_view()
RETURNS TEXT AS $$
BEGIN
    RETURN create_dynamic_hu_inet_population_view();
END;
$$ LANGUAGE plpgsql;

-- Function to create dynamic view for housing
CREATE OR REPLACE FUNCTION create_dynamic_hu_inet_housing_view()
RETURNS TEXT AS $$
DECLARE
    changed_fields TEXT[];
    view_sql TEXT;
    field_name TEXT;
BEGIN
    SELECT ARRAY_AGG(DISTINCT var_name)
    INTO changed_fields
    FROM acme.change_tracker 
    WHERE response_table = 'hu_inet_housing';
    
    view_sql := 'CREATE OR REPLACE VIEW acme.hu_inet_housing_dynamic AS
WITH original_values AS (
    SELECT 
        cmid,
        var_name,
        original_value,
        ROW_NUMBER() OVER (PARTITION BY cmid, var_name ORDER BY created_dt) as rn
    FROM acme.change_tracker 
    WHERE response_table = ''hu_inet_housing''
),
first_originals AS (
    SELECT cmid, var_name, original_value
    FROM original_values 
    WHERE rn = 1
)
SELECT 
    h.cmid';
    
    FOR field_name IN 
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_schema = 'acme' 
        AND table_name = 'hu_inet_housing' 
        AND column_name NOT IN ('cmid')
        ORDER BY ordinal_position
    LOOP
        view_sql := view_sql || ',
    h.' || field_name;
        
        IF changed_fields IS NOT NULL AND field_name = ANY(changed_fields) THEN
            view_sql := view_sql || ',
    CASE WHEN o_' || field_name || '.original_value IS NOT NULL THEN o_' || field_name || '.original_value END as ' || field_name || '_original';
        END IF;
    END LOOP;
    
    view_sql := view_sql || '
FROM acme.hu_inet_housing h';
    
    IF changed_fields IS NOT NULL THEN
        FOREACH field_name IN ARRAY changed_fields
        LOOP
            view_sql := view_sql || '
LEFT JOIN first_originals o_' || field_name || ' ON h.cmid = o_' || field_name || '.cmid AND o_' || field_name || '.var_name = ''' || field_name || '''';
        END LOOP;
    END IF;
    
    EXECUTE view_sql;
    
    RETURN 'Housing dynamic view created with ' || COALESCE(array_length(changed_fields, 1), 0) || ' original columns';
END;
$$ LANGUAGE plpgsql;

-- Function to create dynamic view for roster
CREATE OR REPLACE FUNCTION create_dynamic_hu_inet_roster_view()
RETURNS TEXT AS $$
DECLARE
    changed_fields TEXT[];
    view_sql TEXT;
    field_name TEXT;
BEGIN
    SELECT ARRAY_AGG(DISTINCT var_name)
    INTO changed_fields
    FROM acme.change_tracker 
    WHERE response_table = 'hu_inet_roster';
    
    view_sql := 'CREATE OR REPLACE VIEW acme.hu_inet_roster_dynamic AS
WITH original_values AS (
    SELECT 
        cmid,
        var_name,
        original_value,
        ROW_NUMBER() OVER (PARTITION BY cmid, var_name ORDER BY created_dt) as rn
    FROM acme.change_tracker 
    WHERE response_table = ''hu_inet_roster''
),
first_originals AS (
    SELECT cmid, var_name, original_value
    FROM original_values 
    WHERE rn = 1
)
SELECT 
    r.cmid';
    
    FOR field_name IN 
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_schema = 'acme' 
        AND table_name = 'hu_inet_roster' 
        AND column_name NOT IN ('cmid')
        ORDER BY ordinal_position
    LOOP
        view_sql := view_sql || ',
    r.' || field_name;
        
        IF changed_fields IS NOT NULL AND field_name = ANY(changed_fields) THEN
            view_sql := view_sql || ',
    CASE WHEN o_' || field_name || '.original_value IS NOT NULL THEN o_' || field_name || '.original_value END as ' || field_name || '_original';
        END IF;
    END LOOP;
    
    view_sql := view_sql || '
FROM acme.hu_inet_roster r';
    
    IF changed_fields IS NOT NULL THEN
        FOREACH field_name IN ARRAY changed_fields
        LOOP
            view_sql := view_sql || '
LEFT JOIN first_originals o_' || field_name || ' ON r.cmid = o_' || field_name || '.cmid AND o_' || field_name || '.var_name = ''' || field_name || '''';
        END LOOP;
    END IF;
    
    EXECUTE view_sql;
    
    RETURN 'Roster dynamic view created with ' || COALESCE(array_length(changed_fields, 1), 0) || ' original columns';
END;
$$ LANGUAGE plpgsql;

-- Function to refresh all dynamic views
CREATE OR REPLACE FUNCTION refresh_all_dynamic_views()
RETURNS TEXT AS $$
DECLARE
    result TEXT := '';
BEGIN
    result := result || create_dynamic_hu_inet_population_view() || E'\n';
    result := result || create_dynamic_hu_inet_housing_view() || E'\n';
    result := result || create_dynamic_hu_inet_roster_view();
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- Create all initial dynamic views
SELECT refresh_all_dynamic_views();
-- Apply change tracking triggers to all relevant tables

-- Housing tables
CREATE TRIGGER ct_hu_inet_housing_trigger
    AFTER UPDATE ON acme.hu_inet_housing
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_hu_mail_housing_trigger
    AFTER UPDATE ON acme.hu_mail_housing
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_gq_mail_housing_trigger
    AFTER UPDATE ON acme.gq_mail_housing
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

-- Population tables
CREATE TRIGGER ct_hu_inet_population_trigger
    AFTER UPDATE ON acme.hu_inet_population
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_hu_mail_population_trigger
    AFTER UPDATE ON acme.hu_mail_population
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_gq_mail_population_trigger
    AFTER UPDATE ON acme.gq_mail_population
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_gq_inet_population_trigger
    AFTER UPDATE ON acme.gq_inet_population
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

-- Other tables
CREATE TRIGGER ct_gq_mail_group_quarters_trigger
    AFTER UPDATE ON acme.gq_mail_group_quarters
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_hu_inet_roster_trigger
    AFTER UPDATE ON acme.hu_inet_roster
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_final_mail_inet_2025_trigger
    AFTER UPDATE ON acme.final_mail_inet_2025
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_final_mail_inet_2026_trigger
    AFTER UPDATE ON acme.final_mail_inet_2026
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();

CREATE TRIGGER ct_input_file_inventory_trigger
    AFTER UPDATE ON acme.input_file_inventory
    FOR EACH ROW
    EXECUTE FUNCTION generic_change_tracker();
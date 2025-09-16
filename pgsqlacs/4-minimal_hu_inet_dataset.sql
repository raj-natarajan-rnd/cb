-- Minimal hu_inet dataset with correct field lengths

-- Clear existing data
TRUNCATE TABLE acme.hu_inet_population CASCADE;
TRUNCATE TABLE acme.hu_inet_roster CASCADE;
TRUNCATE TABLE acme.hu_inet_housing CASCADE;
TRUNCATE TABLE acme.change_tracker CASCADE;

-- Insert housing data (5 records)
INSERT INTO acme.hu_inet_housing (cmid, "access", acr, ags, bath, bds, bld, broadbnd, tel, ten, val) VALUES
('100000001', '1', '2', '3', '1', '03', '01', '1', '1', '1', '250000'),
('100000002', '2', '1', '2', '2', '04', '02', '1', '1', '2', '180000'),
('100000003', '1', '3', '1', '1', '02', '01', '1', '1', '1', '320000'),
('100000004', '2', '2', '3', '2', '05', '03', '1', '1', '1', '275000'),
('100000005', '1', '1', '2', '1', '03', '02', '1', '1', '2', '195000');

-- Insert population data (10 records)
INSERT INTO acme.hu_inet_population (cmid, pnum, age, fname, lname, sex, mar, relship, cit, eng, wrk, sch, hi_emp, hi_mcare, hi_mcaid, ddrs, dear, deye, "int", wag, ss, ssi, rac_wht, rac_blk, rac_aian, milsvc, yoe, ancw, fodw, lanw, ocw1, ocw2) VALUES
('100000001', '600000001', '042', 'John', 'Smith', '1', '1', '01', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '85000000', '75000000', '55000', '45000', '1', '0', '0', '1', '2020', 'German', 'Engineer', 'English', 'Programming', 'Database'),
('100000001', '600000002', '038', 'Jane', 'Smith', '2', '1', '02', '1', '1', '0', '1', '1', '0', '0', '0', '0', '0', '65000000', '58000000', '50000', '40000', '1', '0', '0', '0', '2021', 'Irish', 'Manager', 'Spanish', 'Marketing', 'Strategy'),
('100000002', '600000003', '035', 'Mike', 'Johnson', '1', '2', '01', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '75000000', '68000000', '60000', '50000', '1', '0', '0', '1', '2019', 'English', 'Engineer', 'French', 'Construction', 'Management'),
('100000002', '600000004', '033', 'Sarah', 'Johnson', '2', '3', '02', '1', '1', '0', '1', '0', '1', '0', '0', '0', '0', '58000000', '52000000', '40000', '35000', '1', '0', '0', '0', '2020', 'Scottish', 'Nurse', 'German', 'Patient Care', 'Medical'),
('100000003', '600000005', '045', 'David', 'Brown', '1', '1', '01', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '92000000', '82000000', '70000', '60000', '1', '0', '0', '1', '2018', 'Italian', 'Analyst', 'Portuguese', 'Finance', 'Investment'),
('100000003', '600000006', '041', 'Lisa', 'Brown', '2', '1', '02', '1', '1', '0', '1', '1', '0', '0', '0', '0', '0', '72000000', '65000000', '55000', '45000', '1', '0', '0', '0', '2019', 'Polish', 'Teacher', 'Mandarin', 'Education', 'Curriculum'),
('100000004', '600000007', '028', 'Robert', 'Wilson', '1', '4', '01', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '48000000', '42000000', '30000', '25000', '1', '0', '0', '0', '2022', 'Mexican', 'Sales Rep', 'Portuguese', 'Sales', 'Customer'),
('100000004', '600000008', '026', 'Mary', 'Wilson', '2', '4', '02', '1', '1', '0', '1', '0', '1', '0', '0', '0', '0', '38000000', '32000000', '25000', '20000', '1', '0', '0', '0', '2023', 'Chinese', 'Designer', 'Mandarin', 'Design', 'Creative'),
('100000005', '600000009', '052', 'Chris', 'Garcia', '1', '2', '01', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '95000000', '85000000', '75000', '65000', '1', '0', '0', '1', '2015', 'Spanish', 'Doctor', 'Spanish', 'Medicine', 'Surgery'),
('100000005', '600000010', '048', 'Amy', 'Garcia', '2', '2', '02', '1', '1', '0', '1', '1', '0', '0', '0', '0', '0', '78000000', '72000000', '60000', '50000', '1', '0', '0', '0', '2016', 'French', 'Lawyer', 'French', 'Legal', 'Contract');

-- Insert roster data (5 records)
INSERT INTO acme.hu_inet_roster (cmid, rostaf01, rostal01, rostam01, rostbf21, rostbl21) VALUES
('100000001', 'John', 'Smith', '1', 'Jane', 'Smith'),
('100000002', 'Mike', 'Johnson', '1', 'Sarah', 'Johnson'),
('100000003', 'David', 'Brown', '1', 'Lisa', 'Brown'),
('100000004', 'Robert', 'Wilson', '1', 'Mary', 'Wilson'),
('100000005', 'Chris', 'Garcia', '1', 'Amy', 'Garcia');

commit;
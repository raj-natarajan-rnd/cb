-- Bulk Data Changes Script
-- This script makes extensive changes to simulate real-world data updates

-- Phase 1: Housing Updates (Property Value Changes)
UPDATE acme.hu_inet_housing SET val = '315000' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '225000', bds = '06' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '385000', bath = '3' WHERE cmid = '100000003';

-- Phase 2: Population Income Updates (Multiple changes per person)
UPDATE acme.hu_inet_population SET wag = '88000000', ss = '62000' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET wag = '72000000', ssi = '48000' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET wag = '89000000', ss = '71000' WHERE pnum = '600000003';

-- Phase 3: Employment Changes
UPDATE acme.hu_inet_population SET wrk = '1', hi_emp = '1' WHERE pnum = '600000004';
UPDATE acme.hu_inet_population SET ocw1 = 'Operations', ocw2 = 'Planning' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET fodw = 'Principal', ocw1 = 'Administration', ocw2 = 'Policy' WHERE pnum = '600000006';

-- Phase 4: Multiple Updates to Same Records
-- John Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '044' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET mar = '3' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET lanw = 'French' WHERE pnum = '600000001';

-- Jane Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '040' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET sch = '1' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET ancw = 'Italian' WHERE pnum = '600000002';

-- Phase 5: Housing Infrastructure Updates
UPDATE acme.hu_inet_housing SET broadbnd = '1', tel = '1' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET "access" = '2', acr = '1' WHERE cmid = '100000005';

-- Phase 6: Demographic Changes
UPDATE acme.hu_inet_population SET cit = '1', eng = '1' WHERE pnum = '600000007';
UPDATE acme.hu_inet_population SET rac_wht = '1', rac_blk = '0' WHERE pnum = '600000008';
UPDATE acme.hu_inet_population SET milsvc = '1', yoe = '2017' WHERE pnum = '600000009';

-- Phase 7: Healthcare Coverage Changes
UPDATE acme.hu_inet_population SET hi_mcare = '0', hi_mcaid = '1' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET hi_emp = '1', hi_mcare = '0' WHERE pnum = '600000001';

-- Phase 8: Additional Multiple Changes to High-Activity Records
-- Mike Johnson (multiple updates)
UPDATE acme.hu_inet_population SET wag = '92000000' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET ss = '78000' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET fodw = 'Lead Engineer' WHERE pnum = '600000003';

-- David Brown (multiple updates)
UPDATE acme.hu_inet_population SET age = '047' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET wag = '105000000' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET ocw2 = 'Trading' WHERE pnum = '600000005';

-- Phase 9: Roster Updates
UPDATE acme.hu_inet_roster SET rostaf01 = 'Johnny' WHERE cmid = '100000001';
UPDATE acme.hu_inet_roster SET rostal01 = 'Johnson-Brown' WHERE cmid = '100000002';

-- Phase 10: Final Housing Value Adjustments
UPDATE acme.hu_inet_housing SET val = '325000' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '235000' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '395000' WHERE cmid = '100000003';
UPDATE acme.hu_inet_housing SET val = '315000' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET val = '245000' WHERE cmid = '100000005';

-- Phase 11: More Population Changes (Simulating Life Events)
UPDATE acme.hu_inet_population SET mar = '1' WHERE pnum = '600000007'; -- Married
UPDATE acme.hu_inet_population SET relship = '01' WHERE pnum = '600000008'; -- Changed relationship
UPDATE acme.hu_inet_population SET wrk = '1' WHERE pnum = '600000009'; -- Working
UPDATE acme.hu_inet_population SET sch = '0' WHERE pnum = '600000010'; -- Finished school

-- Phase 12: Final Round of Multiple Changes
-- Chris Garcia (multiple life changes)
UPDATE acme.hu_inet_population SET age = '054' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET mar = '1' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET hi_emp = '1' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET wag = '110000000' WHERE pnum = '600000009';

-- Amy Garcia (career change)
UPDATE acme.hu_inet_population SET fodw = 'Attorney' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET wag = '102000000' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET ocw1 = 'Corporate' WHERE pnum = '600000010';

COMMIT;

-- Summary: This script makes approximately 50+ changes across all tables with different values
-- Some records (like John Smith, Jane Smith, Mike Johnson, David Brown, Chris Garcia) 
-- receive multiple updates to simulate real-world scenarios where individuals
-- experience multiple life changes over time.
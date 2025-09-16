-- Bulk Data Changes Script
-- This script makes extensive changes to simulate real-world data updates

-- Phase 1: Housing Updates (Property Value Changes)
UPDATE acme.hu_inet_housing SET val = '275000' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '195000', bds = '05' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '340000', bath = '2' WHERE cmid = '100000003';

-- Phase 2: Population Income Updates (Multiple changes per person)
UPDATE acme.hu_inet_population SET wag = '78000000', ss = '58000' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET wag = '68000000', ssi = '42000' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET wag = '82000000', ss = '65000' WHERE pnum = '600000003';

-- Phase 3: Employment Changes
UPDATE acme.hu_inet_population SET wrk = '0', hi_emp = '0' WHERE pnum = '600000004';
UPDATE acme.hu_inet_population SET ocw1 = 'Management', ocw2 = 'Leadership' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET fodw = 'Director', ocw1 = 'Teaching', ocw2 = 'Research' WHERE pnum = '600000006';

-- Phase 4: Multiple Updates to Same Records
-- John Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '043' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET mar = '2' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET lanw = 'German' WHERE pnum = '600000001';

-- Jane Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '039' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET sch = '0' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET ancw = 'German' WHERE pnum = '600000002';

-- Phase 5: Housing Infrastructure Updates
UPDATE acme.hu_inet_housing SET broadbnd = '0', tel = '0' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET "access" = '3', acr = '3' WHERE cmid = '100000005';

-- Phase 6: Demographic Changes
UPDATE acme.hu_inet_population SET cit = '0', eng = '0' WHERE pnum = '600000007';
UPDATE acme.hu_inet_population SET rac_wht = '0', rac_blk = '1' WHERE pnum = '600000008';
UPDATE acme.hu_inet_population SET milsvc = '0', yoe = '2024' WHERE pnum = '600000009';

-- Phase 7: Healthcare Coverage Changes
UPDATE acme.hu_inet_population SET hi_mcare = '1', hi_mcaid = '0' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET hi_emp = '0', hi_mcare = '1' WHERE pnum = '600000001';

-- Phase 8: Additional Multiple Changes to High-Activity Records
-- Mike Johnson (multiple updates)
UPDATE acme.hu_inet_population SET wag = '85000000' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET ss = '72000' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET fodw = 'Senior Engineer' WHERE pnum = '600000003';

-- David Brown (multiple updates)
UPDATE acme.hu_inet_population SET age = '046' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET wag = '98000000' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET ocw2 = 'Portfolio' WHERE pnum = '600000005';

-- Phase 9: Roster Updates
UPDATE acme.hu_inet_roster SET rostaf01 = 'Jonathan' WHERE cmid = '100000001';
UPDATE acme.hu_inet_roster SET rostal01 = 'Johnson-Smith' WHERE cmid = '100000002';

-- Phase 10: Final Housing Value Adjustments
UPDATE acme.hu_inet_housing SET val = '285000' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '205000' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '350000' WHERE cmid = '100000003';
UPDATE acme.hu_inet_housing SET val = '290000' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET val = '210000' WHERE cmid = '100000005';

-- Phase 11: More Population Changes (Simulating Life Events)
UPDATE acme.hu_inet_population SET mar = '3' WHERE pnum = '600000007'; -- Divorced
UPDATE acme.hu_inet_population SET relship = '03' WHERE pnum = '600000008'; -- Changed relationship
UPDATE acme.hu_inet_population SET wrk = '0' WHERE pnum = '600000009'; -- Retired
UPDATE acme.hu_inet_population SET sch = '1' WHERE pnum = '600000010'; -- Back to school

-- Phase 12: Final Round of Multiple Changes
-- Chris Garcia (multiple life changes)
UPDATE acme.hu_inet_population SET age = '053' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET mar = '3' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET hi_emp = '0' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET wag = '0' WHERE pnum = '600000009';

-- Amy Garcia (career change)
UPDATE acme.hu_inet_population SET fodw = 'Judge' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET wag = '95000000' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET ocw1 = 'Judicial' WHERE pnum = '600000010';

COMMIT;

-- Summary: This script makes approximately 50+ changes across all tables
-- Some records (like John Smith, Jane Smith, Mike Johnson, David Brown, Chris Garcia) 
-- receive multiple updates to simulate real-world scenarios where individuals
-- experience multiple life changes over time.
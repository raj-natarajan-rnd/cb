-- Bulk Data Changes Script
-- This script makes extensive changes to simulate real-world data updates

-- Phase 1: Housing Updates (Property Value Changes)
UPDATE acme.hu_inet_housing SET val = '425000', kbid = '7394821056' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '298000', bds = '07', kbid = '5827394610' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '465000', bath = '4', kbid = '9183746520' WHERE cmid = '100000003';

-- Phase 2: Population Income Updates (Multiple changes per person)
UPDATE acme.hu_inet_population SET wag = '95000000', ss = '68000', kbid = '4729183650' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET wag = '81000000', ssi = '52000', kbid = '8364729150' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET wag = '97000000', ss = '79000', kbid = '2947183650' WHERE pnum = '600000003';

-- Phase 3: Employment Changes
UPDATE acme.hu_inet_population SET wrk = '0', hi_emp = '0', kbid = '6183947250' WHERE pnum = '600000004';
UPDATE acme.hu_inet_population SET ocw1 = 'Executive', ocw2 = 'Strategy', kbid = '7529184630' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET fodw = 'Superintendent', ocw1 = 'Leadership', ocw2 = 'Development', kbid = '3847291650' WHERE pnum = '600000006';

-- Phase 4: Multiple Updates to Same Records
-- John Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '045', kbid = '9274183650' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET mar = '4', kbid = '5183947260' WHERE pnum = '600000001';
UPDATE acme.hu_inet_population SET lanw = 'Italian', kbid = '8472916350' WHERE pnum = '600000001';

-- Jane Smith gets multiple changes
UPDATE acme.hu_inet_population SET age = '041', kbid = '6394728150' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET sch = '0', kbid = '2847193650' WHERE pnum = '600000002';
UPDATE acme.hu_inet_population SET ancw = 'Spanish', kbid = '7183946250' WHERE pnum = '600000002';

-- Phase 5: Housing Infrastructure Updates
UPDATE acme.hu_inet_housing SET broadbnd = '0', tel = '0', kbid = '4729183650' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET "access" = '1', acr = '2', kbid = '9183746520' WHERE cmid = '100000005';

-- Phase 6: Demographic Changes
UPDATE acme.hu_inet_population SET cit = '0', eng = '0', kbid = '5847291630' WHERE pnum = '600000007';
UPDATE acme.hu_inet_population SET rac_wht = '0', rac_blk = '1', kbid = '3729184650' WHERE pnum = '600000008';
UPDATE acme.hu_inet_population SET milsvc = '0', yoe = '2016', kbid = '8194736250' WHERE pnum = '600000009';

-- Phase 7: Healthcare Coverage Changes
UPDATE acme.hu_inet_population SET hi_mcare = '1', hi_mcaid = '0', kbid = '6472918350' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET hi_emp = '0', hi_mcare = '1', kbid = '2847193650' WHERE pnum = '600000001';

-- Phase 8: Additional Multiple Changes to High-Activity Records
-- Mike Johnson (multiple updates)
UPDATE acme.hu_inet_population SET wag = '108000000', kbid = '7394821650' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET ss = '85000', kbid = '5183947260' WHERE pnum = '600000003';
UPDATE acme.hu_inet_population SET fodw = 'Chief Engineer', kbid = '9274183650' WHERE pnum = '600000003';

-- David Brown (multiple updates)
UPDATE acme.hu_inet_population SET age = '048', kbid = '4729183650' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET wag = '125000000', kbid = '8364729150' WHERE pnum = '600000005';
UPDATE acme.hu_inet_population SET ocw2 = 'Banking', kbid = '6183947250' WHERE pnum = '600000005';

-- Phase 9: Roster Updates
UPDATE acme.hu_inet_roster SET rostaf01 = 'Jack', kbid = '3847291650' WHERE cmid = '100000001';
UPDATE acme.hu_inet_roster SET rostal01 = 'Johnson-Davis', kbid = '7529184630' WHERE cmid = '100000002';

-- Phase 10: Final Housing Value Adjustments
UPDATE acme.hu_inet_housing SET val = '445000', kbid = '2947183650' WHERE cmid = '100000001';
UPDATE acme.hu_inet_housing SET val = '315000', kbid = '8472916350' WHERE cmid = '100000002';
UPDATE acme.hu_inet_housing SET val = '485000', kbid = '5847291630' WHERE cmid = '100000003';
UPDATE acme.hu_inet_housing SET val = '365000', kbid = '9183746520' WHERE cmid = '100000004';
UPDATE acme.hu_inet_housing SET val = '285000', kbid = '4729183650' WHERE cmid = '100000005';

-- Phase 11: More Population Changes (Simulating Life Events)
UPDATE acme.hu_inet_population SET mar = '2', kbid = '6394728150' WHERE pnum = '600000007'; -- Widowed
UPDATE acme.hu_inet_population SET relship = '02', kbid = '3729184650' WHERE pnum = '600000008'; -- Changed relationship
UPDATE acme.hu_inet_population SET wrk = '0', kbid = '8194736250' WHERE pnum = '600000009'; -- Not working
UPDATE acme.hu_inet_population SET sch = '1', kbid = '7183946250' WHERE pnum = '600000010'; -- In school

-- Phase 12: Final Round of Multiple Changes
-- Chris Garcia (multiple life changes)
UPDATE acme.hu_inet_population SET age = '055', kbid = '2847193650' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET mar = '2', kbid = '6472918350' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET hi_emp = '0', kbid = '7394821650' WHERE pnum = '600000009';
UPDATE acme.hu_inet_population SET wag = '125000000', kbid = '5183947260' WHERE pnum = '600000009';

-- Amy Garcia (career change)
UPDATE acme.hu_inet_population SET fodw = 'Prosecutor', kbid = '9274183650' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET wag = '115000000', kbid = '4729183650' WHERE pnum = '600000010';
UPDATE acme.hu_inet_population SET ocw1 = 'Criminal', kbid = '8364729150' WHERE pnum = '600000010';

COMMIT;

-- Summary: This script makes approximately 50+ changes across all tables with updated values and kbid
-- Some records (like John Smith, Jane Smith, Mike Johnson, David Brown, Chris Garcia) 
-- receive multiple updates to simulate real-world scenarios where individuals
-- experience multiple life changes over time.
-- All updates now include kbid field with random 10-character numbers
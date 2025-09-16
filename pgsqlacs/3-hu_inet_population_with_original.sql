-- Dynamic view for hu_inet_population with original values for modified fields

CREATE OR REPLACE VIEW acme.hu_inet_population_with_original AS
WITH original_values AS (
    SELECT 
        cmid,
        pnum,
        var_name,
        original_value,
        ROW_NUMBER() OVER (PARTITION BY cmid, pnum, var_name ORDER BY created_dt) as rn
    FROM acme.change_tracker 
    WHERE response_table = 'hu_inet_population'
),
first_originals AS (
    SELECT cmid, pnum, var_name, original_value
    FROM original_values 
    WHERE rn = 1
)
SELECT 
    p.cmid,
    p.pnum,
    p.age,
    CASE WHEN o_age.original_value IS NOT NULL THEN o_age.original_value END as age_original,
    p.ancw,
    CASE WHEN o_ancw.original_value IS NOT NULL THEN o_ancw.original_value END as ancw_original,
    p.cit,
    CASE WHEN o_cit.original_value IS NOT NULL THEN o_cit.original_value END as cit_original,
    p.citw,
    CASE WHEN o_citw.original_value IS NOT NULL THEN o_citw.original_value END as citw_original,
    p.cow,
    CASE WHEN o_cow.original_value IS NOT NULL THEN o_cow.original_value END as cow_original,
    p.dbd,
    CASE WHEN o_dbd.original_value IS NOT NULL THEN o_dbd.original_value END as dbd_original,
    p.dbm,
    CASE WHEN o_dbm.original_value IS NOT NULL THEN o_dbm.original_value END as dbm_original,
    p.dby,
    CASE WHEN o_dby.original_value IS NOT NULL THEN o_dby.original_value END as dby_original,
    p.ddrs,
    CASE WHEN o_ddrs.original_value IS NOT NULL THEN o_ddrs.original_value END as ddrs_original,
    p.dear,
    CASE WHEN o_dear.original_value IS NOT NULL THEN o_dear.original_value END as dear_original,
    p.deye,
    CASE WHEN o_deye.original_value IS NOT NULL THEN o_deye.original_value END as deye_original,
    p.dout,
    CASE WHEN o_dout.original_value IS NOT NULL THEN o_dout.original_value END as dout_original,
    p.dphy,
    CASE WHEN o_dphy.original_value IS NOT NULL THEN o_dphy.original_value END as dphy_original,
    p.drat,
    CASE WHEN o_drat.original_value IS NOT NULL THEN o_drat.original_value END as drat_original,
    p.dratx,
    CASE WHEN o_dratx.original_value IS NOT NULL THEN o_dratx.original_value END as dratx_original,
    p.drem,
    CASE WHEN o_drem.original_value IS NOT NULL THEN o_drem.original_value END as drem_original,
    p.eng,
    CASE WHEN o_eng.original_value IS NOT NULL THEN o_eng.original_value END as eng_original,
    p.fer,
    CASE WHEN o_fer.original_value IS NOT NULL THEN o_fer.original_value END as fer_original,
    p.fname,
    CASE WHEN o_fname.original_value IS NOT NULL THEN o_fname.original_value END as fname_original,
    p.fodw,
    CASE WHEN o_fodw.original_value IS NOT NULL THEN o_fodw.original_value END as fodw_original,
    p.gcl,
    CASE WHEN o_gcl.original_value IS NOT NULL THEN o_gcl.original_value END as gcl_original,
    p.gcm,
    CASE WHEN o_gcm.original_value IS NOT NULL THEN o_gcm.original_value END as gcm_original,
    p.gcr,
    CASE WHEN o_gcr.original_value IS NOT NULL THEN o_gcr.original_value END as gcr_original,
    p.hi_drect,
    CASE WHEN o_hi_drect.original_value IS NOT NULL THEN o_hi_drect.original_value END as hi_drect_original,
    p.hi_emp,
    CASE WHEN o_hi_emp.original_value IS NOT NULL THEN o_hi_emp.original_value END as hi_emp_original,
    p.hi_ihs,
    CASE WHEN o_hi_ihs.original_value IS NOT NULL THEN o_hi_ihs.original_value END as hi_ihs_original,
    p.hi_mcaid,
    CASE WHEN o_hi_mcaid.original_value IS NOT NULL THEN o_hi_mcaid.original_value END as hi_mcaid_original,
    p.hi_mcare,
    CASE WHEN o_hi_mcare.original_value IS NOT NULL THEN o_hi_mcare.original_value END as hi_mcare_original,
    p.hi_none,
    CASE WHEN o_hi_none.original_value IS NOT NULL THEN o_hi_none.original_value END as hi_none_original,
    p.hi_oth,
    CASE WHEN o_hi_oth.original_value IS NOT NULL THEN o_hi_oth.original_value END as hi_oth_original,
    p.hi_othw,
    CASE WHEN o_hi_othw.original_value IS NOT NULL THEN o_hi_othw.original_value END as hi_othw_original,
    p.hi_tri,
    CASE WHEN o_hi_tri.original_value IS NOT NULL THEN o_hi_tri.original_value END as hi_tri_original,
    p.hi_vet,
    CASE WHEN o_hi_vet.original_value IS NOT NULL THEN o_hi_vet.original_value END as hi_vet_original,
    p.hiprem,
    CASE WHEN o_hiprem.original_value IS NOT NULL THEN o_hiprem.original_value END as hiprem_original,
    p.his,
    CASE WHEN o_his.original_value IS NOT NULL THEN o_his.original_value END as his_original,
    p.hisub,
    CASE WHEN o_hisub.original_value IS NOT NULL THEN o_hisub.original_value END as hisub_original,
    p.hisw,
    CASE WHEN o_hisw.original_value IS NOT NULL THEN o_hisw.original_value END as hisw_original,
    p.inmil,
    CASE WHEN o_inmil.original_value IS NOT NULL THEN o_inmil.original_value END as inmil_original,
    p."int",
    CASE WHEN o_int.original_value IS NOT NULL THEN o_int.original_value END as int_original,
    p.intcalc,
    CASE WHEN o_intcalc.original_value IS NOT NULL THEN o_intcalc.original_value END as intcalc_original,
    p.intl,
    CASE WHEN o_intl.original_value IS NOT NULL THEN o_intl.original_value END as intl_original,
    p.intx,
    CASE WHEN o_intx.original_value IS NOT NULL THEN o_intx.original_value END as intx_original,
    p.inw2,
    CASE WHEN o_inw2.original_value IS NOT NULL THEN o_inw2.original_value END as inw2_original,
    p.inw3,
    CASE WHEN o_inw3.original_value IS NOT NULL THEN o_inw3.original_value END as inw3_original,
    p.inx4,
    CASE WHEN o_inx4.original_value IS NOT NULL THEN o_inx4.original_value END as inx4_original,
    p.jwam,
    CASE WHEN o_jwam.original_value IS NOT NULL THEN o_jwam.original_value END as jwam_original,
    p.jwlh,
    CASE WHEN o_jwlh.original_value IS NOT NULL THEN o_jwlh.original_value END as jwlh_original,
    p.jwlm,
    CASE WHEN o_jwlm.original_value IS NOT NULL THEN o_jwlm.original_value END as jwlm_original,
    p.jwmn,
    CASE WHEN o_jwmn.original_value IS NOT NULL THEN o_jwmn.original_value END as jwmn_original,
    p.jwri,
    CASE WHEN o_jwri.original_value IS NOT NULL THEN o_jwri.original_value END as jwri_original,
    p.jwtrns,
    CASE WHEN o_jwtrns.original_value IS NOT NULL THEN o_jwtrns.original_value END as jwtrns_original,
    p.lanw,
    CASE WHEN o_lanw.original_value IS NOT NULL THEN o_lanw.original_value END as lanw_original,
    p.lanx,
    CASE WHEN o_lanx.original_value IS NOT NULL THEN o_lanx.original_value END as lanx_original,
    p.lname,
    CASE WHEN o_lname.original_value IS NOT NULL THEN o_lname.original_value END as lname_original,
    p.mar,
    CASE WHEN o_mar.original_value IS NOT NULL THEN o_mar.original_value END as mar_original,
    p.marhd,
    CASE WHEN o_marhd.original_value IS NOT NULL THEN o_marhd.original_value END as marhd_original,
    p.marhm,
    CASE WHEN o_marhm.original_value IS NOT NULL THEN o_marhm.original_value END as marhm_original,
    p.marht,
    CASE WHEN o_marht.original_value IS NOT NULL THEN o_marht.original_value END as marht_original,
    p.marhw,
    CASE WHEN o_marhw.original_value IS NOT NULL THEN o_marhw.original_value END as marhw_original,
    p.marhy,
    CASE WHEN o_marhy.original_value IS NOT NULL THEN o_marhy.original_value END as marhy_original,
    p.mgw1,
    CASE WHEN o_mgw1.original_value IS NOT NULL THEN o_mgw1.original_value END as mgw1_original,
    p.mgw2,
    CASE WHEN o_mgw2.original_value IS NOT NULL THEN o_mgw2.original_value END as mgw2_original,
    p.mgw3,
    CASE WHEN o_mgw3.original_value IS NOT NULL THEN o_mgw3.original_value END as mgw3_original,
    p.mgw4,
    CASE WHEN o_mgw4.original_value IS NOT NULL THEN o_mgw4.original_value END as mgw4_original,
    p.mgw5,
    CASE WHEN o_mgw5.original_value IS NOT NULL THEN o_mgw5.original_value END as mgw5_original,
    p.mgw6,
    CASE WHEN o_mgw6.original_value IS NOT NULL THEN o_mgw6.original_value END as mgw6_original,
    p.mi,
    CASE WHEN o_mi.original_value IS NOT NULL THEN o_mi.original_value END as mi_original,
    p.mig,
    CASE WHEN o_mig.original_value IS NOT NULL THEN o_mig.original_value END as mig_original,
    p.migpnum,
    CASE WHEN o_migpnum.original_value IS NOT NULL THEN o_migpnum.original_value END as migpnum_original,
    p.migx,
    CASE WHEN o_migx.original_value IS NOT NULL THEN o_migx.original_value END as migx_original,
    p.milp,
    CASE WHEN o_milp.original_value IS NOT NULL THEN o_milp.original_value END as milp_original,
    p.milsvc,
    CASE WHEN o_milsvc.original_value IS NOT NULL THEN o_milsvc.original_value END as milsvc_original,
    p.nwab,
    CASE WHEN o_nwab.original_value IS NOT NULL THEN o_nwab.original_value END as nwab_original,
    p.nwav,
    CASE WHEN o_nwav.original_value IS NOT NULL THEN o_nwav.original_value END as nwav_original,
    p.nwla,
    CASE WHEN o_nwla.original_value IS NOT NULL THEN o_nwla.original_value END as nwla_original,
    p.nwlk,
    CASE WHEN o_nwlk.original_value IS NOT NULL THEN o_nwlk.original_value END as nwlk_original,
    p.nwre,
    CASE WHEN o_nwre.original_value IS NOT NULL THEN o_nwre.original_value END as nwre_original,
    p.ocw1,
    CASE WHEN o_ocw1.original_value IS NOT NULL THEN o_ocw1.original_value END as ocw1_original,
    p.ocw2,
    CASE WHEN o_ocw2.original_value IS NOT NULL THEN o_ocw2.original_value END as ocw2_original,
    p.oi,
    CASE WHEN o_oi.original_value IS NOT NULL THEN o_oi.original_value END as oi_original,
    p.oix,
    CASE WHEN o_oix.original_value IS NOT NULL THEN o_oix.original_value END as oix_original,
    p.pa,
    CASE WHEN o_pa.original_value IS NOT NULL THEN o_pa.original_value END as pa_original,
    p.pax,
    CASE WHEN o_pax.original_value IS NOT NULL THEN o_pax.original_value END as pax_original,
    p.pbw2,
    CASE WHEN o_pbw2.original_value IS NOT NULL THEN o_pbw2.original_value END as pbw2_original,
    p.pbw3,
    CASE WHEN o_pbw3.original_value IS NOT NULL THEN o_pbw3.original_value END as pbw3_original,
    p.pbx1,
    CASE WHEN o_pbx1.original_value IS NOT NULL THEN o_pbx1.original_value END as pbx1_original,
    p.pension,
    CASE WHEN o_pension.original_value IS NOT NULL THEN o_pension.original_value END as pension_original,
    p.pensionx,
    CASE WHEN o_pensionx.original_value IS NOT NULL THEN o_pensionx.original_value END as pensionx_original,
    p.pww1,
    CASE WHEN o_pww1.original_value IS NOT NULL THEN o_pww1.original_value END as pww1_original,
    p.pww2,
    CASE WHEN o_pww2.original_value IS NOT NULL THEN o_pww2.original_value END as pww2_original,
    p.pww4,
    CASE WHEN o_pww4.original_value IS NOT NULL THEN o_pww4.original_value END as pww4_original,
    p.pww5,
    CASE WHEN o_pww5.original_value IS NOT NULL THEN o_pww5.original_value END as pww5_original,
    p.pww6,
    CASE WHEN o_pww6.original_value IS NOT NULL THEN o_pww6.original_value END as pww6_original,
    p.pwx3,
    CASE WHEN o_pwx3.original_value IS NOT NULL THEN o_pwx3.original_value END as pwx3_original,
    p.rac_aian,
    CASE WHEN o_rac_aian.original_value IS NOT NULL THEN o_rac_aian.original_value END as rac_aian_original,
    p.rac_asnindn,
    CASE WHEN o_rac_asnindn.original_value IS NOT NULL THEN o_rac_asnindn.original_value END as rac_asnindn_original,
    p.rac_asnoth,
    CASE WHEN o_rac_asnoth.original_value IS NOT NULL THEN o_rac_asnoth.original_value END as rac_asnoth_original,
    p.rac_blk,
    CASE WHEN o_rac_blk.original_value IS NOT NULL THEN o_rac_blk.original_value END as rac_blk_original,
    p.rac_cham,
    CASE WHEN o_rac_cham.original_value IS NOT NULL THEN o_rac_cham.original_value END as rac_cham_original,
    p.rac_chn,
    CASE WHEN o_rac_chn.original_value IS NOT NULL THEN o_rac_chn.original_value END as rac_chn_original,
    p.rac_fil,
    CASE WHEN o_rac_fil.original_value IS NOT NULL THEN o_rac_fil.original_value END as rac_fil_original,
    p.rac_jpn,
    CASE WHEN o_rac_jpn.original_value IS NOT NULL THEN o_rac_jpn.original_value END as rac_jpn_original,
    p.rac_kor,
    CASE WHEN o_rac_kor.original_value IS NOT NULL THEN o_rac_kor.original_value END as rac_kor_original,
    p.rac_nh,
    CASE WHEN o_rac_nh.original_value IS NOT NULL THEN o_rac_nh.original_value END as rac_nh_original,
    p.rac_nhpioth,
    CASE WHEN o_rac_nhpioth.original_value IS NOT NULL THEN o_rac_nhpioth.original_value END as rac_nhpioth_original,
    p.rac_sam,
    CASE WHEN o_rac_sam.original_value IS NOT NULL THEN o_rac_sam.original_value END as rac_sam_original,
    p.rac_sor,
    CASE WHEN o_rac_sor.original_value IS NOT NULL THEN o_rac_sor.original_value END as rac_sor_original,
    p.rac_viet,
    CASE WHEN o_rac_viet.original_value IS NOT NULL THEN o_rac_viet.original_value END as rac_viet_original,
    p.rac_wht,
    CASE WHEN o_rac_wht.original_value IS NOT NULL THEN o_rac_wht.original_value END as rac_wht_original,
    p.rac_wi_aian,
    CASE WHEN o_rac_wi_aian.original_value IS NOT NULL THEN o_rac_wi_aian.original_value END as rac_wi_aian_original,
    p.rac_wi_asn,
    CASE WHEN o_rac_wi_asn.original_value IS NOT NULL THEN o_rac_wi_asn.original_value END as rac_wi_asn_original,
    p.rac_wi_blk,
    CASE WHEN o_rac_wi_blk.original_value IS NOT NULL THEN o_rac_wi_blk.original_value END as rac_wi_blk_original,
    p.rac_wi_nhpi,
    CASE WHEN o_rac_wi_nhpi.original_value IS NOT NULL THEN o_rac_wi_nhpi.original_value END as rac_wi_nhpi_original,
    p.rac_wi_sor,
    CASE WHEN o_rac_wi_sor.original_value IS NOT NULL THEN o_rac_wi_sor.original_value END as rac_wi_sor_original,
    p.rac_wi_wht,
    CASE WHEN o_rac_wi_wht.original_value IS NOT NULL THEN o_rac_wi_wht.original_value END as rac_wi_wht_original,
    p.refper,
    CASE WHEN o_refper.original_value IS NOT NULL THEN o_refper.original_value END as refper_original,
    p.relship,
    CASE WHEN o_relship.original_value IS NOT NULL THEN o_relship.original_value END as relship_original,
    p.sch,
    CASE WHEN o_sch.original_value IS NOT NULL THEN o_sch.original_value END as sch_original,
    p.schg,
    CASE WHEN o_schg.original_value IS NOT NULL THEN o_schg.original_value END as schg_original,
    p.schgw,
    CASE WHEN o_schgw.original_value IS NOT NULL THEN o_schgw.original_value END as schgw_original,
    p.schla,
    CASE WHEN o_schla.original_value IS NOT NULL THEN o_schla.original_value END as schla_original,
    p.schlaw,
    CASE WHEN o_schlaw.original_value IS NOT NULL THEN o_schlaw.original_value END as schlaw_original,
    p.sem,
    CASE WHEN o_sem.original_value IS NOT NULL THEN o_sem.original_value END as sem_original,
    p.seml,
    CASE WHEN o_seml.original_value IS NOT NULL THEN o_seml.original_value END as seml_original,
    p.semx,
    CASE WHEN o_semx.original_value IS NOT NULL THEN o_semx.original_value END as semx_original,
    p.sex,
    CASE WHEN o_sex.original_value IS NOT NULL THEN o_sex.original_value END as sex_original,
    p.ss,
    CASE WHEN o_ss.original_value IS NOT NULL THEN o_ss.original_value END as ss_original,
    p.ssi,
    CASE WHEN o_ssi.original_value IS NOT NULL THEN o_ssi.original_value END as ssi_original,
    p.ssix,
    CASE WHEN o_ssix.original_value IS NOT NULL THEN o_ssix.original_value END as ssix_original,
    p.ssx,
    CASE WHEN o_ssx.original_value IS NOT NULL THEN o_ssx.original_value END as ssx_original,
    p.survdis,
    CASE WHEN o_survdis.original_value IS NOT NULL THEN o_survdis.original_value END as survdis_original,
    p.survdisx,
    CASE WHEN o_survdisx.original_value IS NOT NULL THEN o_survdisx.original_value END as survdisx_original,
    p.ti,
    CASE WHEN o_ti.original_value IS NOT NULL THEN o_ti.original_value END as ti_original,
    p.ticalc,
    CASE WHEN o_ticalc.original_value IS NOT NULL THEN o_ticalc.original_value END as ticalc_original,
    p.tiest,
    CASE WHEN o_tiest.original_value IS NOT NULL THEN o_tiest.original_value END as tiest_original,
    p.tiestl,
    CASE WHEN o_tiestl.original_value IS NOT NULL THEN o_tiestl.original_value END as tiestl_original,
    p.til,
    CASE WHEN o_til.original_value IS NOT NULL THEN o_til.original_value END as til_original,
    p.tin,
    CASE WHEN o_tin.original_value IS NOT NULL THEN o_tin.original_value END as tin_original,
    p.wag,
    CASE WHEN o_wag.original_value IS NOT NULL THEN o_wag.original_value END as wag_original,
    p.wagx,
    CASE WHEN o_wagx.original_value IS NOT NULL THEN o_wagx.original_value END as wagx_original,
    p.wkh,
    CASE WHEN o_wkh.original_value IS NOT NULL THEN o_wkh.original_value END as wkh_original,
    p.wkl,
    CASE WHEN o_wkl.original_value IS NOT NULL THEN o_wkl.original_value END as wkl_original,
    p.wkwn,
    CASE WHEN o_wkwn.original_value IS NOT NULL THEN o_wkwn.original_value END as wkwn_original,
    p.wkwx,
    CASE WHEN o_wkwx.original_value IS NOT NULL THEN o_wkwx.original_value END as wkwx_original,
    p.wrk,
    CASE WHEN o_wrk.original_value IS NOT NULL THEN o_wrk.original_value END as wrk_original,
    p.wrkj,
    CASE WHEN o_wrkj.original_value IS NOT NULL THEN o_wrkj.original_value END as wrkj_original,
    p.yoe,
    CASE WHEN o_yoe.original_value IS NOT NULL THEN o_yoe.original_value END as yoe_original
FROM acme.hu_inet_population p
LEFT JOIN first_originals o_age ON p.cmid = o_age.cmid AND p.pnum = o_age.pnum AND o_age.var_name = 'age'
LEFT JOIN first_originals o_ancw ON p.cmid = o_ancw.cmid AND p.pnum = o_ancw.pnum AND o_ancw.var_name = 'ancw'
LEFT JOIN first_originals o_cit ON p.cmid = o_cit.cmid AND p.pnum = o_cit.pnum AND o_cit.var_name = 'cit'
LEFT JOIN first_originals o_citw ON p.cmid = o_citw.cmid AND p.pnum = o_citw.pnum AND o_citw.var_name = 'citw'
LEFT JOIN first_originals o_cow ON p.cmid = o_cow.cmid AND p.pnum = o_cow.pnum AND o_cow.var_name = 'cow'
LEFT JOIN first_originals o_dbd ON p.cmid = o_dbd.cmid AND p.pnum = o_dbd.pnum AND o_dbd.var_name = 'dbd'
LEFT JOIN first_originals o_dbm ON p.cmid = o_dbm.cmid AND p.pnum = o_dbm.pnum AND o_dbm.var_name = 'dbm'
LEFT JOIN first_originals o_dby ON p.cmid = o_dby.cmid AND p.pnum = o_dby.pnum AND o_dby.var_name = 'dby'
LEFT JOIN first_originals o_ddrs ON p.cmid = o_ddrs.cmid AND p.pnum = o_ddrs.pnum AND o_ddrs.var_name = 'ddrs'
LEFT JOIN first_originals o_dear ON p.cmid = o_dear.cmid AND p.pnum = o_dear.pnum AND o_dear.var_name = 'dear'
LEFT JOIN first_originals o_deye ON p.cmid = o_deye.cmid AND p.pnum = o_deye.pnum AND o_deye.var_name = 'deye'
LEFT JOIN first_originals o_dout ON p.cmid = o_dout.cmid AND p.pnum = o_dout.pnum AND o_dout.var_name = 'dout'
LEFT JOIN first_originals o_dphy ON p.cmid = o_dphy.cmid AND p.pnum = o_dphy.pnum AND o_dphy.var_name = 'dphy'
LEFT JOIN first_originals o_drat ON p.cmid = o_drat.cmid AND p.pnum = o_drat.pnum AND o_drat.var_name = 'drat'
LEFT JOIN first_originals o_dratx ON p.cmid = o_dratx.cmid AND p.pnum = o_dratx.pnum AND o_dratx.var_name = 'dratx'
LEFT JOIN first_originals o_drem ON p.cmid = o_drem.cmid AND p.pnum = o_drem.pnum AND o_drem.var_name = 'drem'
LEFT JOIN first_originals o_eng ON p.cmid = o_eng.cmid AND p.pnum = o_eng.pnum AND o_eng.var_name = 'eng'
LEFT JOIN first_originals o_fer ON p.cmid = o_fer.cmid AND p.pnum = o_fer.pnum AND o_fer.var_name = 'fer'
LEFT JOIN first_originals o_fname ON p.cmid = o_fname.cmid AND p.pnum = o_fname.pnum AND o_fname.var_name = 'fname'
LEFT JOIN first_originals o_fodw ON p.cmid = o_fodw.cmid AND p.pnum = o_fodw.pnum AND o_fodw.var_name = 'fodw'
LEFT JOIN first_originals o_gcl ON p.cmid = o_gcl.cmid AND p.pnum = o_gcl.pnum AND o_gcl.var_name = 'gcl'
LEFT JOIN first_originals o_gcm ON p.cmid = o_gcm.cmid AND p.pnum = o_gcm.pnum AND o_gcm.var_name = 'gcm'
LEFT JOIN first_originals o_gcr ON p.cmid = o_gcr.cmid AND p.pnum = o_gcr.pnum AND o_gcr.var_name = 'gcr'
LEFT JOIN first_originals o_hi_drect ON p.cmid = o_hi_drect.cmid AND p.pnum = o_hi_drect.pnum AND o_hi_drect.var_name = 'hi_drect'
LEFT JOIN first_originals o_hi_emp ON p.cmid = o_hi_emp.cmid AND p.pnum = o_hi_emp.pnum AND o_hi_emp.var_name = 'hi_emp'
LEFT JOIN first_originals o_hi_ihs ON p.cmid = o_hi_ihs.cmid AND p.pnum = o_hi_ihs.pnum AND o_hi_ihs.var_name = 'hi_ihs'
LEFT JOIN first_originals o_hi_mcaid ON p.cmid = o_hi_mcaid.cmid AND p.pnum = o_hi_mcaid.pnum AND o_hi_mcaid.var_name = 'hi_mcaid'
LEFT JOIN first_originals o_hi_mcare ON p.cmid = o_hi_mcare.cmid AND p.pnum = o_hi_mcare.pnum AND o_hi_mcare.var_name = 'hi_mcare'
LEFT JOIN first_originals o_hi_none ON p.cmid = o_hi_none.cmid AND p.pnum = o_hi_none.pnum AND o_hi_none.var_name = 'hi_none'
LEFT JOIN first_originals o_hi_oth ON p.cmid = o_hi_oth.cmid AND p.pnum = o_hi_oth.pnum AND o_hi_oth.var_name = 'hi_oth'
LEFT JOIN first_originals o_hi_othw ON p.cmid = o_hi_othw.cmid AND p.pnum = o_hi_othw.pnum AND o_hi_othw.var_name = 'hi_othw'
LEFT JOIN first_originals o_hi_tri ON p.cmid = o_hi_tri.cmid AND p.pnum = o_hi_tri.pnum AND o_hi_tri.var_name = 'hi_tri'
LEFT JOIN first_originals o_hi_vet ON p.cmid = o_hi_vet.cmid AND p.pnum = o_hi_vet.pnum AND o_hi_vet.var_name = 'hi_vet'
LEFT JOIN first_originals o_hiprem ON p.cmid = o_hiprem.cmid AND p.pnum = o_hiprem.pnum AND o_hiprem.var_name = 'hiprem'
LEFT JOIN first_originals o_his ON p.cmid = o_his.cmid AND p.pnum = o_his.pnum AND o_his.var_name = 'his'
LEFT JOIN first_originals o_hisub ON p.cmid = o_hisub.cmid AND p.pnum = o_hisub.pnum AND o_hisub.var_name = 'hisub'
LEFT JOIN first_originals o_hisw ON p.cmid = o_hisw.cmid AND p.pnum = o_hisw.pnum AND o_hisw.var_name = 'hisw'
LEFT JOIN first_originals o_inmil ON p.cmid = o_inmil.cmid AND p.pnum = o_inmil.pnum AND o_inmil.var_name = 'inmil'
LEFT JOIN first_originals o_int ON p.cmid = o_int.cmid AND p.pnum = o_int.pnum AND o_int.var_name = 'int'
LEFT JOIN first_originals o_intcalc ON p.cmid = o_intcalc.cmid AND p.pnum = o_intcalc.pnum AND o_intcalc.var_name = 'intcalc'
LEFT JOIN first_originals o_intl ON p.cmid = o_intl.cmid AND p.pnum = o_intl.pnum AND o_intl.var_name = 'intl'
LEFT JOIN first_originals o_intx ON p.cmid = o_intx.cmid AND p.pnum = o_intx.pnum AND o_intx.var_name = 'intx'
LEFT JOIN first_originals o_inw2 ON p.cmid = o_inw2.cmid AND p.pnum = o_inw2.pnum AND o_inw2.var_name = 'inw2'
LEFT JOIN first_originals o_inw3 ON p.cmid = o_inw3.cmid AND p.pnum = o_inw3.pnum AND o_inw3.var_name = 'inw3'
LEFT JOIN first_originals o_inx4 ON p.cmid = o_inx4.cmid AND p.pnum = o_inx4.pnum AND o_inx4.var_name = 'inx4'
LEFT JOIN first_originals o_jwam ON p.cmid = o_jwam.cmid AND p.pnum = o_jwam.pnum AND o_jwam.var_name = 'jwam'
LEFT JOIN first_originals o_jwlh ON p.cmid = o_jwlh.cmid AND p.pnum = o_jwlh.pnum AND o_jwlh.var_name = 'jwlh'
LEFT JOIN first_originals o_jwlm ON p.cmid = o_jwlm.cmid AND p.pnum = o_jwlm.pnum AND o_jwlm.var_name = 'jwlm'
LEFT JOIN first_originals o_jwmn ON p.cmid = o_jwmn.cmid AND p.pnum = o_jwmn.pnum AND o_jwmn.var_name = 'jwmn'
LEFT JOIN first_originals o_jwri ON p.cmid = o_jwri.cmid AND p.pnum = o_jwri.pnum AND o_jwri.var_name = 'jwri'
LEFT JOIN first_originals o_jwtrns ON p.cmid = o_jwtrns.cmid AND p.pnum = o_jwtrns.pnum AND o_jwtrns.var_name = 'jwtrns'
LEFT JOIN first_originals o_lanw ON p.cmid = o_lanw.cmid AND p.pnum = o_lanw.pnum AND o_lanw.var_name = 'lanw'
LEFT JOIN first_originals o_lanx ON p.cmid = o_lanx.cmid AND p.pnum = o_lanx.pnum AND o_lanx.var_name = 'lanx'
LEFT JOIN first_originals o_lname ON p.cmid = o_lname.cmid AND p.pnum = o_lname.pnum AND o_lname.var_name = 'lname'
LEFT JOIN first_originals o_mar ON p.cmid = o_mar.cmid AND p.pnum = o_mar.pnum AND o_mar.var_name = 'mar'
LEFT JOIN first_originals o_marhd ON p.cmid = o_marhd.cmid AND p.pnum = o_marhd.pnum AND o_marhd.var_name = 'marhd'
LEFT JOIN first_originals o_marhm ON p.cmid = o_marhm.cmid AND p.pnum = o_marhm.pnum AND o_marhm.var_name = 'marhm'
LEFT JOIN first_originals o_marht ON p.cmid = o_marht.cmid AND p.pnum = o_marht.pnum AND o_marht.var_name = 'marht'
LEFT JOIN first_originals o_marhw ON p.cmid = o_marhw.cmid AND p.pnum = o_marhw.pnum AND o_marhw.var_name = 'marhw'
LEFT JOIN first_originals o_marhy ON p.cmid = o_marhy.cmid AND p.pnum = o_marhy.pnum AND o_marhy.var_name = 'marhy'
LEFT JOIN first_originals o_mgw1 ON p.cmid = o_mgw1.cmid AND p.pnum = o_mgw1.pnum AND o_mgw1.var_name = 'mgw1'
LEFT JOIN first_originals o_mgw2 ON p.cmid = o_mgw2.cmid AND p.pnum = o_mgw2.pnum AND o_mgw2.var_name = 'mgw2'
LEFT JOIN first_originals o_mgw3 ON p.cmid = o_mgw3.cmid AND p.pnum = o_mgw3.pnum AND o_mgw3.var_name = 'mgw3'
LEFT JOIN first_originals o_mgw4 ON p.cmid = o_mgw4.cmid AND p.pnum = o_mgw4.pnum AND o_mgw4.var_name = 'mgw4'
LEFT JOIN first_originals o_mgw5 ON p.cmid = o_mgw5.cmid AND p.pnum = o_mgw5.pnum AND o_mgw5.var_name = 'mgw5'
LEFT JOIN first_originals o_mgw6 ON p.cmid = o_mgw6.cmid AND p.pnum = o_mgw6.pnum AND o_mgw6.var_name = 'mgw6'
LEFT JOIN first_originals o_mi ON p.cmid = o_mi.cmid AND p.pnum = o_mi.pnum AND o_mi.var_name = 'mi'
LEFT JOIN first_originals o_mig ON p.cmid = o_mig.cmid AND p.pnum = o_mig.pnum AND o_mig.var_name = 'mig'
LEFT JOIN first_originals o_migpnum ON p.cmid = o_migpnum.cmid AND p.pnum = o_migpnum.pnum AND o_migpnum.var_name = 'migpnum'
LEFT JOIN first_originals o_migx ON p.cmid = o_migx.cmid AND p.pnum = o_migx.pnum AND o_migx.var_name = 'migx'
LEFT JOIN first_originals o_milp ON p.cmid = o_milp.cmid AND p.pnum = o_milp.pnum AND o_milp.var_name = 'milp'
LEFT JOIN first_originals o_milsvc ON p.cmid = o_milsvc.cmid AND p.pnum = o_milsvc.pnum AND o_milsvc.var_name = 'milsvc'
LEFT JOIN first_originals o_nwab ON p.cmid = o_nwab.cmid AND p.pnum = o_nwab.pnum AND o_nwab.var_name = 'nwab'
LEFT JOIN first_originals o_nwav ON p.cmid = o_nwav.cmid AND p.pnum = o_nwav.pnum AND o_nwav.var_name = 'nwav'
LEFT JOIN first_originals o_nwla ON p.cmid = o_nwla.cmid AND p.pnum = o_nwla.pnum AND o_nwla.var_name = 'nwla'
LEFT JOIN first_originals o_nwlk ON p.cmid = o_nwlk.cmid AND p.pnum = o_nwlk.pnum AND o_nwlk.var_name = 'nwlk'
LEFT JOIN first_originals o_nwre ON p.cmid = o_nwre.cmid AND p.pnum = o_nwre.pnum AND o_nwre.var_name = 'nwre'
LEFT JOIN first_originals o_ocw1 ON p.cmid = o_ocw1.cmid AND p.pnum = o_ocw1.pnum AND o_ocw1.var_name = 'ocw1'
LEFT JOIN first_originals o_ocw2 ON p.cmid = o_ocw2.cmid AND p.pnum = o_ocw2.pnum AND o_ocw2.var_name = 'ocw2'
LEFT JOIN first_originals o_oi ON p.cmid = o_oi.cmid AND p.pnum = o_oi.pnum AND o_oi.var_name = 'oi'
LEFT JOIN first_originals o_oix ON p.cmid = o_oix.cmid AND p.pnum = o_oix.pnum AND o_oix.var_name = 'oix'
LEFT JOIN first_originals o_pa ON p.cmid = o_pa.cmid AND p.pnum = o_pa.pnum AND o_pa.var_name = 'pa'
LEFT JOIN first_originals o_pax ON p.cmid = o_pax.cmid AND p.pnum = o_pax.pnum AND o_pax.var_name = 'pax'
LEFT JOIN first_originals o_pbw2 ON p.cmid = o_pbw2.cmid AND p.pnum = o_pbw2.pnum AND o_pbw2.var_name = 'pbw2'
LEFT JOIN first_originals o_pbw3 ON p.cmid = o_pbw3.cmid AND p.pnum = o_pbw3.pnum AND o_pbw3.var_name = 'pbw3'
LEFT JOIN first_originals o_pbx1 ON p.cmid = o_pbx1.cmid AND p.pnum = o_pbx1.pnum AND o_pbx1.var_name = 'pbx1'
LEFT JOIN first_originals o_pension ON p.cmid = o_pension.cmid AND p.pnum = o_pension.pnum AND o_pension.var_name = 'pension'
LEFT JOIN first_originals o_pensionx ON p.cmid = o_pensionx.cmid AND p.pnum = o_pensionx.pnum AND o_pensionx.var_name = 'pensionx'
LEFT JOIN first_originals o_pww1 ON p.cmid = o_pww1.cmid AND p.pnum = o_pww1.pnum AND o_pww1.var_name = 'pww1'
LEFT JOIN first_originals o_pww2 ON p.cmid = o_pww2.cmid AND p.pnum = o_pww2.pnum AND o_pww2.var_name = 'pww2'
LEFT JOIN first_originals o_pww4 ON p.cmid = o_pww4.cmid AND p.pnum = o_pww4.pnum AND o_pww4.var_name = 'pww4'
LEFT JOIN first_originals o_pww5 ON p.cmid = o_pww5.cmid AND p.pnum = o_pww5.pnum AND o_pww5.var_name = 'pww5'
LEFT JOIN first_originals o_pww6 ON p.cmid = o_pww6.cmid AND p.pnum = o_pww6.pnum AND o_pww6.var_name = 'pww6'
LEFT JOIN first_originals o_pwx3 ON p.cmid = o_pwx3.cmid AND p.pnum = o_pwx3.pnum AND o_pwx3.var_name = 'pwx3'
LEFT JOIN first_originals o_rac_aian ON p.cmid = o_rac_aian.cmid AND p.pnum = o_rac_aian.pnum AND o_rac_aian.var_name = 'rac_aian'
LEFT JOIN first_originals o_rac_asnindn ON p.cmid = o_rac_asnindn.cmid AND p.pnum = o_rac_asnindn.pnum AND o_rac_asnindn.var_name = 'rac_asnindn'
LEFT JOIN first_originals o_rac_asnoth ON p.cmid = o_rac_asnoth.cmid AND p.pnum = o_rac_asnoth.pnum AND o_rac_asnoth.var_name = 'rac_asnoth'
LEFT JOIN first_originals o_rac_blk ON p.cmid = o_rac_blk.cmid AND p.pnum = o_rac_blk.pnum AND o_rac_blk.var_name = 'rac_blk'
LEFT JOIN first_originals o_rac_cham ON p.cmid = o_rac_cham.cmid AND p.pnum = o_rac_cham.pnum AND o_rac_cham.var_name = 'rac_cham'
LEFT JOIN first_originals o_rac_chn ON p.cmid = o_rac_chn.cmid AND p.pnum = o_rac_chn.pnum AND o_rac_chn.var_name = 'rac_chn'
LEFT JOIN first_originals o_rac_fil ON p.cmid = o_rac_fil.cmid AND p.pnum = o_rac_fil.pnum AND o_rac_fil.var_name = 'rac_fil'
LEFT JOIN first_originals o_rac_jpn ON p.cmid = o_rac_jpn.cmid AND p.pnum = o_rac_jpn.pnum AND o_rac_jpn.var_name = 'rac_jpn'
LEFT JOIN first_originals o_rac_kor ON p.cmid = o_rac_kor.cmid AND p.pnum = o_rac_kor.pnum AND o_rac_kor.var_name = 'rac_kor'
LEFT JOIN first_originals o_rac_nh ON p.cmid = o_rac_nh.cmid AND p.pnum = o_rac_nh.pnum AND o_rac_nh.var_name = 'rac_nh'
LEFT JOIN first_originals o_rac_nhpioth ON p.cmid = o_rac_nhpioth.cmid AND p.pnum = o_rac_nhpioth.pnum AND o_rac_nhpioth.var_name = 'rac_nhpioth'
LEFT JOIN first_originals o_rac_sam ON p.cmid = o_rac_sam.cmid AND p.pnum = o_rac_sam.pnum AND o_rac_sam.var_name = 'rac_sam'
LEFT JOIN first_originals o_rac_sor ON p.cmid = o_rac_sor.cmid AND p.pnum = o_rac_sor.pnum AND o_rac_sor.var_name = 'rac_sor'
LEFT JOIN first_originals o_rac_viet ON p.cmid = o_rac_viet.cmid AND p.pnum = o_rac_viet.pnum AND o_rac_viet.var_name = 'rac_viet'
LEFT JOIN first_originals o_rac_wht ON p.cmid = o_rac_wht.cmid AND p.pnum = o_rac_wht.pnum AND o_rac_wht.var_name = 'rac_wht'
LEFT JOIN first_originals o_rac_wi_aian ON p.cmid = o_rac_wi_aian.cmid AND p.pnum = o_rac_wi_aian.pnum AND o_rac_wi_aian.var_name = 'rac_wi_aian'
LEFT JOIN first_originals o_rac_wi_asn ON p.cmid = o_rac_wi_asn.cmid AND p.pnum = o_rac_wi_asn.pnum AND o_rac_wi_asn.var_name = 'rac_wi_asn'
LEFT JOIN first_originals o_rac_wi_blk ON p.cmid = o_rac_wi_blk.cmid AND p.pnum = o_rac_wi_blk.pnum AND o_rac_wi_blk.var_name = 'rac_wi_blk'
LEFT JOIN first_originals o_rac_wi_nhpi ON p.cmid = o_rac_wi_nhpi.cmid AND p.pnum = o_rac_wi_nhpi.pnum AND o_rac_wi_nhpi.var_name = 'rac_wi_nhpi'
LEFT JOIN first_originals o_rac_wi_sor ON p.cmid = o_rac_wi_sor.cmid AND p.pnum = o_rac_wi_sor.pnum AND o_rac_wi_sor.var_name = 'rac_wi_sor'
LEFT JOIN first_originals o_rac_wi_wht ON p.cmid = o_rac_wi_wht.cmid AND p.pnum = o_rac_wi_wht.pnum AND o_rac_wi_wht.var_name = 'rac_wi_wht'
LEFT JOIN first_originals o_refper ON p.cmid = o_refper.cmid AND p.pnum = o_refper.pnum AND o_refper.var_name = 'refper'
LEFT JOIN first_originals o_relship ON p.cmid = o_relship.cmid AND p.pnum = o_relship.pnum AND o_relship.var_name = 'relship'
LEFT JOIN first_originals o_sch ON p.cmid = o_sch.cmid AND p.pnum = o_sch.pnum AND o_sch.var_name = 'sch'
LEFT JOIN first_originals o_schg ON p.cmid = o_schg.cmid AND p.pnum = o_schg.pnum AND o_schg.var_name = 'schg'
LEFT JOIN first_originals o_schgw ON p.cmid = o_schgw.cmid AND p.pnum = o_schgw.pnum AND o_schgw.var_name = 'schgw'
LEFT JOIN first_originals o_schla ON p.cmid = o_schla.cmid AND p.pnum = o_schla.pnum AND o_schla.var_name = 'schla'
LEFT JOIN first_originals o_schlaw ON p.cmid = o_schlaw.cmid AND p.pnum = o_schlaw.pnum AND o_schlaw.var_name = 'schlaw'
LEFT JOIN first_originals o_sem ON p.cmid = o_sem.cmid AND p.pnum = o_sem.pnum AND o_sem.var_name = 'sem'
LEFT JOIN first_originals o_seml ON p.cmid = o_seml.cmid AND p.pnum = o_seml.pnum AND o_seml.var_name = 'seml'
LEFT JOIN first_originals o_semx ON p.cmid = o_semx.cmid AND p.pnum = o_semx.pnum AND o_semx.var_name = 'semx'
LEFT JOIN first_originals o_sex ON p.cmid = o_sex.cmid AND p.pnum = o_sex.pnum AND o_sex.var_name = 'sex'
LEFT JOIN first_originals o_ss ON p.cmid = o_ss.cmid AND p.pnum = o_ss.pnum AND o_ss.var_name = 'ss'
LEFT JOIN first_originals o_ssi ON p.cmid = o_ssi.cmid AND p.pnum = o_ssi.pnum AND o_ssi.var_name = 'ssi'
LEFT JOIN first_originals o_ssix ON p.cmid = o_ssix.cmid AND p.pnum = o_ssix.pnum AND o_ssix.var_name = 'ssix'
LEFT JOIN first_originals o_ssx ON p.cmid = o_ssx.cmid AND p.pnum = o_ssx.pnum AND o_ssx.var_name = 'ssx'
LEFT JOIN first_originals o_survdis ON p.cmid = o_survdis.cmid AND p.pnum = o_survdis.pnum AND o_survdis.var_name = 'survdis'
LEFT JOIN first_originals o_survdisx ON p.cmid = o_survdisx.cmid AND p.pnum = o_survdisx.pnum AND o_survdisx.var_name = 'survdisx'
LEFT JOIN first_originals o_ti ON p.cmid = o_ti.cmid AND p.pnum = o_ti.pnum AND o_ti.var_name = 'ti'
LEFT JOIN first_originals o_ticalc ON p.cmid = o_ticalc.cmid AND p.pnum = o_ticalc.pnum AND o_ticalc.var_name = 'ticalc'
LEFT JOIN first_originals o_tiest ON p.cmid = o_tiest.cmid AND p.pnum = o_tiest.pnum AND o_tiest.var_name = 'tiest'
LEFT JOIN first_originals o_tiestl ON p.cmid = o_tiestl.cmid AND p.pnum = o_tiestl.pnum AND o_tiestl.var_name = 'tiestl'
LEFT JOIN first_originals o_til ON p.cmid = o_til.cmid AND p.pnum = o_til.pnum AND o_til.var_name = 'til'
LEFT JOIN first_originals o_tin ON p.cmid = o_tin.cmid AND p.pnum = o_tin.pnum AND o_tin.var_name = 'tin'
LEFT JOIN first_originals o_wag ON p.cmid = o_wag.cmid AND p.pnum = o_wag.pnum AND o_wag.var_name = 'wag'
LEFT JOIN first_originals o_wagx ON p.cmid = o_wagx.cmid AND p.pnum = o_wagx.pnum AND o_wagx.var_name = 'wagx'
LEFT JOIN first_originals o_wkh ON p.cmid = o_wkh.cmid AND p.pnum = o_wkh.pnum AND o_wkh.var_name = 'wkh'
LEFT JOIN first_originals o_wkl ON p.cmid = o_wkl.cmid AND p.pnum = o_wkl.pnum AND o_wkl.var_name = 'wkl'
LEFT JOIN first_originals o_wkwn ON p.cmid = o_wkwn.cmid AND p.pnum = o_wkwn.pnum AND o_wkwn.var_name = 'wkwn'
LEFT JOIN first_originals o_wkwx ON p.cmid = o_wkwx.cmid AND p.pnum = o_wkwx.pnum AND o_wkwx.var_name = 'wkwx'
LEFT JOIN first_originals o_wrk ON p.cmid = o_wrk.cmid AND p.pnum = o_wrk.pnum AND o_wrk.var_name = 'wrk'
LEFT JOIN first_originals o_wrkj ON p.cmid = o_wrkj.cmid AND p.pnum = o_wrkj.pnum AND o_wrkj.var_name = 'wrkj'
LEFT JOIN first_originals o_yoe ON p.cmid = o_yoe.cmid AND p.pnum = o_yoe.pnum AND o_yoe.var_name = 'yoe';
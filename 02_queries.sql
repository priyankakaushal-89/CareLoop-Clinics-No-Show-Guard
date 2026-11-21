-- Q1 Overall
SELECT COUNT(*) AS n, SUM(no_show) AS n_noshow, ROUND(100.0*AVG(no_show),2) AS noshow_pct FROM appointments_clean;
-- Q2 By reminder
SELECT reminder_sent, COUNT(*) AS n, ROUND(100.0*AVG(no_show),2) AS noshow_pct FROM appointments_clean GROUP BY reminder_sent;
-- Q3 By clinic
SELECT c.clinic_id, c.clinic_name, c.city, COUNT(*) AS n, ROUND(100.0*AVG(a.no_show),2) AS noshow_pct FROM appointments_clean a JOIN clinics_enriched c ON a.clinic_id=c.clinic_id GROUP BY c.clinic_id,c.clinic_name,c.city ORDER BY noshow_pct DESC;
-- Q4 By lead_days
SELECT CASE WHEN lead_days<=3 THEN '0-3' WHEN lead_days<=7 THEN '4-7' WHEN lead_days<=14 THEN '8-14' ELSE '15+' END AS lead_band, COUNT(*) AS n, ROUND(100.0*AVG(no_show),2) AS noshow_pct FROM appointments_clean GROUP BY lead_band ORDER BY lead_band;
-- Q5 By distance
SELECT CASE WHEN distance_km<=5 THEN '0-5km' WHEN distance_km<=15 THEN '6-15km' ELSE '15km+' END AS dist_band, COUNT(*) AS n, ROUND(100.0*AVG(no_show),2) AS noshow_pct FROM appointments_clean GROUP BY dist_band;
-- Q6 By age+gender
SELECT CASE WHEN age<18 THEN '<18' WHEN age<35 THEN '18-34' WHEN age<55 THEN '35-54' ELSE '55+' END AS age_band, gender, COUNT(*) AS n, ROUND(100.0*AVG(no_show),2) AS noshow_pct FROM appointments_clean GROUP BY age_band, gender ORDER BY age_band, gender;

SELECT clinic_name FROM dim_clinic;

-- 5.1 Slice
SELECT c.clinic_name, AVG(f.wait_minutes) AS avg_wait
FROM fact_appointment f
JOIN dim_clinic c ON f.clinic_key = c.clinic_key
WHERE c.clinic_name = 'Lotus Care Jaffna'
GROUP BY c.clinic_name;

-- 5.2 Dice
SELECT c.clinic_name, d.specialty, AVG(f.fee) AS avg_fee
FROM fact_appointment f
JOIN dim_clinic c ON f.clinic_key = c.clinic_key
JOIN dim_doctor d ON f.doctor_key = d.doctor_key
WHERE c.clinic_name = 'Lotus Care Jaffna' AND d.specialty = 'General Medicine'
GROUP BY c.clinic_name, d.specialty;

-- 5.3 Roll Up
SELECT d.specialty, doc.doctor_name, SUM(f.fee) AS total_fee
FROM fact_appointment f
JOIN dim_doctor doc ON f.doctor_key = doc.doctor_key
JOIN dim_doctor d ON f.doctor_key = d.doctor_key
GROUP BY ROLLUP(d.specialty, doc.doctor_name)
ORDER BY d.specialty, doc.doctor_name;

-- 5.4 Drill Down
SELECT dt.quarter, SUM(f.fee) AS total_fee
FROM fact_appointment f
JOIN dim_date dt ON f.date_key = dt.date_key
GROUP BY dt.quarter
ORDER BY dt.quarter;

SELECT dt.month, SUM(f.fee) AS total_fee
FROM fact_appointment f
JOIN dim_date dt ON f.date_key = dt.date_key
WHERE dt.quarter = 2
GROUP BY dt.month
ORDER BY dt.month;

-- 5.5 Pivot
SELECT 
    c.clinic_name,
    SUM(CASE WHEN dt.quarter = 1 THEN f.fee ELSE 0 END) AS Q1,
    SUM(CASE WHEN dt.quarter = 2 THEN f.fee ELSE 0 END) AS Q2,
    SUM(CASE WHEN dt.quarter = 3 THEN f.fee ELSE 0 END) AS Q3,
    SUM(CASE WHEN dt.quarter = 4 THEN f.fee ELSE 0 END) AS Q4
FROM fact_appointment f
JOIN dim_clinic c ON f.clinic_key = c.clinic_key
JOIN dim_date dt ON f.date_key = dt.date_key
GROUP BY c.clinic_name
ORDER BY c.clinic_name;



-- Task 7.1: Patients who moved district (2025 appointments per moved patient)
SELECT p.patient_id, p.district AS old_district, COUNT(*) AS appointments_2025
FROM fact_appointment f
JOIN dim_patient p ON f.patient_key = p.patient_key
JOIN dim_date dt ON f.date_key = dt.date_key
WHERE dt.year = 2025
  AND p.patient_id IN ('P0022', 'P0103', 'P0233')
GROUP BY p.patient_id, p.district
ORDER BY p.patient_id;

-- Task 7.1: 2025 appointments by district (before overwriting)
SELECT p.district, COUNT(*) AS appointments
FROM fact_appointment f
JOIN dim_patient p ON f.patient_key = p.patient_key
JOIN dim_date dt ON f.date_key = dt.date_key
WHERE dt.year = 2025
GROUP BY p.district
ORDER BY p.district;
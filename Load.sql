1.dim_patient
\copy dim_patient(patient_id, gender, date_of_birth, district, patient_key) FROM 'data/dim_patient.csv' DELIMITER ',' CSV HEADER;
COPY 300
2.dim_doctor
\copy dim_doctor(doctor_id, doctor_name, specialty, doctor_key) FROM 'data/dim_doctor.csv' DELIMITER ',' CSV HEADER;
COPY 20
3.dim_clinic
\copy dim_clinic(clinic_id, clinic_name, city, province, clinic_key) FROM 'data/dim_clinic.csv' DELIMITER ',' CSV HEADER;
COPY 5
4.dim_date
\copy dim_date(full_date, date_key, year, quarter, month, day_name, day) FROM 'data/dim_date.csv' DELIMITER ',' CSV HEADER;
COPY 365
5.fact_appoinment
\copy fact_appointment(patient_key, doctor_key, clinic_key, date_key, wait_minutes, consultation_minutes, fee) 
FROM 'data/fact_appointment.csv' DELIMITER ',' CSV HEADER;
COPY 1500

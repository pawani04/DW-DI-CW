DROP TABLE IF EXISTS fact_appointment;
DROP TABLE IF EXISTS dim_patient;
DROP TABLE IF EXISTS dim_doctor;
DROP TABLE IF EXISTS dim_clinic;
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_patient (
    patient_key INT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    district VARCHAR(50)
);

CREATE TABLE dim_doctor (
    doctor_key INT PRIMARY KEY,
    doctor_id VARCHAR(10) NOT NULL,
    doctor_name VARCHAR(100),
    specialty VARCHAR(50)
);

CREATE TABLE dim_clinic (
    clinic_key INT PRIMARY KEY,
    clinic_id VARCHAR(10) NOT NULL,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    province VARCHAR(50)
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT,
    quarter INT,
    month INT,
    day_name VARCHAR(20),
    day INT
);

CREATE TABLE fact_appointment (
	appointment_key SERIAL primary key,
    patient_key INT REFERENCES dim_patient(patient_key),
    doctor_key INT REFERENCES dim_doctor(doctor_key),
    clinic_key INT REFERENCES dim_clinic(clinic_key),
    date_key INT REFERENCES dim_date(date_key),
    wait_minutes INT,
    consultation_minutes INT,
    fee NUMERIC(10,2)
);

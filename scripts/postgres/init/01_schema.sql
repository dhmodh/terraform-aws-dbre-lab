CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(20),
    dob DATE,
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE caregivers (
    caregiver_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    caregiver_id INT REFERENCES caregivers(caregiver_id),
    appointment_date TIMESTAMP,
    visit_status VARCHAR(50),
    notes TEXT
);

CREATE TABLE claims (
    claim_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    amount NUMERIC(10,2),
    claim_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE billing (
    billing_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    invoice_amount NUMERIC(10,2),
    payment_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_logs (
    log_id SERIAL PRIMARY KEY,
    table_name VARCHAR(100),
    action_type VARCHAR(50),
    event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(100)
);

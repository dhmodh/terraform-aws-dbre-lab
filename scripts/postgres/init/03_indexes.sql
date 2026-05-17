CREATE INDEX idx_patients_city
ON patients(city);

CREATE INDEX idx_appointments_patient_id
ON appointments(patient_id);

CREATE INDEX idx_appointments_date
ON appointments(appointment_date);

CREATE INDEX idx_claims_patient_id
ON claims(patient_id);

CREATE INDEX idx_claim_status
ON claims(claim_status);

CREATE INDEX idx_billing_patient_id
ON billing(patient_id);

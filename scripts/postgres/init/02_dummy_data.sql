INSERT INTO patients (first_name, last_name, gender, dob, city)
SELECT
    'Patient_' || gs,
    'Last_' || gs,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END,
    CURRENT_DATE - (random() * 20000)::INT,
    CASE
        WHEN random() < 0.25 THEN 'New York'
        WHEN random() < 0.50 THEN 'Chicago'
        WHEN random() < 0.75 THEN 'Dallas'
        ELSE 'Miami'
    END
FROM generate_series(1,10000) gs;

INSERT INTO caregivers (first_name, last_name, specialization, phone)
SELECT
    'Caregiver_' || gs,
    'Last_' || gs,
    CASE
        WHEN random() < 0.33 THEN 'RN'
        WHEN random() < 0.66 THEN 'Therapy'
        ELSE 'Home Health'
    END,
    '555-' || gs
FROM generate_series(1,500) gs;

INSERT INTO appointments (
    patient_id,
    caregiver_id,
    appointment_date,
    visit_status,
    notes
)
SELECT
    floor(random() * 10000 + 1)::INT,
    floor(random() * 500 + 1)::INT,
    NOW() - (random() * INTERVAL '365 days'),
    CASE
        WHEN random() < 0.33 THEN 'Completed'
        WHEN random() < 0.66 THEN 'Cancelled'
        ELSE 'Scheduled'
    END,
    'Routine visit'
FROM generate_series(1,50000);

INSERT INTO claims (patient_id, amount, claim_status)
SELECT
    floor(random() * 10000 + 1)::INT,
    round((random() * 1000)::numeric,2),
    CASE
        WHEN random() < 0.5 THEN 'Approved'
        ELSE 'Pending'
    END
FROM generate_series(1,20000);

INSERT INTO billing (
    patient_id,
    invoice_amount,
    payment_status
)
SELECT
    floor(random() * 10000 + 1)::INT,
    round((random() * 2000)::numeric,2),
    CASE
        WHEN random() < 0.5 THEN 'Paid'
        ELSE 'Pending'
    END
FROM generate_series(1,20000);

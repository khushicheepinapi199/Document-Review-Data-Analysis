-- Document Review & Data Quality Analysis
-- All records are synthetic.

-- 1. Expired documents as of 2026-09-06
SELECT *
FROM document_records
WHERE expiration_date < '2026-09-06'
ORDER BY expiration_date;

-- 2. Records with missing information
SELECT missing_field, COUNT(*) AS affected_records
FROM document_records
WHERE missing_field <> 'None'
GROUP BY missing_field
ORDER BY affected_records DESC;

-- 3. Duplicate document numbers
SELECT document_number, COUNT(*) AS duplicate_count
FROM document_records
GROUP BY document_number
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 4. Verification-status summary
SELECT verification_status, COUNT(*) AS record_count
FROM document_records
GROUP BY verification_status
ORDER BY record_count DESC;

-- 5. Review-priority classification
SELECT record_id, customer_id, document_type, expiration_date, verification_status, missing_field,
       CASE WHEN verification_status = 'Failed' THEN 'High'
            WHEN expiration_date < '2026-09-06' THEN 'High'
            WHEN missing_field <> 'None' THEN 'Medium'
            WHEN verification_status = 'Pending' THEN 'Medium'
            ELSE 'Low' END AS review_priority
FROM document_records;

-- 6. Document type distribution
SELECT document_type, COUNT(*) AS record_count
FROM document_records
GROUP BY document_type
ORDER BY record_count DESC;

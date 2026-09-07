# Excel Document Review Guide

This project uses Excel to review structured customer-document records and identify basic data-quality issues.

## Excel Skills Demonstrated

### 1. Expiration Check
```excel
=IF([@expiration_date]<DATE(2026,9,6),"Expired","Current")
```

### 2. Missing-Field Check
```excel
=IF([@missing_field]="None","Complete","Missing Information")
```

### 3. Duplicate Document Check
```excel
=IF(COUNTIF([document_number],[@document_number])>1,"Duplicate","Unique")
```

### 4. Review Priority
```excel
=IF([@verification_status]="Failed","High",IF([@expiration_status]="Expired","High",IF([@missing_field]<>"None","Medium","Low")))
```

### 5. Conditional Formatting
Highlight:
- failed verification records,
- expired documents,
- duplicate document numbers,
- records containing missing fields.

### 6. PivotTables and Dashboard
Summarize records by document type and verification status. Create KPI cards for total records, expired documents, missing-field records, failed verification, and pending verification. Add a chart showing document-type distribution.

> All document records are fictional and created solely for portfolio demonstration.

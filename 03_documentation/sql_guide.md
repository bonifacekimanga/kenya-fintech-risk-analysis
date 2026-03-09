# SQL Analysis Guide

## How to Run This Analysis

This guide explains how to execute the SQL queries in this project step-by-step.

---

## Prerequisites

- MySQL 8.0 or higher installed
- MySQL Workbench (recommended)
- Database created and data loaded

---

## Step 1: Database Setup

**File**: `02_data_ingestion/01_database_setup.sql`

This creates the database structure.
```bash
# Option A: Command line
mysql -u root -p < 02_data_ingestion/01_database_setup.sql

# Option B: MySQL Workbench
1. Open MySQL Workbench
2. File → Open SQL Script
3. Select 01_database_setup.sql
4. Execute (⚡ button)
```

**What this does**:
- Creates `kenya_fintech` database
- Creates `customers` table
- Creates `loans` table

---

## Step 2: Load Data

**Requirement**: You need customers.csv and loans.csv files

### Using MySQL Workbench (Easiest)

1. Right-click `customers` table → **Table Data Import Wizard**
2. Browse to `customers.csv`
3. Click Next → Next → Finish
4. Repeat for `loans` table with `loans.csv`

### Verify Data Loaded
```sql
-- Check customer count
SELECT COUNT(*) FROM customers;
-- Expected: 7,769

-- Check loans count
SELECT COUNT(*) FROM loans;
-- Expected: 7,769
```

---

## Step 3: Run Analysis Queries

Execute these in order:

### Query 1: Portfolio Overview
**File**: `04_analysis_queries/02_portfolio_overview.sql`

**What it does**: Shows total loans, money lent, repaid, and default rate

**Expected output**:
```
Total Loans: 5,595
Total Lent: KES 119,185,000
Default Rate: 24.0%
```

---

### Query 2: Loan Amount Analysis
**File**: `04_analysis_queries/03_loan_amount_analysis.sql`

**What it does**: Identifies which loan amounts have highest defaults

**Key finding**: 100K loans at 32.1% default (the problem!)

---

### Query 3: Regional Analysis
**File**: `04_analysis_queries/04_regional_analysis.sql`

**What it does**: Shows default rates by county using JOIN

**Key finding**: Kitale best (19%), Thika worst (26.8%)

---

### Query 4: Cross-Analysis
**File**: `04_analysis_queries/05_loan_amount_county_analysis.sql`

**What it does**: Multi-dimensional analysis (county × loan amount)

**Key finding**: 100K loans in small counties default at 50%!

---

## Understanding the Queries

### Basic Structure
```sql
SELECT           -- What columns to show
    column1,
    COUNT(*) 
FROM table       -- Which table
WHERE condition  -- Filter criteria
GROUP BY column1 -- Group similar records
ORDER BY column2 -- Sort results
```

### Key Concepts

**COUNT(*)**: Counts how many records
```sql
SELECT COUNT(*) FROM loans;
-- Result: Total number of loans
```

**GROUP BY**: Creates segments
```sql
SELECT loan_amount, COUNT(*)
FROM loans
GROUP BY loan_amount;
-- Result: Count for each loan amount
```

**JOIN**: Combines tables
```sql
SELECT c.county, l.defaulted
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id;
-- Result: Loan data WITH county information
```

---

## Troubleshooting

### Error: "Table doesn't exist"
**Solution**: Run `01_database_setup.sql` first

### Error: "Unknown column"
**Solution**: Check your CSV column names match table structure

### No results returned
**Solution**: Verify data loaded with `SELECT * FROM table LIMIT 10`

---

## Modifying the Queries

### Change the date range
```sql
WHERE application_date >= '2024-01-01'
  AND application_date < '2024-12-31'
```

### Add more loan amounts
Modify the loan amounts in your data or adjust filters

### Analyze different counties
The queries automatically include all counties in your data

---

## Exporting Results

### In MySQL Workbench
1. Run query
2. Click on results grid
3. Right-click → Export
4. Choose format (CSV, JSON, etc.)

### Command Line
```bash
mysql -u root -p kenya_fintech < query.sql > results.txt
```

---

## Tips for Learning SQL

1. **Start simple**: Run one query at a time
2. **Use LIMIT**: Add `LIMIT 10` to see sample results
3. **Comment your code**: Explain what each part does
4. **Experiment**: Modify queries to test your understanding
5. **Verify results**: Cross-check numbers make sense

---

**Questions?** Review the commented sections in each SQL file for detailed explanations.

**Author**: Boniface Kimanga  
**Last Updated**: March 9, 2026
-- ============================================================================
-- DATABASE SETUP - Kenya Fintech Risk Analysis
-- Author: Boniface Kimanga
-- Date: March 9, 2026
-- Purpose: Create database and tables for fintech portfolio analysis
-- ============================================================================

-- STEP 1: Create the database
CREATE DATABASE kenya_fintech;

-- STEP 2: Use the database
USE kenya_fintech;

-- STEP 3: Create customers table
CREATE TABLE customers(
    customer_id VARCHAR(20) PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    county VARCHAR(50),
    employment_type VARCHAR(50),
    education_level VARCHAR(50),
    monthly_income DECIMAL(10,2),
    account_age_days INT,
    registration_date DATETIME
);

-- STEP 4: Create loans table
CREATE TABLE loans(
    loan_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    application_date DATETIME,
    loan_amount DECIMAL(10,2),
    loan_term_days INT,
    interest_rate DECIMAL(5,2),
    purpose VARCHAR(50),
    loan_status VARCHAR(20),
    approval_date DATETIME,
    disbursement_date DATETIME,
    due_date DATETIME,
    defaulted DECIMAL(3,1),
    amount_repaid DECIMAL(15,2)
);

-- ============================================================================
-- NOTES:
-- - customer_id and loan_id are VARCHAR because they contain text (CUST000001, LOAN0000001)
-- - Dates are DATETIME to handle timestamps (2024-01-01 00:00:00.000000)
-- - defaulted is DECIMAL(3,1) because values are 0.0 or 1.0
-- - amount_repaid is DECIMAL(15,2) for large repayment amounts with decimals
-- ============================================================================
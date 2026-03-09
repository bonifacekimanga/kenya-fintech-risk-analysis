-- ============================================================================
-- PORTFOLIO OVERVIEW QUERIES
-- Author: Boniface Kimanga
-- Date: March 9, 2026
-- Purpose: High-level portfolio statistics and financial summary
-- ============================================================================

-- QUERY 1: Total Money Lent (Portfolio Value)
-- Business Question: "How much total money have we lent to customers?"
-- Result: KES 119,185,000

SELECT 
    SUM(loan_amount) as total_lent
FROM loans
WHERE loan_status = 'Approved';


-- QUERY 2: Total Money Repaid
-- Business Question: "How much money have customers paid back?"
-- Result: KES 97,909,305

SELECT 
    SUM(amount_repaid) as total_repaid
FROM loans
WHERE loan_status = 'Approved';


-- QUERY 3: Complete Financial Picture
-- Business Question: "What's our complete financial position?"
-- Shows: Loans, amount lent, repaid, outstanding, and potential interest

SELECT 
    COUNT(*) as total_loans,
    SUM(loan_amount) as total_lent,
    SUM(amount_repaid) as total_repaid,
    SUM(loan_amount) - SUM(amount_repaid) as outstanding,
    SUM(loan_amount * interest_rate / 100) as potential_interest
FROM loans
WHERE loan_status = 'Approved';

-- RESULTS:
-- Total Loans: 5,595
-- Total Lent: KES 119,185,000
-- Total Repaid: KES 97,909,305
-- Outstanding: KES 21,275,695
-- Potential Interest: KES 19,628,661

-- INSIGHT: 82% recovery rate (97.9M / 119.2M)


-- QUERY 4: Overall Default Statistics
-- Business Question: "How many loans defaulted and what's the default rate?"
-- Key Finding: 24% default rate

SELECT 
    COUNT(*) as total_loans,
    SUM(CASE WHEN defaulted = 1 THEN 1 ELSE 0 END) as defaulted_loans,
    SUM(CASE WHEN defaulted = 0 THEN 1 ELSE 0 END) as repaid_loans,
    ROUND(AVG(defaulted) * 100, 1) as default_rate_percent
FROM loans
WHERE loan_status = 'Approved';

-- RESULTS:
-- Total Loans: 5,595
-- Defaulted: 1,341
-- Repaid: 4,254
-- Default Rate: 24.0%

-- ============================================================================
-- KEY BUSINESS INSIGHTS:
-- 1. Portfolio Size: KES 119M across 5,595 loans
-- 2. Recovery Rate: 82% (good!)
-- 3. Default Rate: 24% (needs improvement!)
-- 4. Outstanding: KES 21M (mix of active loans and defaults)
-- ============================================================================
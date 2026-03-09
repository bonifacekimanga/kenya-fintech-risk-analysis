-- ============================================================================
-- CROSS-ANALYSIS: Loan Amount × County
-- Author: Boniface Kimanga
-- Date: March 9, 2026
-- Purpose: Multi-dimensional analysis to find which counties handle large loans well
-- KEY FINDING: 100K loans are DISASTROUS in small counties (50% default!)
-- ============================================================================

-- QUERY: Default Rate by County AND Loan Amount
-- Business Question: "Do some counties handle larger loans better than others?"
-- This is advanced analysis - crossing TWO variables

SELECT 
    c.county,
    l.loan_amount,
    COUNT(*) as total_loans,
    ROUND(AVG(l.defaulted) * 100, 1) as default_rate
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
WHERE l.loan_status = 'Approved'
GROUP BY c.county, l.loan_amount
ORDER BY c.county, l.loan_amount;

-- ============================================================================
-- KEY INSIGHTS FROM RESULTS:
-- ============================================================================
--
-- 🚨 DANGER ZONES - AVOID THESE!
-- ================================
-- Malindi + 100K:  50.0% default (8 loans) - DISASTER!
-- Kitale + 100K:   50.0% default (4 loans) - TERRIBLE!
-- Kisumu + 100K:   40.0% default (15 loans) - Very Bad
-- Eldoret + 50K:   40.0% default (35 loans) - Very Bad
-- Thika + 75K:     40.0% default (10 loans) - Very Bad
--
-- INSIGHT: 100K loans fail catastrophically in small counties!
--
--
-- ✅ GOLDEN OPPORTUNITIES - GROW HERE!
-- =====================================
-- Kitale + 20K:    8.3% default (36 loans) - AMAZING!
-- Kitale + 75K:    7.7% default (13 loans) - INCREDIBLE!
-- Nairobi + 75K:   19.3% default (114 loans) - Excellent + HIGH VOLUME!
-- Nairobi + 10K:   19.9% default (427 loans) - Excellent + HUGE VOLUME!
--
-- INSIGHT: Kitale handles mid-to-large loans exceptionally well!
--          Nairobi provides safe, high-volume opportunities!
--
--
-- ⚠️ SURPRISING PROBLEMS:
-- =======================
-- Thika + 15K:     38.2% default (68 loans)
--    → Surprisingly bad for a mid-size loan in a mid-size county
--
-- ============================================================================
-- STRATEGIC RECOMMENDATIONS:
-- ============================================================================
--
-- 🚫 STOP:
--    1. 100K loans in Malindi, Kitale, Kisumu (50% default!)
--    2. 50K+ loans in Eldoret (40% default)
--    3. 15K loans in Thika (38% default - unexpectedly bad)
--    4. Any 100K loan outside Nairobi/Mombasa
--
-- ✅ GROW:
--    1. Kitale 20K-75K loans (currently only 226 total loans - HUGE opportunity!)
--       → Best performing market that's severely underutilized
--    2. Nairobi 10K-75K loans (your biggest safe market)
--       → Scale proven winners
--    3. Mombasa mid-range loans (consistent performance)
--
-- 🎯 POLICY CHANGES:
--    1. Create county-specific loan caps:
--       - Nairobi/Mombasa: Allow up to 100K (with caution)
--       - Nakuru/Kisumu: Cap at 75K
--       - Thika/Eldoret: Cap at 50K
--       - Malindi/Kitale: Cap at 75K (despite good performance, low volume = higher risk)
--    
--    2. Launch "Kitale Growth Initiative":
--       - Target 20K-75K loans
--       - Offer 0.5% interest discount
--       - Goal: Grow from 226 to 500+ loans in 12 months
--    
--    3. Create tiered interest rates by county risk:
--       - Low risk (Kitale, Nairobi): Base rate
--       - Medium risk (Nakuru, Mombasa): Base + 1%
--       - High risk (Thika, Eldoret): Base + 2%
--
-- 💰 FINANCIAL IMPACT:
--    Preventing just 10 100K defaults in small counties = KES 1M saved annually
--    Growing Kitale from 226 to 500 loans = KES 20M+ new portfolio (at <10% default!)
--
-- ============================================================================
-- SQL LEARNING NOTE:
-- ============================================================================
-- This query demonstrates:
-- 1. Multi-table JOIN (combining customers + loans)
-- 2. Multi-dimensional GROUP BY (county AND loan amount)
-- 3. Advanced business analysis (interaction effects)
-- 
-- GROUP BY c.county, l.loan_amount means:
-- - Create a separate group for EACH combination
-- - Nairobi + 10K = one group
-- - Nairobi + 20K = another group
-- - Thika + 10K = another group
-- etc.
--
-- This is like creating a pivot table with two row fields in Excel!
-- ============================================================================
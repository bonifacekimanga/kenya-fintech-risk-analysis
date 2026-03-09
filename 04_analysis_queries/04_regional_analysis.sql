-- ============================================================================
-- REGIONAL ANALYSIS - County Performance
-- Purpose: Analyze default rates by county using JOIN to combine tables
-- KEY FINDING: Kitale performs best (19%), Thika worst (26.8%)
-- ============================================================================

-- QUERY: Default Rate by County
-- Business Question: "Which counties are good at repaying, and which are risky?"
-- Uses JOIN to combine customer location data with loan default data

SELECT 
    c.county,
    COUNT(*) as total_loans,
    SUM(l.defaulted) as defaults,
    ROUND(AVG(l.defaulted) * 100, 1) as default_rate
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
WHERE l.loan_status = 'Approved'
GROUP BY c.county
ORDER BY default_rate DESC;

-- ============================================================================
-- RESULTS & INSIGHTS:
-- ============================================================================
--
-- county   | total_loans | defaults | default_rate
-- ---------|-------------|----------|-------------
-- Thika    |     373     |   100    |   26.8%  🔴 WORST
-- Eldoret  |     422     |   112    |   26.5%  🔴 High Risk
-- Kisumu   |     557     |   144    |   25.9%  🟡 Above Avg
-- Malindi  |     283     |    71    |   25.1%  🟡 Above Avg
-- Mombasa  |     895     |   216    |   24.1%  🟡 Average
-- Nakuru   |     492     |   115    |   23.4%  🟢 Good
-- Nairobi  |   2,194     |   501    |   22.8%  🟢 Good
-- Kitale   |     226     |    43    |   19.0%  ✅ BEST!
--
-- ============================================================================
-- CRITICAL BUSINESS INSIGHTS:
-- ============================================================================
--
-- 🔴 PROBLEM COUNTIES:
--    Thika: 26.8% (2.8 points worse than 24% average)
--    Eldoret: 26.5% (2.5 points worse)
--    RECOMMENDATION: Tighten lending criteria in these counties
--
-- ✅ STAR PERFORMER:
--    Kitale: 19.0% (5 points BETTER than average!)
--    But only 226 loans - huge growth opportunity!
--    RECOMMENDATION: Aggressively grow lending in Kitale
--
-- 🏆 VOLUME + QUALITY:
--    Nairobi: 22.8% with 2,194 loans
--    Largest market + below-average default rate
--    RECOMMENDATION: Double down on Nairobi growth
--
-- 🎯 STRATEGIC ACTIONS:
--    1. REDUCE lending in Thika and Eldoret
--    2. GROW aggressively in Kitale (currently only 226 loans!)
--    3. EXPAND in Nairobi (proven large, safe market)
--    4. Consider premium pricing (+1-2%) for high-risk counties
--
-- 💡 SQL LEARNING NOTE:
--    This query uses JOIN to combine two tables:
--    - customers table (c) has county information
--    - loans table (l) has default information
--    - We match them using customer_id
--    This is like VLOOKUP in Excel!
--
-- ============================================================================
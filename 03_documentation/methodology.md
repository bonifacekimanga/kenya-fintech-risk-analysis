# Analysis Methodology

## Overview
This document explains the step-by-step approach used to analyze the Kenya fintech loan portfolio.

## Data Engineering Pipeline

### 1. Data Ingestion
- **Source**: CSV files (customers.csv, loans.csv)
- **Database**: MySQL 8.0
- **Tables**: customers (7,769 records), loans (7,769 records)
- **Import Method**: MySQL Workbench Table Data Import Wizard

### 2. Data Cleaning
- Filtered to approved loans only (5,595 out of 7,769 total)
- Excluded rejected and pending applications
- Validated data types and constraints
- Missing data assessment: <2% for income and education

### 3. Exploratory Data Analysis (EDA)
Used SQL queries to understand:
- Portfolio size and composition
- Overall default rates
- Distribution by loan amount, county, purpose
- Basic statistics (averages, counts, totals)

### 4. Segmentation Analysis
Analyzed default rates across multiple dimensions:
- **Loan Amount**: 5K, 10K, 15K, 20K, 30K, 50K, 75K, 100K
- **Geography**: 8 counties in Kenya
- **Cross-Analysis**: Loan amount × County interactions

### 5. Business Insights Generation
For each finding:
- Quantified the problem (default rate, volume, financial impact)
- Compared to baseline (24% average default rate)
- Calculated potential savings
- Developed specific recommendations

## SQL Techniques Used

### Basic Queries
- `SELECT`, `FROM`, `WHERE` - Data retrieval and filtering
- `COUNT()`, `SUM()`, `AVG()` - Aggregations
- `ROUND()` - Formatting numbers
- `GROUP BY` - Segmentation
- `ORDER BY` - Sorting results

### Advanced Queries
- `JOIN` - Combining customers and loans tables
- `CASE WHEN` - Conditional logic
- Multi-dimensional `GROUP BY` - Cross-tabulation
- Percentage calculations

## Quality Assurance
- Verified totals match across different queries
- Cross-checked results with Excel analysis
- Validated findings with business logic
- Documented all assumptions

## Tools & Environment
- **Database**: MySQL 8.0
- **IDE**: MySQL Workbench
- **Version Control**: Git/GitHub
- **Documentation**: Markdown

---

**Analyst**: Boniface Kimanga  
**Date**: March 9, 2026
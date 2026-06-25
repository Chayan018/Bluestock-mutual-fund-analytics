-- 1. Top 5 Funds by AUM

SELECT d.scheme_name,
       p.aum_crore
FROM fact_performance p
JOIN dim_fund d
ON p.amfi_code = d.amfi_code
ORDER BY p.aum_crore DESC
LIMIT 5;

-- 2. Average NAV

SELECT AVG(nav) AS average_nav
FROM fact_nav;

-- 3. Average NAV by Fund

SELECT amfi_code,
       AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY amfi_code;

-- 4. Transactions by State

SELECT state,
       COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- 5. Total Investment by State

SELECT state,
       SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY state
ORDER BY total_amount DESC;

-- 6. Expense Ratio Below 1%

SELECT d.scheme_name,
       p.expense_ratio_pct
FROM fact_performance p
JOIN dim_fund d
ON p.amfi_code = d.amfi_code
WHERE p.expense_ratio_pct < 1;

-- 7. Top 5 Sharpe Ratio Funds

SELECT d.scheme_name,
       p.sharpe_ratio
FROM fact_performance p
JOIN dim_fund d
ON p.amfi_code = d.amfi_code
ORDER BY p.sharpe_ratio DESC
LIMIT 5;

-- 8. Average Return (3 Year)

SELECT AVG(return_3yr_pct)
AS avg_3yr_return
FROM fact_performance;

-- 9. KYC Status Distribution

SELECT kyc_status,
       COUNT(*) AS investors
FROM fact_transactions
GROUP BY kyc_status;

-- 10. Transaction Type Distribution

SELECT transaction_type,
       COUNT(*) AS total
FROM fact_transactions
GROUP BY transaction_type;
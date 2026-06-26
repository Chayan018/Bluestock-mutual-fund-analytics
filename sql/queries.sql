---------------------------------------------------
-- 1 Top 5 Funds by Expense Ratio
---------------------------------------------------

SELECT scheme_name,
expense_ratio_pct
FROM dim_fund
ORDER BY expense_ratio_pct DESC
LIMIT 5;

---------------------------------------------------
-- 2 Average NAV
---------------------------------------------------

SELECT
AVG(nav) AS Average_NAV
FROM fact_nav;

---------------------------------------------------
-- 3 Monthly Average NAV
---------------------------------------------------

SELECT
strftime('%Y-%m',date) AS Month,
AVG(nav)
FROM fact_nav
GROUP BY Month
ORDER BY Month;

---------------------------------------------------
-- 4 Transactions By State
---------------------------------------------------

SELECT
state,
COUNT(*) AS Transactions
FROM fact_transactions
GROUP BY state
ORDER BY Transactions DESC;

---------------------------------------------------
-- 5 Funds Expense Ratio Less Than 1%
---------------------------------------------------

SELECT
scheme_name,
expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct<1;

---------------------------------------------------
-- 6 Highest Sharpe Ratio
---------------------------------------------------

SELECT
amfi_code,
sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

---------------------------------------------------
-- 7 Highest AUM
---------------------------------------------------

SELECT
fund_house,
aum_lakh_crore
FROM fact_aum
ORDER BY aum_lakh_crore DESC;

---------------------------------------------------
-- 8 Average Transaction Amount
---------------------------------------------------

SELECT
AVG(amount_inr)
FROM fact_transactions;

---------------------------------------------------
-- 9 Portfolio Weight Above 5%
---------------------------------------------------

SELECT
company_name,
weight_pct
FROM fact_portfolio
WHERE weight_pct>5;

---------------------------------------------------
-- 10 Benchmark Average
---------------------------------------------------

SELECT

AVG(nifty50),

AVG(nifty100),

AVG(bse_smallcap)

FROM dim_benchmark;
# Bluestock Mutual Fund Analytics Platform
# Data Dictionary

---

# 1. Dataset : clean_fund_master.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| amfi_code | TEXT | Unique AMFI Scheme Code | AMFI |
| fund_house | TEXT | Mutual Fund Company | AMFI |
| scheme_name | TEXT | Official Scheme Name | AMFI |
| category | TEXT | Equity/Debt/Hybrid | AMFI |
| sub_category | TEXT | Large Cap, Mid Cap, Small Cap etc. | AMFI |
| plan | TEXT | Direct / Regular | AMFI |
| launch_date | DATE | Fund Launch Date | AMFI |
| benchmark | TEXT | Benchmark Index | AMFI |
| expense_ratio_pct | REAL | Expense Ratio (%) | AMFI |
| exit_load_pct | REAL | Exit Load (%) | AMFI |
| min_sip_amount | INTEGER | Minimum SIP Amount | AMFI |
| min_lumpsum_amount | INTEGER | Minimum Lump Sum Amount | AMFI |
| fund_manager | TEXT | Fund Manager | AMFI |
| risk_category | TEXT | Risk Category | SEBI |
| sebi_category_code | TEXT | SEBI Category Code | SEBI |

---

# 2. Dataset : clean_nav_history.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| amfi_code | TEXT | Scheme Code | mfapi.in |
| date | DATE | NAV Date | mfapi.in |
| nav | REAL | Net Asset Value | mfapi.in |

---

# 3. Dataset : clean_aum_by_fund_house.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| fund_house | TEXT | Mutual Fund Company | AMFI |
| date | DATE | Reporting Date | AMFI |
| aum_lakh_crore | REAL | AUM (Lakh Crore) | AMFI |
| aum_crore | REAL | AUM (Crore) | AMFI |
| num_schemes | INTEGER | Number of Schemes | AMFI |

---

# 4. Dataset : clean_monthly_sip_inflows.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| month | DATE | Month | AMFI |
| sip_inflow_crore | REAL | Monthly SIP Inflow | AMFI |
| active_sip_accounts_crore | REAL | Active SIP Accounts | AMFI |
| new_sip_accounts_lakh | REAL | New SIP Registrations | AMFI |
| sip_aum_lakh_crore | REAL | SIP Assets Under Management | AMFI |
| yoy_growth_pct | REAL | Year-on-Year Growth (%) | Computed |

---

# 5. Dataset : clean_category_inflows.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| month | DATE | Reporting Month | AMFI |
| category | TEXT | Mutual Fund Category | AMFI |
| net_inflow_crore | REAL | Net Inflow (Crore) | AMFI |

---

# 6. Dataset : clean_industry_folio_count.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| month | DATE | Reporting Month | AMFI |
| total_folios_crore | REAL | Total Folios | AMFI |
| equity_folios_crore | REAL | Equity Folios | AMFI |
| debt_folios_crore | REAL | Debt Folios | AMFI |
| hybrid_folios_crore | REAL | Hybrid Folios | AMFI |
| others_folios_crore | REAL | Other Folios | AMFI |

---

# 7. Dataset : clean_scheme_performance.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| amfi_code | TEXT | Scheme Code | Computed |
| return_1yr_pct | REAL | 1-Year Return | Computed |
| return_3yr_pct | REAL | 3-Year CAGR | Computed |
| return_5yr_pct | REAL | 5-Year CAGR | Computed |
| benchmark_3yr_pct | REAL | Benchmark Return | Computed |
| alpha | REAL | Alpha | Computed |
| beta | REAL | Beta | Computed |
| sharpe_ratio | REAL | Sharpe Ratio | Computed |
| sortino_ratio | REAL | Sortino Ratio | Computed |
| std_dev_ann_pct | REAL | Annualized Standard Deviation | Computed |
| max_drawdown_pct | REAL | Maximum Drawdown | Computed |
| morningstar_rating | INTEGER | Morningstar Rating | Simulated |
| expense_ratio_pct | REAL | Expense Ratio | AMFI |

---

# 8. Dataset : clean_investor_transactions.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| investor_id | TEXT | Investor ID | Simulated |
| transaction_date | DATE | Transaction Date | Simulated |
| amfi_code | TEXT | Scheme Code | AMFI |
| transaction_type | TEXT | SIP/Lumpsum/Redemption | Simulated |
| amount_inr | REAL | Transaction Amount | Simulated |
| state | TEXT | State | Simulated |
| city | TEXT | City | Simulated |
| city_tier | TEXT | T30/B30 | Simulated |
| age_group | TEXT | Age Group | Simulated |
| gender | TEXT | Gender | Simulated |
| annual_income_lakh | REAL | Annual Income | Simulated |
| payment_mode | TEXT | Payment Mode | Simulated |
| kyc_status | TEXT | KYC Status | Simulated |

---

# 9. Dataset : clean_portfolio_holdings.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| amfi_code | TEXT | Scheme Code | AMFI |
| stock_symbol | TEXT | NSE Symbol | NSE |
| company_name | TEXT | Company Name | NSE |
| sector | TEXT | Sector Name | NSE |
| weight_pct | REAL | Portfolio Weight (%) | AMFI |
| market_value_cr | REAL | Market Value | AMFI |
| current_price_inr | REAL | Current Price | NSE |
| portfolio_date | DATE | Portfolio Date | AMFI |

---

# 10. Dataset : clean_benchmark_indices.csv

| Column | Data Type | Description | Source |
|---------|-----------|-------------|--------|
| date | DATE | Trading Date | NSE/BSE |
| nifty50 | REAL | Nifty 50 Index | NSE |
| nifty100 | REAL | Nifty 100 Index | NSE |
| nifty_midcap150 | REAL | Nifty Midcap 150 | NSE |
| bse_smallcap | REAL | BSE Small Cap Index | BSE |
| crisil_liquid | REAL | CRISIL Liquid Index | CRISIL |
| crisil_gilt | REAL | CRISIL Gilt Index | CRISIL |

---

# Cleaning Summary

- Removed duplicate records
- Handled missing values
- Converted date columns to datetime format
- Standardized categorical values
- Validated numeric columns
- Validated AMFI Codes
- Standardized transaction types
- Validated expense ratio
- Forward-filled missing NAV values
- Saved cleaned datasets in `data/processed`

---

Prepared By

**Chayan Das**

Bluestock Fintech Internship

Mutual Fund Analytics Platform

June 2026
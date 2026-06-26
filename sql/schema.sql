-- ===========================================
-- Drop Existing Tables
-- ===========================================

DROP TABLE IF EXISTS fact_transactions;
DROP TABLE IF EXISTS fact_nav;
DROP TABLE IF EXISTS fact_performance;
DROP TABLE IF EXISTS fact_portfolio;
DROP TABLE IF EXISTS fact_aum;
DROP TABLE IF EXISTS fact_sip_industry;
DROP TABLE IF EXISTS fact_category_inflows;
DROP TABLE IF EXISTS fact_folio_count;
DROP TABLE IF EXISTS dim_benchmark;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_fund;

---------------------------------------------------------
-- Dimension Table : Fund
---------------------------------------------------------

CREATE TABLE dim_fund(

    amfi_code TEXT PRIMARY KEY,

    fund_house TEXT,

    scheme_name TEXT,

    category TEXT,

    sub_category TEXT,

    plan TEXT,

    launch_date DATE,

    benchmark TEXT,

    expense_ratio_pct REAL,

    exit_load_pct REAL,

    min_sip_amount INTEGER,

    min_lumpsum_amount INTEGER,

    fund_manager TEXT,

    risk_category TEXT,

    sebi_category_code TEXT

);

---------------------------------------------------------
-- Dimension Table : Date
---------------------------------------------------------

CREATE TABLE dim_date(

    date_id INTEGER PRIMARY KEY AUTOINCREMENT,

    date DATE UNIQUE,

    year INTEGER,

    month INTEGER,

    day INTEGER,

    quarter INTEGER,

    weekday TEXT

);

---------------------------------------------------------
-- NAV Fact Table
---------------------------------------------------------

CREATE TABLE fact_nav(

    nav_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code TEXT,

    date DATE,

    nav REAL,

    daily_return REAL,

    FOREIGN KEY(amfi_code)

    REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Investor Transaction Fact
---------------------------------------------------------

CREATE TABLE fact_transactions(

    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,

    investor_id TEXT,

    transaction_date DATE,

    amfi_code TEXT,

    transaction_type TEXT,

    amount_inr REAL,

    state TEXT,

    city TEXT,

    city_tier TEXT,

    age_group TEXT,

    gender TEXT,

    annual_income_lakh REAL,

    payment_mode TEXT,

    kyc_status TEXT,

    FOREIGN KEY(amfi_code)

    REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Performance Fact
---------------------------------------------------------

CREATE TABLE fact_performance(

    performance_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code TEXT,

    return_1yr_pct REAL,

    return_3yr_pct REAL,

    return_5yr_pct REAL,

    benchmark_3yr_pct REAL,

    alpha REAL,

    beta REAL,

    sharpe_ratio REAL,

    sortino_ratio REAL,

    std_dev_ann_pct REAL,

    max_drawdown_pct REAL,

    morningstar_rating INTEGER,

    FOREIGN KEY(amfi_code)

    REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Portfolio Fact
---------------------------------------------------------

CREATE TABLE fact_portfolio(

    portfolio_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code TEXT,

    stock_symbol TEXT,

    company_name TEXT,

    sector TEXT,

    weight_pct REAL,

    market_value_cr REAL,

    current_price_inr REAL,

    portfolio_date DATE,

    FOREIGN KEY(amfi_code)

    REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- AUM Fact
---------------------------------------------------------

CREATE TABLE fact_aum(

    aum_id INTEGER PRIMARY KEY AUTOINCREMENT,

    fund_house TEXT,

    date DATE,

    aum_lakh_crore REAL,

    aum_crore REAL,

    num_schemes INTEGER

);

---------------------------------------------------------
-- SIP Industry Fact
---------------------------------------------------------

CREATE TABLE fact_sip_industry(

    sip_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    sip_inflow_crore REAL,

    active_sip_accounts_crore REAL,

    new_sip_accounts_lakh REAL,

    sip_aum_lakh_crore REAL,

    yoy_growth_pct REAL

);

---------------------------------------------------------
-- Category Inflow Fact
---------------------------------------------------------

CREATE TABLE fact_category_inflows(

    category_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    category TEXT,

    net_inflow_crore REAL

);

---------------------------------------------------------
-- Industry Folio Count
---------------------------------------------------------

CREATE TABLE fact_folio_count(

    folio_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    total_folios_crore REAL,

    equity_folios_crore REAL,

    debt_folios_crore REAL,

    hybrid_folios_crore REAL,

    others_folios_crore REAL

);

---------------------------------------------------------
-- Benchmark Table
---------------------------------------------------------

CREATE TABLE dim_benchmark(

    benchmark_id INTEGER PRIMARY KEY AUTOINCREMENT,

    date DATE,

    nifty50 REAL,

    nifty100 REAL,

    nifty_midcap150 REAL,

    bse_smallcap REAL,

    crisil_liquid REAL,

    crisil_gilt REAL

);

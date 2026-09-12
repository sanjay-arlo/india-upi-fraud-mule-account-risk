# India UPI Fraud & Mule-Account Risk Analysis

> **Business Analyst / Data Analyst portfolio case study** analysing transaction-level fraud signals to prioritise review workload, loss exposure and mule-account investigation.

## 🚀 Live Dashboard

**[Open the interactive dashboard](https://sanjay-arlo.github.io/india-upi-fraud-mule-account-risk/)**

## Executive summary

This case treats fraud operations as a decision-prioritisation problem: validate case signals, quantify loss and recovery exposure, segment patterns, rank investigation risk, visualise operational workload, and route high-priority cases to the appropriate review queue.

## Business problem

**Which fraud signals create the highest review risk, and how should investigators prioritise limited fraud-operations capacity?**

## Analyst workflow

**Excel → Python / Pandas / NumPy (optional) → SQL / MySQL → Power BI → Decision**

### 1. Excel — first-pass control

Clean case-level signals, validate amounts and binary flags, calculate recovery indicators, use formulas/pivots and build the initial investigation queue.

### 2. Python — optional analytical layer

Use **Pandas + NumPy** for EDA, anomaly detection, signal-frequency analysis, repeatable transformations and sensitivity testing when programmatic analysis adds value.

### 3. SQL / MySQL — mandatory analytical layer

Use joins, CTEs, aggregations, window functions, fraud-pattern segmentation, risk ranking and exception queues to create reproducible review outputs.

### 4. Power BI — mandatory executive layer

Build governed measures, slicers and drill-through around **Fraud Executive → Risk Distribution → Loss & Recovery → Case Prioritisation**.

### 5. Decision — mandatory outcome

Route cases using **priority, reviewer tier, owner, action, loss/recovery impact and escalation threshold** rather than treating the score as proof of fraud.

## Technical stack

- **Excel** — data cleaning, reconciliation, formulas, pivots, exception analysis and scenario planning
- **SQL / MySQL** — fraud KPIs, segmentation, ranking and investigation queues
- **Python / Pandas / NumPy** — optional EDA, transformations, anomaly checks and sensitivity analysis
- **HTML / CSS / JavaScript** — interactive live dashboard
- **Chart.js** — browser-based visualisation
- **GitHub Pages** — live dashboard hosting
- **Power BI** — compatible dashboard design direction, data model, DAX and executive reporting specification
- **GitHub** — version control and documentation

## Dashboard story

1. **Fraud Executive** — case volume, loss and recovery overview
2. **Risk Distribution** — risk-score and signal patterns
3. **Loss & Recovery** — financial exposure and recovery performance
4. **Pattern / Channel View** — fraud-pattern and account-channel segmentation
5. **Case Prioritisation** — highest-risk/highest-loss investigation queue
6. **Decision Controls** — thresholds, assumptions and governance

## KPI framework

- **Risk score** = transparent weighted combination of portfolio signal flags
- **Loss exposure** = total loss amount within selected scope
- **Recovery amount** = recovered amount within selected scope
- **Recovery rate** = recovered amount / loss amount × 100
- **Investigation priority** = risk severity + financial impact + behavioural signals + review urgency

## Business Analyst deliverables

Business case, stakeholder framing, requirements thinking, KPI dictionary, Excel workflow, optional Python analysis, SQL/MySQL analysis, Power BI/DAX specification, interactive dashboard, investigation queue design and production-upgrade plan.

## Data quality & governance

Validate required fields, flag values, amount ranges, duplicates, KPI reconciliation and source consistency. Risk scores are explicitly treated as analytical indicators, not confirmed fraud labels.

## Production upgrade path

Integrate governed transaction telemetry, device/account/network signals, confirmed fraud outcomes and investigator feedback. Add model validation, explainability, access controls, audit logs, privacy-by-design controls and performance monitoring.

## Important limitation

This is a **portfolio case study using synthetic / illustrative data**. It is not official RBI, NPCI, bank or law-enforcement data, and risk scores must not be used as proof of fraud.

## Author

**Sanjay Arlo**  
Business Analyst / Data Analyst Portfolio  
[GitHub](https://github.com/sanjay-arlo)

# Industry BA Delivery Pack — India UPI Fraud Operations

## Executive decision
Prioritise fraud-review workload using explainable transaction and account-behaviour signals, while separating risk indicators from confirmed fraud outcomes.

## Stakeholders
Fraud operations, investigation teams, risk analytics, payments operations, compliance and data-governance owners.

## Requirements
- Rank cases by transparent risk score and loss exposure.
- Analyse fraud-pattern and channel concentration.
- Measure reporting time and recovery outcomes.
- Support investigation-capacity scenarios.
- Maintain privacy, auditability and human review.

## KPI dictionary
Loss amount, amount recovered, recovery %, hours to report, high-risk cases, mule indicators and average risk score.

## Analytical model
`dim_case` + `dim_pattern` + `dim_channel` → `fact_fraud_case` → investigation-priority KPI layer.

## Scenario model
Test review-capacity uplift, recovery uplift and risk-threshold assumptions to understand queue composition and operational trade-offs.

## Acceptance criteria
Risk score components are visible, loss/recovery metrics reconcile, filters cascade, the ranking is deterministic and no score is treated as proof of fraud.

## Production controls
Confirmed fraud labels, model monitoring, explainability, privacy-by-design, access controls, investigation feedback loops and audit logs.

## Portfolio note
Synthetic illustrative data only; not official bank, NPCI, RBI or law-enforcement data.

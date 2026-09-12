# BA / DA Delivery Pipeline

## Business question
Which UPI fraud cases should investigators review first based on loss, risk and mule-account signals?

## 01 — Excel — mandatory first pass
Clean case-level records, validate amounts and flags, use formulas/pivots, calculate recovery metrics and build the initial investigation queue.

## 02 — Python (Pandas + NumPy) — optional
Use Python when useful for EDA, anomaly detection, fraud-pattern distributions, signal relationships and repeatable feature engineering. Do not force Python when Excel and SQL are sufficient.

## 03 — SQL — mandatory analytical layer
Use joins, CTEs, aggregations and window functions for loss/recovery KPIs, risk segmentation, investigator rankings, peer comparisons and priority queues.

## 04 — Power BI — mandatory decision interface
Build the model, DAX measures, slicers and case drill-through: Fraud Executive → Risk Distribution → Loss & Recovery → Case Prioritisation.

## 05 — Decision — mandatory outcome
Route high-risk/high-loss cases to the right investigation tier with priority, owner, action, expected recovery impact and escalation rules.

## Acceptance criteria
Risk logic is transparent; loss/recovery totals reconcile across stages; synthetic case data is clearly labelled and never represented as live banking data.

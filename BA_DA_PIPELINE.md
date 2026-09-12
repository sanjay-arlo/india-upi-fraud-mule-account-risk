# BA / DA Delivery Pipeline

## Business question
Which UPI fraud cases should investigators review first based on risk, loss and mule-account signals?

## 01 — Excel
Clean case-level signals, validate amounts and flags, calculate recovery rate and build the initial investigation queue.

## 02 — SQL
Calculate loss, recovery, risk distributions, fraud-pattern segmentation and priority queues.

## 03 — Power BI
Build: Fraud Executive → Risk Distribution → Loss & Recovery → Case Prioritisation. Use fraud-pattern, channel and case drill-through.

## 04 — Decision
Route high-risk/high-loss cases to the right investigation tier and monitor recovery performance.

## Acceptance criteria
Risk logic is transparent; loss/recovery totals reconcile; synthetic case data is clearly labelled and never represented as live banking data.
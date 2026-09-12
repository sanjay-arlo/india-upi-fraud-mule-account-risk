-- India UPI Fraud: reproducible investigation SQL
-- MySQL 8+; portfolio data is synthetic/illustrative.

-- 1) Fraud-pattern KPI layer
WITH pattern_kpi AS (
    SELECT fraud_pattern,
           COUNT(*) AS cases,
           SUM(loss_amount_inr) AS loss_inr,
           SUM(amount_recovered_inr) AS recovered_inr,
           AVG(risk_score) AS avg_risk_score,
           AVG(hours_to_report) AS avg_hours_to_report,
           SUM(mule_flag) AS mule_flags
    FROM sample_upi_fraud_signals_india
    GROUP BY fraud_pattern
)
SELECT fraud_pattern, cases,
       ROUND(loss_inr,0) AS loss_inr,
       ROUND(recovered_inr,0) AS recovered_inr,
       ROUND(100.0 * recovered_inr / NULLIF(loss_inr,0),2) AS recovery_rate_pct,
       ROUND(avg_risk_score,2) AS avg_risk_score,
       ROUND(avg_hours_to_report,2) AS avg_hours_to_report,
       mule_flags
FROM pattern_kpi
ORDER BY avg_risk_score DESC, loss_inr DESC;

-- 2) Window function: risk rank within fraud pattern
SELECT case_id, fraud_pattern, account_channel,
       loss_amount_inr, amount_recovered_inr, risk_score,
       ROW_NUMBER() OVER (
           PARTITION BY fraud_pattern ORDER BY risk_score DESC, loss_amount_inr DESC
       ) AS pattern_case_rank
FROM sample_upi_fraud_signals_india
ORDER BY fraud_pattern, pattern_case_rank;

-- 3) CTE + join: cases above pattern risk benchmark
WITH pattern_avg AS (
    SELECT fraud_pattern, AVG(risk_score) AS pattern_avg_risk
    FROM sample_upi_fraud_signals_india
    GROUP BY fraud_pattern
)
SELECT c.case_id, c.fraud_pattern, c.account_channel,
       c.loss_amount_inr, c.risk_score,
       ROUND(p.pattern_avg_risk,2) AS pattern_avg_risk,
       ROUND(c.risk_score - p.pattern_avg_risk,2) AS risk_gap,
       c.mule_flag
FROM sample_upi_fraud_signals_india c
JOIN pattern_avg p ON c.fraud_pattern = p.fraud_pattern
WHERE c.risk_score > p.pattern_avg_risk
ORDER BY risk_gap DESC, c.loss_amount_inr DESC;

-- 4) Investigator priority queue
SELECT case_id, fraud_pattern, account_channel, loss_amount_inr,
       hours_to_report, new_payee_flag, device_change_flag,
       urgency_language_flag, unusual_amount_flag, mule_flag,
       risk_score, amount_recovered_inr
FROM sample_upi_fraud_signals_india
WHERE risk_score >= 70 OR (mule_flag = 1 AND loss_amount_inr >= 25000)
ORDER BY risk_score DESC, loss_amount_inr DESC
LIMIT 25;

-- 5) Data-quality control
SELECT COUNT(*) AS invalid_rows
FROM sample_upi_fraud_signals_india
WHERE case_id IS NULL OR fraud_pattern IS NULL OR account_channel IS NULL
   OR loss_amount_inr IS NULL OR risk_score IS NULL OR amount_recovered_inr IS NULL;

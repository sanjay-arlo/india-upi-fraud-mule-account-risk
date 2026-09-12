-- UPI fraud: review-priority analysis
SELECT fraud_pattern,
       COUNT(*) AS cases,
       ROUND(SUM(loss_amount_inr),0) AS loss_inr,
       ROUND(AVG(risk_score),2) AS avg_risk_score,
       ROUND(AVG(hours_to_report),2) AS avg_hours_to_report,
       SUM(mule_flag) AS mule_flags,
       ROUND(SUM(amount_recovered_inr),0) AS recovered_inr
FROM sample_upi_fraud_signals_india
GROUP BY fraud_pattern
ORDER BY avg_risk_score DESC, loss_inr DESC;

SELECT case_id, fraud_pattern, account_channel, loss_amount_inr,
       hours_to_report, new_payee_flag, device_change_flag,
       urgency_language_flag, unusual_amount_flag, mule_flag,
       risk_score, amount_recovered_inr
FROM sample_upi_fraud_signals_india
ORDER BY risk_score DESC, loss_amount_inr DESC
LIMIT 20;

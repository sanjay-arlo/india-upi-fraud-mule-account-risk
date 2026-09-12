from pathlib import Path
import csv
p=Path(__file__).parents[1]/'sample_upi_fraud_signals_india.csv'
req={'case_id','fraud_pattern','account_channel','loss_amount_inr','hours_to_report','new_payee_flag','device_change_flag','urgency_language_flag','unusual_amount_flag','mule_flag','risk_score','amount_recovered_inr'}
with p.open(newline='',encoding='utf-8') as f: rows=list(csv.DictReader(f))
missing=sorted(req-set(rows[0])) if rows else sorted(req)
invalid=sum(1 for r in rows if float(r['loss_amount_inr'])<0 or float(r['hours_to_report'])<0 or float(r['risk_score'])<0 or float(r['amount_recovered_inr'])<0)
print({'rows':len(rows),'missing_columns':missing,'invalid_rows':invalid})

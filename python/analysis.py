"""Optional Pandas/NumPy fraud-signal analysis.
Run: python analysis.py --input path/to/data.csv
"""
import argparse
import numpy as np
import pandas as pd

REQUIRED = ["case_id", "fraud_pattern", "account_channel", "loss_amount_inr", "hours_to_report", "mule_flag", "risk_score", "amount_recovered_inr"]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    args = parser.parse_args()
    df = pd.read_csv(args.input)
    missing = [c for c in REQUIRED if c not in df.columns]
    if missing:
        raise ValueError(f"Missing required columns: {missing}")

    for col in ["loss_amount_inr", "hours_to_report", "mule_flag", "risk_score", "amount_recovered_inr"]:
        df[col] = pd.to_numeric(df[col], errors="coerce")
    df["recovery_rate_pct"] = np.where(
        df["loss_amount_inr"] > 0,
        100 * df["amount_recovered_inr"] / df["loss_amount_inr"],
        0,
    )
    df["investigation_priority"] = (
        df["risk_score"] * np.log1p(np.maximum(df["loss_amount_inr"], 0))
        + 15 * df["mule_flag"]
    )
    queue = (
        df.sort_values(["investigation_priority", "loss_amount_inr"], ascending=False)
        [["case_id", "fraud_pattern", "account_channel", "loss_amount_inr", "risk_score", "mule_flag", "recovery_rate_pct", "investigation_priority"]]
    )
    print("Rows:", len(df))
    print(queue.head(25).to_string(index=False))


if __name__ == "__main__":
    main()

-- calculate the total number of transactions, total fraud, total legit, and percentage of fraud
SELECT COUNT(*) AS total_transactions,
SUM(isFraud) AS total_fraud,
COUNT(*) - SUM(isFraud) AS total_legit,
ROUND(AVG(isFraud) * 100,2) AS fraud_pct
FROM transactions;

-- ccalulate range of transaction amounts and average transaction amount
SELECT COUNT(*) AS n,
ROUND(MIN(TransactionAmt), 2) as min_amt,
ROUND(MAX(TransactionAmt), 2) as max_amt,
ROUND(AVG(TransactionAmt), 2) as mean_amt,
ROUND(STDDEV(TransactionAmt), 2) as std_amt
FROM transactions;

--compare amount fraud vs legit transactions
SELECT 
    isFraud,
    COUNT(*) AS n,
    ROUND(AVG(TransactionAmt), 2) AS avg_amt,
    ROUND(MIN(TransactionAmt), 2) AS min_amt,
    ROUND(MAX(TransactionAmt), 2) AS max_amt
FROM transactions
GROUP BY isFraud;
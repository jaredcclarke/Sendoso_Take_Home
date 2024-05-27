-- Sendoso Take Home
-- Part 1
-- a. Return the total number of active customers by industry
SELECT industry, count(account_name))
FROM Accounts
WHERE is_active_customer is True
GROUP BY industry;

-- b. Return the list of Eneterprise customers who have made at least 3 sends, sorted in descendingorder by number of total sends
SELECT a. account_name, count(t.transaction_id) as total_sends
FROM Accounts as a
LEFT JOIN Transactions as t
ON a.account_id = t.account_id
WHERE account_segment = “Enterprise”
GROUP BY a.account_name
HAVING total_sends >= 3
ORDER BY total_sends desc;

-- c. Return a list of active customers, the first send date for each of those accounts, and the user email of the user who placed that send. If an applicable account has never attempted a send, return Null as their first send date
SELECT a.account_name, u.user_email, ISNULL(min(t.transaction_date), NULL) as first_send_date
FROM Accounts a
LEFT JOIN Users u
ON a.account_id = u.account_id
LEFT JOIN Transactions t
ON u.account_id = t.account_id and u.user_id = t.user_id
WHERE a.is_active_customer is True
GROUP BY a.account_name, u.user_email;

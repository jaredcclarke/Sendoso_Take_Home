  -- Cleaned version after I checked where Null values and removed them
SELECT
  t.*, -- selecting all items from transactions table
  tm.ACCOUNT_SEGMENT,
  u.ROLE,
  u.DEPARTMENT
FROM
  `mystical-caster-294123.sendoso.transactions` t
LEFT JOIN  
  `mystical-caster-294123.sendoso.teams` tm
ON
  t.TEAM_ID = tm.TEAM_ID
LEFT JOIN
  `mystical-caster-294123.sendoso.users` u
ON
  t.USER_ID = u.USER_ID
WHERE
  account_segment IS NOT null
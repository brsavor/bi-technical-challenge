-- Q2 --

SELECT 
  Round(Avg(amount), 2) AS ACV
FROM   raw.hubspot_deals
WHERE  1 = 1
  AND is_closed IS TRUE
  ---- equivalent to above ----
  -- AND date_entered_closed_won IS NOT NULL
  -- OR date_entered_closed_lost IS NOT NULL
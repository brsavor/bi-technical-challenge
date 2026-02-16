-- Q1 --

SELECT
  Count(DISTINCT hubspot_company_id) AS customers_count
FROM
  raw.hubspot_deals
WHERE 1=1
  AND date_entered_closed_won IS NOT NULL -- customers won
  AND date_entered_closed_lost IS NULL -- exclude churned as question is about today's number of customers
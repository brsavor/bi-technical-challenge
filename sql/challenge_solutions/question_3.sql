-- Q3 --

WITH 
-- take snapshot of users at 2026-01-01 and add column with total number of users in that snapshot --
base_cohort AS (
  SELECT
    DISTINCT user_id
    , Count(Distinct user_id) OVER () AS total_users
  FROM raw.backend_events
  WHERE 1=1
    AND Date(event_timestamp) <= '2026-01-01' -- take users created on or earlier than 2026-01-01
    AND event_name = 'UserCreated'
)
-- take only meaningful events in the relevant time range and add week of the year column --
, relevant_events AS (
  SELECT 
    Week(event_timestamp) AS week_of_year -- added week of the year number
    , *
  FROM raw.backend_events
  WHERE 1=1
    AND event_name NOT IN ('TokenGenerated', 'UserCreated', 'UserUpdated', 'OrganizationCreated', 'OrganizationUpdated') -- exclude non-meaningful events
    AND Date(event_timestamp) >= '2026-01-01'
    -- AND Date_part('isoyear', event_timestamp) = 2026 -- uncomment this and comment out the line above if we want to include events from Week-1 happened in 2025 as Week-1 started on 2025-12-29
)
-- join users snapshot with revelant user events --
, base_cohort_relevant_events AS (
  SELECT
    bc.user_id
    , bc.total_users
    , week_of_year
    , event_id
    , event_name
    , event_timestamp
    , organization_id
    , event_properties
  FROM base_cohort bc
  INNER JOIN relevant_events re
    ON bc.user_id = re.user_id
)
-- aggregate active users per week
, week_aggregation AS (
  SELECT
    Concat_ws('-', 'Week', week_of_year) AS week_of_year
    , total_users
    , Count(Distinct user_id) AS active_users
  FROM base_cohort_relevant_events
  GROUP BY week_of_year, total_users
  ORDER BY week_of_year
)
-- calculate retention (shown in percentage) --
SELECT 
  *
  , Round(100 * active_users / total_users, 2) AS retention_rate
FROM week_aggregation
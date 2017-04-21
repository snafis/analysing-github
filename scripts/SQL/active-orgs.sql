-- Active Orgs
-- Count of total orgs in which any event was triggered (https://developer.github.com/v3/activity/events/types/) in the specified time frame
-- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
	COUNT(DISTINCT events.org.id) AS events_org_count
FROM (SELECT * FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31')))
 AS events

-- 331,797 total active organizations
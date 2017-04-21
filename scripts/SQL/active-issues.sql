-- Active issues
-- Count of total active issues in the specified time frame
-- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
	COUNT(DISTINCT JSON_EXTRACT_SCALAR(events.payload, '$.issue.id')) AS events_issue_count
FROM (SELECT * FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31')))
 AS events

-- 10,723,492 active issues
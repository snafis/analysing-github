-- Active repositories
-- Count of total repositories in which any event was triggered (https://developer.github.com/v3/activity/events/types/) in the specified time frame
-- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
	COUNT(DISTINCT events.repo.id) AS events_repo_count
FROM (SELECT * FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31')))
 AS events

-- 19,410,242 total active repositories

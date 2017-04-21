-- Active users
-- Count of total users which triggered an event (https://developer.github.com/v3/activity/events/types/) in the specified time frame
-- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
	COUNT(DISTINCT events.actor.id) AS events_actor_count
FROM (SELECT * FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31')))
 AS events

 -- 5,865,497 total active users
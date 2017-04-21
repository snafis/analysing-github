--- Organizations with the most Contributors
--- List of organizations that have the most unique users contributing via commits or opening or commenting on an issue or PR in the specified time frame
--- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
  events.org.login AS events_org_login,
  COUNT(DISTINCT events.actor.id) AS events_actor_count
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31'))) AS events
WHERE
  events.type = 'CommitCommentEvent'
    OR events.type = 'IssueCommentEvent'
    OR events.type = 'IssueEvent'
    OR events.type = 'PullRequestEvent'
    OR events.type = 'PullRequestReviewCommentEvent'
    OR events.type = 'PushEvent'
  AND events.org.login IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  10

-- events_org_login	events_actor_count
-- Microsoft	16419
-- facebook	15682
-- docker	14059
-- angular	12841
-- google	12140
-- atom	9698
-- FortAwesome	9617
-- elastic	7220
-- apache	6999
-- npm	6815

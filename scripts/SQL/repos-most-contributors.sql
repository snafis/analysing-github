--- Repositories with the most Contributors
--- List of repositories that have the most unique users contributing via commits or opening or commenting on an issue or PR in the specified time frame
--- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
  events.repo.name AS events_repo_name,
  COUNT(DISTINCT events.actor.id) AS events_actor_count
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31'))) AS events
WHERE
  events.type = 'CommitCommentEvent'
    OR events.type = 'PushEvent'
    OR events.type = 'IssueCommentEvent'
    OR events.type = 'PullRequestEvent'
    OR events.type = 'PullRequestReviewCommentEvent'
    OR events.type = 'IssuesEvent'
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  10

-- events_repo_name	events_actor_count
-- FortAwesome/Font-Awesome	10654
-- docker/docker	8253
-- npm/npm	7041
-- jlord/patchwork	6806
-- facebook/react-native	6250
-- Microsoft/vscode	5855
-- atom/atom	5745
-- FreeCodeCamp/FreeCodeCamp	5622
-- angular/material	4355
-- angular/angular	4217
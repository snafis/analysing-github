--- Repositories with the most code reviewers
--- List of repositories that have the most unique users reviewing code via PullRequestReviewCommentEvent in the specified time frame
--- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
  events.repo.name AS events_repo_name,
  COUNT(DISTINCT events.actor.id) AS events_actor_count
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31'))) AS events
WHERE
  events.type = 'PullRequestReviewCommentEvent'
  AND events.org.login) IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  10

-- events_repo_name	events_actor_count
-- Homebrew/homebrew	523
-- kubernetes/kubernetes	503
-- apache/spark	478
-- nodejs/node	358
-- rails/rails	341
-- NixOS/nixpkgs	331
-- docker/docker	330
-- rust-lang/rust	329
-- symfony/symfony	323
-- facebook/react-native	307

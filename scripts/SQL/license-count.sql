-- Top licenses used on open source projects
-- List of the most commonly used licenses on GitHub open source projects
-- Source: GitHub Public Data Set https://cloud.google.com/bigquery/public-data/github

SELECT
  license,
  COUNT(*)
FROM
  [bigquery-public-data:github_repos.licenses]
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  5
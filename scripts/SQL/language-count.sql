--- Total Language Count
--- Count of all recognized programming languages on github
--- Source: GitHub Public Data Set https://cloud.google.com/bigquery/public-data/github

SELECT
  COUNT(DISTINCT language.name)
FROM
  [bigquery-public-data:github_repos.languages]

-- 316 total languages
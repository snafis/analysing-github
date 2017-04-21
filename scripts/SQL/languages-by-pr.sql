-- Most Popular Languages by Pull requests
-- Top programming languages by number of opened pull requests in the specified time frame
-- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
  JSON_EXTRACT_SCALAR(events.payload, '$.pull_request.base.repo.language') AS events_repo_language,
  COUNT(CASE WHEN (events.type = 'PullRequestEvent') THEN 1 ELSE NULL END) AS events_count_pull_request
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31'))) AS events
WHERE
  JSON_EXTRACT_SCALAR(events.payload, '$.action') = 'opened'
  AND JSON_EXTRACT_SCALAR(events.payload, '$.pull_request.base.repo.language') IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  25

-- events_repo_language	events_count_pull_request
-- JavaScript	1604219
-- Java	763783
-- Python	744045
-- Ruby	740610
-- HTML	546211
-- PHP	478153
-- C++	330259
-- CSS	271782
-- C#	229985
-- C	202295
-- Go	188121
-- Shell	143071
-- Objective-C	75478
-- Scala	70216
-- Swift	62284
-- TypeScript	55587
-- CoffeeScript	46216
-- Rust	36874
-- PowerShell	32207
-- Perl	32134
-- Lua	25742
-- R	24909
-- Makefile	24803
-- DM	23531
-- TeX	21782

SELECT
  JSON_EXTRACT_SCALAR(events.payload, '$.pull_request.base.repo.language') AS events_repo_language,
  COUNT(CASE WHEN (events.type = 'PullRequestEvent') THEN 1 ELSE NULL END) AS events_count_pull_request
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2014-09-01'),TIMESTAMP('2015-08-31'))) AS events
WHERE
  JSON_EXTRACT_SCALAR(events.payload, '$.action') = 'opened'
  AND JSON_EXTRACT_SCALAR(events.payload, '$.pull_request.base.repo.language') IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  25

-- Repository Language	Events Count Pull Request
-- JavaScript	813911
-- Python	483174
-- Java	467928
-- Ruby	447256
-- PHP	335357
-- C++	223951
-- CSS	199677
-- HTML	159518
-- C	137242
-- C#	122476
-- Go	97420
-- Shell	81393
-- Objective-C	55272
-- Scala	45729
-- CoffeeScript	39161
-- Perl	29687
-- Rust	29199
-- Lua	18466
-- Swift	17193
-- TypeScript	15876
-- R	15576
-- DM	15423
-- Clojure	15046
-- Haskell	14912
-- TeX	13797
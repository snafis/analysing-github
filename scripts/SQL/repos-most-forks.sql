-- Repositories with the most Forks
--- List of repositories that have the most Forks in the specified time frame
--- Source: githubarchive public data set via Google BigQuery http://githubarchive.org/

SELECT
  events.repo.name AS events_repo_name,
  COUNT(DISTINCT events.actor.id) AS events_actor_count
FROM (
  SELECT
    *
  FROM TABLE_DATE_RANGE([githubarchive:day.],TIMESTAMP('2015-09-01'),TIMESTAMP('2016-08-31'))) AS events
  WHERE
    events.type = 'ForkEvent'
GROUP BY
  1
ORDER BY
  2 DESC
LIMIT
  10

-- events_repo_name	events_actor_count
-- jtleek/datasharing	38020
-- octocat/Spoon-Knife	28738
-- rdpeng/ProgrammingAssignment2	27499
-- twbs/bootstrap	15669
-- tensorflow/tensorflow	14070
-- rdpeng/ExData_Plotting1	12458
-- udacity/frontend-nanodegree-resume	11553
-- LarryMad/recipes	10229
-- barryclark/jekyll-now	10070
-- angular/angular.js	9334
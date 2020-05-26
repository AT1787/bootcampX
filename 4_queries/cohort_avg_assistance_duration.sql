SELECT avg (x) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at-started_at) as x
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY x
) as total_durations;
SELECT
    company_id,
    name AS company_name

FROM
    company_id

WHERE
    company_id IN (
        SELECT
             company_id
        FROM
            job_postings_fact
        WHERE
        job_no_degree_mentions = TRUE
        GROUP BY
            company_id
    )
            ORDER BY
                name ASC

                WITH company_job_count AS (
                    SELECT
                        company_id,
                        COUNT(*) AS total_jobs
                    FROM
                        job_postings_fact
                  GROUP BY
                        company_id

                )
SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM
    company_dim
LEFT JOIN company_job_count ON company_job_count.coompany_id = company_dim.company_id

ORDER BY
    total_jobs DESC;
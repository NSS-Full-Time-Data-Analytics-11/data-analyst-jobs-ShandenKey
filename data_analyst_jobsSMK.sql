SELECT *
FROM data_analyst_jobs;

--1) How many rows are in the data_analyst_jobs table?
SELECT COUNT (title)
FROM data_analyst_jobs;

--2a) Write a query to look at just the first 10 rows. 
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--2b) What company is associated with the job posting on the 10th row?
SELECT company
FROM data_analyst_jobs
LIMIT 10;

--3) How many postings are in Tennessee? 
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN';

--3b) How many are there in either Tennessee or Kentucky?
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN'OR location = 'KY';

--4) How many postings in Tennessee have a star rating above 4?
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--5) How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;


--6) Show the average star rating for companies in each state. 
SELECT location, AVG (star_rating)
FROM data_analyst_jobs
GROUP BY location;

--6b) The output should show the state as state and the average rating for the state as avg_rating.
SELECT location AS state, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location;

--6c) Which state shows the highest average rating?
SELECT location AS state, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT null
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 1;

--7) Select unique job titles from the data_analyst_jobs table. 
SELECT DISTINCT title
FROM data_analyst_jobs;

--7b) How many are there?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

--8) How many unique job titles are there for California companies?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--9a) Find the name of each company and its average star rating for all companies that have 
--more than 5000 reviews across all locations. 
SELECT company, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT null
GROUP BY company;

--9bHow many companies are there with more that 5000 reviews across all locations?
SELECT COUNT (DISTINCT company) 
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT null;

--10a) Add the code to order the query in #9 from highest to lowest average star rating. 
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count >5000
ORDER BY company DESC;

--11a) Find all the job titles that contain the word ‘Analyst’. 
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--11b) How many different job titles are there?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

--12a) How many different job titles do not contain either the word ‘Analyst’ or 
--the word ‘Analytics’? 

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

--12b) What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%Analytics%';

--BONUS: You want to understand which jobs requiring SQL are hard to fill. 
--Find the number of jobs by industry (domain) that require SQL and have been
--posted longer than 3 weeks.

SELECT domain,COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE skill = 'SQL' AND days_since_posting >=21
GROUP BY domain;

--Disregard any postings where the domain is NULL.
SELECT domain,COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE skill = 'SQL' AND days_since_posting >=21 AND domain IS NOT null
GROUP BY domain;

--Order your results so that the domain with the greatest number of hard to fill jobs is at the top. 
SELECT domain, COUNT(title) AS total_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting >21 AND domain IS NOT null
GROUP BY domain
ORDER BY total_jobs DESC;;

--Which three industries are in the top 4 on this list? 

--How many jobs have been listed for more than 3 weeks for each of the top 4?



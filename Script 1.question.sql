1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

---zjistime prumernou mzdu v danem roce za jednotlive odvetvi

SELECT DISTINCT 
	industry_name,	
	round (avg(avg_gross_salary_in_czk),0) AS average_year_salary,
	`year` 
FROM t_ivana_kingma_project_sql_primary_final tikpspf
GROUP BY industry_name,
	`year`;

----propojime shodne odvetvi a zjistime prumerne mzdy v odvetvich za dane roky a jak se mezi nasledujicimi roky lisi

WITH salary_industry_name AS
(
SELECT DISTINCT 
	industry_name,	
	round (avg(avg_gross_salary_in_czk),0) AS average_year_salary,
	`year` 
FROM t_ivana_kingma_project_sql_primary_final tikpspf
GROUP BY industry_name,
	`year`)
SELECT*
FROM salary_industry_name AS sain
JOIN salary_industry_name AS sain2 
ON sain.`year`=sain2.`year`-1
WHERE sain.industry_name=sain2.industry_name;


---growth rate=(pres.-past)/past*100 vzorec----pridame sloupec s meyirocnim narustem/snizenim mzdy

WITH salary_industry_name AS
(
SELECT DISTINCT 
	industry_name,	
	round (avg(avg_gross_salary_in_czk),0) AS average_year_salary,
	`year` 
FROM t_ivana_kingma_project_sql_primary_final tikpspf
GROUP BY industry_name,
	`year`)
SELECT
sain.industry_name,
sain.average_year_salary,
sain.`year`,
sain2.average_year_salary,
sain2.`year`,
round ((sain2.average_year_salary-sain.average_year_salary)/sain.average_year_salary*100, 2) AS increase_salary
FROM salary_industry_name AS sain
JOIN salary_industry_name AS sain2 
ON sain.`year`=sain2.`year`-1
WHERE sain.industry_name=sain2.industry_name;






---vzfiltrujeme si klauzuli WHERE kde increase salary je zaporny, v techto letech klesla mzda 
---v techto odvetvich v jednotlivych letech myda klesla

WITH salary_industry_name AS
(
SELECT DISTINCT 
	industry_name,	
	round (avg(avg_gross_salary_in_czk),0) AS average_year_salary,
	`year` 
FROM t_ivana_kingma_project_sql_primary_final tikpspf
GROUP BY industry_name,
	`year`)
SELECT
sain.industry_name,
sain.average_year_salary,
sain.`year`,
sain2.average_year_salary,
sain2.`year`,
round ((sain2.average_year_salary-sain.average_year_salary)/sain.average_year_salary*100, 2) AS increase_salary
FROM salary_industry_name AS sain
JOIN salary_industry_name AS sain2 
ON sain.`year`=sain2.`year`-1
WHERE sain.industry_name=sain2.industry_name
AND round ((sain2.average_year_salary-sain.average_year_salary)/sain.average_year_salary*100, 2) <0;














----Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.


---vsechny zeme , rok, HDP, populace

CREATE TABLE t_Ivana_Kingma_project_SQL_secondary_final AS
SELECT
e.country ,
e.`year`,
e.GDP AS HDP,
e.population 
FROM economies e 
JOIN countries c 
ON e.country=c.country
WHERE c.continent LIKE '%europe%' AND e.`year` >=2006 AND e.`year` <= 2018 ;



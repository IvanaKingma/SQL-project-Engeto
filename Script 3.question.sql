-----Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?-----
----v prvni casti je chzba a nechce se spoustet a dlouho trva----
SELECT
product_name, 	
`year`,
	round (avg(product_price),2) AS avarage_price_produkt, 
	round (avg (avg_gross_salary_in_czk),2) AS avarage_gross_salary
FROM t_ivana_kingma_project_sql_primary_final tikpspf
JOIN t_ivana_kingma_project_sql_primary_final tikpspf2 
ON tikpspf.`year` =tikpspf2.`year` -1
GROUP BY product_name , `year` 
;
---nutnost vztvoreni teto pomocne tabulky-kdzy jsem se pokousela vse vloyit do jednoho scriptu, nacitani tohoto skriptu bylo strasne pomale a nemoha jsem s nim efektivne pracovat.

CREATE TABLE t_ivana_kingma_project_sql_question3 AS
SELECT
product_name, 	
`year`,
	round (avg(product_price),2) AS avarage_price_produkt, 
	round (avg (avg_gross_salary_in_czk),2) AS avarage_gross_salary
FROM t_ivana_kingma_project_sql_primary_final tikpspf
GROUP BY product_name , `year`;



SELECT 
q.product_name,
q.`year`,
r.`year`,
q.avarage_price_produkt, 
r.avarage_price_produkt, 
	round (r.avarage_price_produkt /q.avarage_price_produkt*100,0) AS price_year_increase,
round(avg(r.avarage_price_produkt /q.avarage_price_produkt*100),0) AS avg_price_year_increase
FROM t_ivana_kingma_project_sql_question3 AS q
JOIN t_ivana_kingma_project_sql_question3 AS r
ON q.`year`=r.`year`-1
GROUP BY q.product_name ;



---growth rate=(pres.-past)/past*100 vzorec-----spravnz vzorec

SELECT 
q.product_name,
q.`year` ,
r.`year` AS new_year,
q.avarage_price_produkt, 
r.avarage_price_produkt AS new_year_avarage_price_produkt, 
	round ((r.avarage_price_produkt- q.avarage_price_produkt)/q.avarage_price_produkt*100,2) AS price_year_increase
FROM t_ivana_kingma_project_sql_question3 AS q
JOIN t_ivana_kingma_project_sql_question3 AS r
ON q.`year`=r.`year`-1
WHERE q.product_name=r.product_name 


---TBULKA S PRUMERNYM VYRUSTEM MEYIROCNIM VYRUSTEM CEN-----odpoved na otayzku


WITH increase AS(
SELECT 
q.product_name,
q.`year` ,
r.`year` AS new_year,
q.avarage_price_produkt, 
r.avarage_price_produkt AS new_year_avarage_price_produkt, 
	round ((r.avarage_price_produkt- q.avarage_price_produkt)/q.avarage_price_produkt*100,2) AS price_year_increase
FROM t_ivana_kingma_project_sql_question3 AS q
JOIN t_ivana_kingma_project_sql_question3 AS r
ON q.`year`=r.`year`-1
WHERE q.product_name=r.product_name
)
SELECT
product_name,
round (avg(price_year_increase),2) 
FROM increase
GROUP BY product_name
ORDER BY round (avg(price_year_increase),2) ;



;
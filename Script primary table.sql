SELECT
	cpc.name AS product_name,	
	cp.value AS product_price,
	cpc.price_value,
	cpc.price_unit,
	cpay.value AS avg_gross_salary_in_czk,
	cpay.payroll_year AS 'year', 
	cpib.name AS industry_name
FROM czechia_price cp 
JOIN czechia_price_category cpc 
ON cp.category_code =cpc.code 
	JOIN czechia_payroll cpay 
	ON cpay.payroll_year = YEAR(cp.date_from)
	JOIN czechia_payroll_industry_branch cpib 
	ON cpay.industry_branch_code =cpib.code
	WHERE cpay.value_type_code = 5958 AND cpay.calculation_code = 200;  ---prumerna hruba mzda na zamestnance 5958,prepoctenz kod 200, prepoctene osobz na pocet uvayku TABLE t_Ivana_Kingma_project_SQL_primary_final

CREATE TABLE t_Ivana_Kingma_project_SQL_primary_final	AS
	SELECT
	cpc.name AS product_name,	
	cp.value AS product_price,
	cpc.price_value,
	cpc.price_unit,
	cpay.value AS avg_gross_salary_in_czk,
	cpay.payroll_year AS 'year', 
	cpib.name AS industry_name
FROM czechia_price cp 
JOIN czechia_price_category cpc 
ON cp.category_code =cpc.code 
	JOIN czechia_payroll cpay 
	ON cpay.payroll_year = YEAR(cp.date_from)
	JOIN czechia_payroll_industry_branch cpib 
	ON cpay.industry_branch_code =cpib.code 
	WHERE cpay.value_type_code = 5958 AND cpay.calculation_code = 200;  ---prumerna hruba mzda na zamestnance

DROP TABLE t_Ivana_Kingma_project_SQL_primary_final;

	
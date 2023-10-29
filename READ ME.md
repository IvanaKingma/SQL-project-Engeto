# SQL projekt Engeto

# Zadání projektu
Cílem projektu je analyzovat dostupnost základních potravin široké veřejnosti v ČR prostřednictvím výzkumných otázek.

# Struktrura projektu
1. úkolem je připravit datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období v ČR. Tabulka s názvem t_Ivana_Kingma_project_SQL_primary_final.

2. úkolem je připravit tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR. 
Tabulka s názvem t_Ivana_Kingma_project_SQL_secondary_final. 

3. úkolem je připravení SQL datových sad, které z výše připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky.

# Výzkumné otázky:

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

4 .Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

# Obsah projektu:
- read.me
- složka Dokumentace k výzkumným otázkám obsahující tyto soubory:
	- dokumentace 1.otázka
	- dokumentace 2.otázka
	- dokumentace 3.otázka
	- dokumentace 4.otázka
	- dokumentace 5.otázka	
- složka SQL skripts obsahující tyto soubory
	- Script primary table 
	- Script secondary table
	- Script 1.question
	- Script 2.question
	- Script 3.question
	- Script 4.question
	- Script 5.question
	
# Primární čerpání dat: 
- czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
- czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
- czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
- czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
- czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
- czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
- czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
- czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
- czechia_district – Číselník okresů České republiky dle normy LAU.
- countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
- economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.







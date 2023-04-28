-- Creating a database
CREATE DATABASE IF NOT EXISTS covid_19;

-- Deleting a table
DROP TABLE IF EXISTS covid_deaths;

-- Creating a blank table before adding data from .csv file
CREATE TABLE covid_deaths(
	iso_code	varchar(255) not null,
	continent	varchar(255) null,
	location	varchar(255) null,
	date	date not null,
	total_cases	bigint null,
	new_cases	bigint null,
	new_cases_smoothed	bigint null,
	total_deaths	bigint null,
	new_deaths	bigint null,
	new_deaths_smoothed	bigint null,
	total_cases_per_million	double null,
	new_cases_per_million	double null,
	new_cases_smoothed_per_million	double null,
	total_deaths_per_million	double null,
	new_deaths_per_million	double null,
	new_deaths_smoothed_per_million	double null,
	reproduction_rate	double null,
	icu_patients	bigint null,
	icu_patients_per_million	double null,
	hosp_patients	bigint null,
	hosp_patients_per_million	double null,
	weekly_icu_admissions	bigint null,
	weekly_icu_admissions_per_million	double null,
	weekly_hosp_admissions	bigint null,
	weekly_hosp_admissions_per_million	double null,
	total_tests	bigint null,
	new_tests	bigint null,
	total_tests_per_thousand	double null,
	new_tests_per_thousand	double null,
	new_tests_smoothed	bigint null,
	new_tests_smoothed_per_thousand	double null,
	positive_rate	double null,
	tests_per_case	double null,
	tests_units	varchar(255) null,
	total_vaccinations	bigint null,
	people_vaccinated	bigint null,
	people_fully_vaccinated	bigint null,
	total_boosters	bigint null,
	new_vaccinations	bigint null,
	new_vaccinations_smoothed	bigint null,
	total_vaccinations_per_hundred	double null,
	people_vaccinated_per_hundred	double null,
	people_fully_vaccinated_per_hundred	double null,
	total_boosters_per_hundred	double null,
	new_vaccinations_smoothed_per_million	double null,
	new_people_vaccinated_smoothed	bigint null,
	new_people_vaccinated_smoothed_per_hundred	double null,
	stringency_index	double null,
	population_density	double null,
	median_age	double null,
	aged_65_older	double null,
	aged_70_older	double null,
	gdp_per_capita	double null,
	extreme_poverty	double null,
	cardiovasc_death_rate	double null,
	diabetes_prevalence	double null,
	female_smokers	double null,
	male_smokers	double null,
	handwashing_facilities	double null,
	hospital_beds_per_thousand	double null,
	life_expectancy	double null,
	human_development_index	double null,
	population	bigint null,
	excess_mortality_cumulative_absolute	double null,
	excess_mortality_cumulative	double null,
	excess_mortality	double null,
	excess_mortality_cumulative_per_million	double null
    );

-- Loading data from .csv file and how to load empty values from .csv file (with interger, double datatype)
LOAD DATA INFILE 'D:/Learning/DA/MySQL/Portfolio/Covid-19/covid_19.csv' INTO TABLE covid_deaths
FIELDS TERMINATED BY ';'
IGNORE 1 LINES (
	iso_code,
	continent,
	location,
	date,
	@total_cases,
	@new_cases,
	@new_cases_smoothed,
	@total_deaths,
	@new_deaths,
	@new_deaths_smoothed,
	@total_cases_per_million,
	@new_cases_per_million,
	@new_cases_smoothed_per_million,
	@total_deaths_per_million,
	@new_deaths_per_million,
	@new_deaths_smoothed_per_million,
	@reproduction_rate,
	@icu_patients,
	@icu_patients_per_million,
	@hosp_patients,
	@hosp_patients_per_million,
	@weekly_icu_admissions,
	@weekly_icu_admissions_per_million,
	@weekly_hosp_admissions,
	@weekly_hosp_admissions_per_million,
	@total_tests,
	@new_tests,
	@total_tests_per_thousand,
	@new_tests_per_thousand,
	@new_tests_smoothed,
	@new_tests_smoothed_per_thousand,
	@positive_rate,
	@tests_per_case,
	tests_units,
	@total_vaccinations,
	@people_vaccinated,
	@people_fully_vaccinated,
	@total_boosters,
	@new_vaccinations,
	@new_vaccinations_smoothed,
	@total_vaccinations_per_hundred,
	@people_vaccinated_per_hundred,
	@people_fully_vaccinated_per_hundred,
	@total_boosters_per_hundred,
	@new_vaccinations_smoothed_per_million,
	@new_people_vaccinated_smoothed,
	@new_people_vaccinated_smoothed_per_hundred,
	@stringency_index,
	@population_density,
	@median_age,
	@aged_65_older,
	@aged_70_older,
	@gdp_per_capita,
	@extreme_poverty,
	@cardiovasc_death_rate,
	@diabetes_prevalence,
	@female_smokers,
	@male_smokers,
	@handwashing_facilities,
	@hospital_beds_per_thousand,
	@life_expectancy,
	@human_development_index,
	@population,
	@excess_mortality_cumulative_absolute,
	@excess_mortality_cumulative,
	@excess_mortality,
	@excess_mortality_cumulative_per_million
)
SET 
	total_cases =	@total_cases/1,
	new_cases =	@new_cases/1,
	new_cases_smoothed =	@new_cases_smoothed/1,
	total_deaths =	@total_deaths/1,
	new_deaths =	@new_deaths/1,
	new_deaths_smoothed =	@new_deaths_smoothed/1,
	total_cases_per_million =	@total_cases_per_million/1,
	new_cases_per_million =	@new_cases_per_million/1,
	new_cases_smoothed_per_million =	@new_cases_smoothed_per_million/1,
	total_deaths_per_million =	@total_deaths_per_million/1,
	new_deaths_per_million =	@new_deaths_per_million/1,
	new_deaths_smoothed_per_million =	@new_deaths_smoothed_per_million/1,
	reproduction_rate =	@reproduction_rate/1,
	icu_patients =	@icu_patients/1,
	icu_patients_per_million =	@icu_patients_per_million/1,
	hosp_patients =	@hosp_patients/1,
	hosp_patients_per_million =	@hosp_patients_per_million/1,
	weekly_icu_admissions =	@weekly_icu_admissions/1,
	weekly_icu_admissions_per_million =	@weekly_icu_admissions_per_million/1,
	weekly_hosp_admissions =	@weekly_hosp_admissions/1,
	weekly_hosp_admissions_per_million =	@weekly_hosp_admissions_per_million/1,
	total_tests =	@total_tests/1,
	new_tests =	@new_tests/1,
	total_tests_per_thousand =	@total_tests_per_thousand/1,
	new_tests_per_thousand =	@new_tests_per_thousand/1,
	new_tests_smoothed =	@new_tests_smoothed/1,
	new_tests_smoothed_per_thousand =	@new_tests_smoothed_per_thousand/1,
	positive_rate =	@positive_rate/1,
	tests_per_case =	@tests_per_case/1,
	total_vaccinations =	@total_vaccinations/1,
	people_vaccinated =	@people_vaccinated/1,
	people_fully_vaccinated =	@people_fully_vaccinated/1,
	total_boosters =	@total_boosters/1,
	new_vaccinations =	@new_vaccinations/1,
	new_vaccinations_smoothed =	@new_vaccinations_smoothed/1,
	total_vaccinations_per_hundred =	@total_vaccinations_per_hundred/1,
	people_vaccinated_per_hundred =	@people_vaccinated_per_hundred/1,
	people_fully_vaccinated_per_hundred =	@people_fully_vaccinated_per_hundred/1,
	total_boosters_per_hundred =	@total_boosters_per_hundred/1,
	new_vaccinations_smoothed_per_million =	@new_vaccinations_smoothed_per_million/1,
	new_people_vaccinated_smoothed =	@new_people_vaccinated_smoothed/1,
	new_people_vaccinated_smoothed_per_hundred =	@new_people_vaccinated_smoothed_per_hundred/1,
	stringency_index =	@stringency_index/1,
	population_density =	@population_density/1,
	median_age =	@median_age/1,
	aged_65_older =	@aged_65_older/1,
	aged_70_older =	@aged_70_older/1,
	gdp_per_capita =	@gdp_per_capita/1,
	extreme_poverty =	@extreme_poverty/1,
	cardiovasc_death_rate =	@cardiovasc_death_rate/1,
	diabetes_prevalence =	@diabetes_prevalence/1,
	female_smokers =	@female_smokers/1,
	male_smokers =	@male_smokers/1,
	handwashing_facilities =	@handwashing_facilities/1,
	hospital_beds_per_thousand =	@hospital_beds_per_thousand/1,
	life_expectancy =	@life_expectancy/1,
	human_development_index =	@human_development_index/1,
	population =	@population/1,
	excess_mortality_cumulative_absolute =	@excess_mortality_cumulative_absolute/1,
	excess_mortality_cumulative =	@excess_mortality_cumulative/1,
	excess_mortality =	@excess_mortality/1,
	excess_mortality_cumulative_per_million =	@excess_mortality_cumulative_per_million/1
;

-- Opening entire datatable
SELECT *
FROM covid_deaths
;


-- Percentage of deaths per total_cases in countries
SELECT 
	continent,
    location,
    max(total_cases) as sum_cases,
    max(total_deaths) as sum_deaths,
    round(max(total_deaths)/max(total_cases), 3)*100 as deaths_per_cases
FROM
    covid_deaths
GROUP BY continent, location
HAVING continent !=''
ORDER BY deaths_per_cases DESC
;
    
-- The countries with highest infection rate compared to population(method_1)
SELECT
	continent,
	location,
    max(total_cases) as sum_cases,
    population,
	(max(total_cases)/population*100) as infection_per_population
FROM 
	covid_deaths
GROUP BY continent, location, population
HAVING continent != '' 
ORDER BY infection_per_population DESC
;
  
  
-- The countries with highest infection rate compared to population(method_2)
SELECT 
	continent,
    location,
    population,
    sum_cases,
    ROUND(sum_cases / population, 3) * 100 AS infection_per_population
FROM
    (SELECT 
        continent, location, MAX(total_cases) AS sum_cases, population
    FROM
        covid_deaths
    GROUP BY continent, location , population 
    HAVING length(continent) > 0 ) AS total_cases_table
-- WHERE location LIKE 'Viet%'
ORDER BY infection_per_population DESC
;


-- showing and export the number of cases infected overtime
SELECT 
	location,
    population,
    date,
    -- new_cases,
    sum(new_cases) OVER (PARTITION BY location ORDER BY location, date)  as Cases,
    ((sum(new_cases) OVER (PARTITION BY location ORDER BY location, date))/population)*100 as 'Infection Rate'	
    
-- export file(large file)
INTO OUTFILE 'D:/Learing/DA/MySQL/Portfolio/Covid-19/Tableau/infection_rate_of_countries_overtime.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

FROM covid_deaths
WHERE continent !=''
;


-- showing the countries with highest death count per population
SELECT 
    continent,
    location,
    sum_deaths,
    population,
    ROUND(sum_deaths / population, 3) * 100 AS deaths_per_population
FROM
    (SELECT 
        continent,
            location,
            population,
            MAX(total_deaths) AS sum_deaths
    FROM
        covid_deaths
    GROUP BY continent , location , population
    HAVING continent != '') AS total_deaths_table
-- WHERE location LIKE 'viet%'
ORDER BY deaths_per_population DESC
;


-- Showing the continents having the highest rate of death
SELECT 
    continent,
    SUM(sum_cases) AS all_cases,
    SUM(sum_deaths) AS all_deaths,
    sum(population) as all_population ,
    SUM(sum_deaths)/SUM(sum_cases)*100 as death_rate
FROM
	-- total cases, deaths, population of countries from different continents
    (SELECT 
			continent,
            location,
            MAX(total_cases) AS sum_cases,
            MAX(total_deaths) AS sum_deaths,
            max(population) as population
    FROM
        covid_deaths
    GROUP BY location , continent
    HAVING continent != '') AS continent_cases
GROUP BY continent
ORDER BY death_rate DESC
;


-- total_cases, deaths, population in the world
SELECT 
    -- location,
    MAX(total_cases) as 'All Cases',
    MAX(total_deaths) as 'All Deaths',
    MAX(population) as "World's Population",
    (MAX(total_deaths)/MAX(total_cases))*100 as 'Death Rate'
    
FROM
    covid_deaths
GROUP BY location
HAVING location LIKE 'world'
;


-- --------------------------------------------------------------------------
-- VACCINATION

WITH RECURSIVE  -- create multi CTE
-- CTE1: the table describing the rate of people vaccinated (per population)
vaccination_tbl (continent, location, sum_vaccinations, population) 
As
(
SELECT 
    continent, location, max(total_vaccinations) AS sum_vaccinations, population
FROM
    covid_deaths
GROUP BY continent, location, population
HAVING continent !=''
),

-- CTE2: the table describing total cases and deaths
deathsvscases_tbl (continent, location, sum_cases, sum_deaths)
AS (
	SELECT 
	continent,
    location,
    max(total_cases) AS sum_cases,
    max(total_deaths) AS sum_deaths
	FROM
    covid_deaths
	GROUP BY continent, location
	HAVING continent !=''
)
SELECT 
	deca.continent, 
    vac.location,
    deca.sum_cases,
    deca.sum_deaths,
    vac.sum_vaccinations,
    vac.population
FROM vaccination_tbl vac
JOIN deathsvscases_tbl deca
ON vac.location = deca.location
;

-- final_table: continent, location, total cases, total deaths, total vaccinations, population of countries
WITH final_table (continent, location, sum_cases, sum_deaths, sum_vaccinations, population)
AS
(
	SELECT 
		continent, 
        location, 
        max(total_cases) AS sumcases, 
        max(total_deaths) AS sumdeaths,
        max(total_vaccinations) AS sumvaccinations,
        max(population) AS population
    FROM covid_deaths
    GROUP BY continent, location
    HAVING continent != ''
)

SELECT *
FROM final_table
;

-- total vaccine doses of continents(method 1)
SELECT continent, location, max(sum_doses) as all_doses
FROM(
	-- total vaccine doses of countries via 'new_vaccinations' 
	SELECT location, date, new_vaccinations, sum(new_vaccinations) OVER (PARTITION BY location ORDER BY location, date) as sum_doses
	FROM covid_deaths
	WHERE continent ='') AS vc_table
GROUP BY location
;


-- total vaccine doses of continents(method 2)
SELECT location, max(sum_doses) as all_doses
FROM(
	-- total vaccine doses of countries via 'total_vaccinations'
	SELECT continent, location, max(total_vaccinations)  as sum_doses
	FROM covid_deaths
	GROUP BY continent, location
	HAVING continent ='') AS vc_table
GROUP BY location
;

    





	

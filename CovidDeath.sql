--Determine the date of first Death in the Philippines
--Retrieve and show the total number of casualty as time progress


Select location, date,total_deaths
From dbo.CovidDeaths
Where location = 'Philippines' AND total_deaths is not null
order by date asc


--Determine the date of first recorded cases in the Philippines 
--Retrieve and show the date of first infection and new cases as time progress


Select location, date, new_cases
from dbo.CovidDeaths
where location = 'Philippines' and new_cases > 0
order by date asc


-- Pull up data for total cases vs total deaths in the Philippines as time progresses
-- Shows the data of how many number of infected died as DeathPercentage


Select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from dbo.CovidDeaths
where location = 'Philippines' AND total_cases is not null AND total_deaths is not null
order by 1,2


--Shows the number of Filipino that got infected vs the total number of population of the Philippines as time progresses


Select location, date, population, total_cases, (total_cases/population)*100 as InfectionPercentage
from dbo.CovidDeaths
where location = 'Philippines'
order by InfectionPercentage desc


--Select all data from CovidDeaths table order by location and date 


Select*
from dbo.CovidDeaths
order by location, date;


--Select location, date, total_cases, new_cases, total_deaths, and population order by location and date


Select location, date, total_cases, new_cases, total_deaths, population
from dbo.CovidDeaths
order by 1,2


-- Pull up data for total cases vs total deaths globally 


Select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from dbo.CovidDeaths
order by 4 desc


--Pull up data for total cases vs total deaths where location has the word "states"


Select location,date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from dbo.CovidDeaths
where location like '%states%'
order by 1,2


--Show percentage of population got Covid Virus
--Show which country has the highest infected vs their population


Select location, date, population, total_cases, (total_cases/population)*100 as InfectionPercentage
from dbo.CovidDeaths
order by InfectionPercentage desc


--retrieve the highest infection rate compared to the popuplation of each country


Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as InfectionPercentage
from dbo.CovidDeaths
Group by location, Population
order by InfectionPercentage desc


--show Countries with highest death count


Select location, Max(total_deaths) as DeathCount
from dbo.CovidDeaths
where continent is not null
group by location
order by DeathCount desc


--show Continent with highest death count


Select continent, Max(total_deaths) as DeathCount
from dbo.CovidDeaths
where continent is not null
group by continent
order by DeathCount desc


--show country with the highest ICU patients


Select location, Max(icu_patients) as ICUPatients
from dbo.CovidDeaths
group by location
order by 2 desc


--show total death globally


select sum(total_deaths) as GlobalDeathCount
from dbo.CovidDeaths
where continent is not null


--show global death percentage of people who got infected around the world


Select Sum(total_deaths) as TotalDeath, Sum(total_cases) as TotalCases, Sum(total_deaths)/Sum(total_cases)*100 as GlobalDeathPercentage
from dbo.CovidDeaths
where continent is not null
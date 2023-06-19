--select *
--from CovidVaccinations
--order by 3,4

--select * from coviddeaths



--select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
--from coviddeaths
--where location like 'pakistan'
--order by 1,2

--select location,date,total_cases,population,(total_cases/population)*100 as CasesPercentage
--from coviddeaths
--where location like 'pakistan'
--order by 1,2

--select Location, max(cast(total_cases as int)as HighInfectiousCount, Population,max(total_cases/population)*100) as PercentagePopulationInfected
--from coviddeaths
--group by population,location
--order by 4 desc

--select Location,Population,Max(cast(total_deaths as int))as TotalDeathCount,max((total_deaths/population)*100) as PercentagePeopleDiedPerPopulation
--from coviddeaths
--where continent is not null
--group by population,location
--order by 3 desc


--select continent,Max(cast(total_deaths as int))as TotalDeathCount
--from coviddeaths
--where continent is not null
--group by continent
--order by 2 desc

--select location,Max(cast(total_deaths as int))as TotalDeathCount
--from coviddeaths
--where continent is null
--group by location
--order by TotalDeathCount desc

--select date,sum(new_cases) as totalCases,sum(cast(new_deaths as int)) as TotalDeaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPerc
--from CovidDeaths
--where continent is not null
--group by date

select sum(new_cases) as totalCases,sum(cast(new_deaths as int)) as TotalDeaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPerc
from CovidDeaths
where continent is not null
--group by date
order by 1,2








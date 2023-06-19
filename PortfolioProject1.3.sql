--Creating Joins

select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations 
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and dea.continent like '%europe%' 

select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as PeopleVaccinated
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and vac.new_vaccinations is not null 
order by 1,2,3 desc

--CTE


with PopvsVac ( continent,location,population, date,new_vaccinations,PeopleVaccinated)
as
(
select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as PeopleVaccinated
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and vac.new_vaccinations is not null 
--order by 1,2,3 desc
)
select *,(PeopleVaccinated/population)*100 as VaccinatedPerc
from popvsvac

--Temp_Table

drop table if exists #PopulationVaccinatedPercentage
create table #PopulationVaccinatedPercentage(
continent nvarchar(255),
location nvarchar(255),
population numeric,
date datetime,
new_vaccinations numeric,
PeopleVaccinated numeric )

insert into #PopulationVaccinatedPercentage
select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as PeopleVaccinated
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and vac.new_vaccinations is not null 

select *,(PeopleVaccinated/population)*100 as VaccinatedPerc
from #PopulationVaccinatedPercentage


--Creating View
create view PopulationVaccinatedPercentage as
select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as PeopleVaccinated
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and vac.new_vaccinations is not null 



select * from #PopulationVaccinatedPercentage



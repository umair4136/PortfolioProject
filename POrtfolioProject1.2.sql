--select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations 
--from CovidDeaths dea
--join Covidvaccinations vac
--on dea.location = vac.location 
--and dea.date = vac.date
--where dea.continent is not null and dea.continent like '%europe%' 

select dea.location,dea.continent,dea.population,dea.date,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as PeopleVaccinated
from CovidDeaths dea
join Covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null and vac.new_vaccinations is not null 
order by 1,2,3 desc



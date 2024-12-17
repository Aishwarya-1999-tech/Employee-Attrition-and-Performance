select * from employee_performance_data;
##1 EMPLOYEE AGE > 50
select * from employee_performance_data
where Age >50
order by Age DESC;

##2 How many people left the company
select count(*) as Attrition_count
from employee_performance_data
where Attrition= "yes";

###3 what is the distribution of gender across different department
select Department, Gender, Count(*) as gender_count
from employee_performance_data
group by Department,gender; 

##4 what is the monthly income of employees by job role 
select JobRole , Avg (monthlyincome)
from employee_performance_data
group by JobRole;

##5 emplyoyees left the company based on their job satisfaction levels
SELECT JobSatisfaction,COUNT(*) AS TotalEmployees, 
       SUM(Attrition = 'Yes') AS AttritionCount
FROM employee_performance_data
GROUP BY JobSatisfaction;

##6 salary hike percentage vary for employess based on their performance ratng
Select Performancerating, Max(PercentSalaryHike) as max_Percent_salary_hike
from employee_performance_data
group by PerformanceRating; 

##7 what is the average work-life balance rating of employees who work overtime those who do not
select Overtime ,avg(Worklifebalance) as average_work_life_balaance
from employee_performance_data
group by OverTime; 

##8 what is the average number of years an employee spends in their current role by job level
select JobLevel,Avg(YearsInCurrentRole)
From employee_performance_data
Group By JobLevel
order by JobLevel; 

##9 #Which department has the highest average number of years since last promotion?
SELECT Department, AVG(YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM employee_performance_data
GROUP BY Department
ORDER BY AvgYearsSinceLastPromotion DESC;

##10 Identify employees with the highest performance rating and tenure over 5 years.
SELECT Age ,PerformanceRating, YearsAtCompany
FROM employee_performance_data
WHERE PerformanceRating>=3 AND YearsAtCompany > 5
order by Age asc;

##11 Spend Maximum Years in the company
Select Age, Max(YearsAtCompany)
From employee_performance_data
Group by Age 
order by Age desc
limit 5;

##12 Which job roles have the widest range of monthly rates?
SELECT JobRole, MIN(MonthlyRate) AS MinMonthlyRate, MAX(MonthlyRate) AS MaxMonthlyRate, (MAX(MonthlyRate) - MIN(MonthlyRate)) AS Income_Range
FROM employee_performance_data
GROUP BY JobRole
ORDER BY Income_Range DESC;

##13 How does marital status affect work-life balance ratings?
SELECT MaritalStatus, AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM employee_performance_data
GROUP BY MaritalStatus;

##14 there a significant difference in attrition rates between married and unmarried employees?
SELECT MaritalStatus,
       COUNT(*) AS TotalEmployees,
       SUM(Attrition = 'Yes') AS AttritionCount,
       ROUND((SUM(Attrition = 'Yes') / COUNT(*)) * 100, 2) AS AttritionRate
FROM employee_performance_data
GROUP BY MaritalStatus;
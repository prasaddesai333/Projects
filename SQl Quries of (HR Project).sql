SELECT * FROM hr.hr_1;
SELECT * FROM hr.hr_2;

#Attrition count------------------------------------------
select count(Attrition) from hr.hr_1 where Attrition='Yes';

# employee count-------------------------------------------
Select SUM(EmployeeCount) as employee_count from hr.hr_1;

#Active employee-------------------------------------------
select (sum(EmployeeCount)- (select count(attrition) from hr.hr_1
		 where attrition='Yes'))from hr.hr_1;
         
         
# Active Female employee-----------------------------
        select (sum(EmployeeCount)- (select count(attrition) from hr.hr_1
		 where attrition='Yes' and Gender='Female'))from hr.hr_1 where gender ='female'; 
         
         
  #Active male Employe---------------------------------------

select (sum(EmployeeCount)- (select count(attrition) from hr.hr_1
		 where attrition='Yes' and Gender='Male'))from hr.hr_1 where gender ='Male';       
         
         
# attriton Rate--------------------------------------------------------

select round (((select count(attrition) from hr.hr_1 where attrition ='Yes')/sum(EmployeeCount))*100,2) from hr.hr_1;       


 # 1.average attrition rate for all departments----------------------------------

select department, round(count(attrition)/(select count(employeenumber) from hr.hr_1)*100,2)  as attrtion_rate
from hr.hr_1
where attrition = "yes"
group by department;

#2. Average hourly rate of male research scientist--------------------------------
select gender, jobrole,round(avg(hourlyrate),2) as 'avg hourly rate' from hr.hr_1 where gender='male' and jobrole= 'research scientist';
         
         
   # 3. attrition rate vs monthly income stats--------------------------------------
 select hr_1.department,
round(count(hr_1.attrition)/(select count(hr_1.employeenumber) from hr.hr_1)*100,2) `Attrtion rate`,
round(avg(hr_2.MonthlyIncome),2) average_income from hr.hr_1 join hr.hr_2
on hr_1.EmployeeNumber = hr_2.`employee id`
where attrition = 'Yes'
group by hr_1.department;

#4.Average working years for each Department---------------------------------------

select hr_1.department,Round(avg(hr_2.totalworkingyears),0) from hr.hr_1
join hr.hr_2 on hr_1.employeenumber = hr_2.`Employee ID`
group by hr_1.department;

#5 Job Role Vs Work life balance----------------------------------------------------
select hr_1.jobrole,hr_2.worklifebalance, count(hr_2.worklifebalance) Employee_count
from hr.hr_1
join hr.hr_2 on hr_1.employeenumber = hr_2.`Employee ID`
group by hr_1.jobrole ,hr_2.worklifebalance
order by hr_1.jobrole;

# 6. Attrition count Vs Year since last promotion relation--------------------------------------

select * from  hr_2;

select hr_2.`yearssincelastpromotion`,count(hr_1.attrition)  attrition_count
from hr.hr_1 join hr.hr_2 on hr_1.employeenumber = hr_2.`employee id`
where hr_1.attrition = 'Yes'
group by `YearsSinceLastPromotion`
order by `YearsSinceLastPromotion`;


# 6. Attrition rate Vs Year since last promotion relation--------------------------------------
 select hr_1.department,
round(count(hr_1.attrition)/(select count(hr_1.employeenumber) from hr.hr_1)*100,2) `Attrtion rate`,
round(avg(hr_2.yearssincelastpromotion),2) yearssincelastpromotion from hr.hr_1 join hr.hr_2
on hr_1.EmployeeNumber = hr_2.`employee id`
where attrition = 'Yes'
group by hr_1.department;









         
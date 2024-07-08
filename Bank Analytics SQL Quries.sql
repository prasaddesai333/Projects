create database Bankloan;
use Bankloan;
show tables;
select * from finance_2;
select * from finance_1;


###   Year wise loan amount Stats
SELECT concat(20,RIGHT(issue_d,2)) AS year,
CONCAT(CAST(SUM(loan_amnt)/100000 AS DECIMAL(10,2)),'Millions') as total_loan_amount
from finance_1
group by 1
order by 1;



###   Grade and sub grade wise revol_bal

select f1.grade,f1.sub_grade,sum(f2.revol_bal) as sum_revol_bal
from finance_1 as f1
left join finance_2 as f2
on f1.id=f2.id
group by f1.grade,f1.sub_grade
order by f1.grade,f1.sub_grade;


#total payment for verified status vs total payment for non verified status

select finance_1.verification_status,sum(finance_2.total_pymnt) as totalpayment
from finance_1
inner join finance_2
on finance_1.id=finance_2.id
group by verification_status;


-- ----------------______________ STATE WISE AND LAST CREDITED PULL WISE LOAN STATUS ________________-----------------------------------------------------
          

SELECT 
    finance_1.addr_state,
    last_credit_pull_d,
    loan_status,
    COUNT(*) AS total_loans
FROM 
    finance_1
    join finance_2 on finance_1.id= finance_2.id
GROUP BY 
    addr_state,
    last_credit_pull_d,
    loan_status
ORDER BY 
    addr_state,
    last_credit_pull_d;
    
-- ---------------------_________________  HOME OWNERSHIP VS LAST PAYMENT DATE STATUS _______________-----------------------

SELECT 
   finance_1.home_ownership,
    finance_2.last_pymnt_d,
    loan_status,
    COUNT(*) AS total_loans
FROM 
    finance_1
    join finance_2 on finance_1.id= finance_2.id
GROUP BY 
    home_ownership,
   last_pymnt_d,
    loan_status
ORDER BY 
    home_ownership,
    last_pymnt_d;
 
 
 
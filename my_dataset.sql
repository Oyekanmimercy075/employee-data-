CREATE TABLE employees (
    emp_id INT,
    first_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE,
    performance_score INT,
    satisfaction_score INT,
    attrition VARCHAR(3)
);

INSERT INTO employees VALUES
(1, 'Ada', 'HR', 120000, '2022-01-10', 4, 3, 'Yes'),
(2, 'Tunde', 'IT', 200000, '2021-03-15', 5, 5, 'No'),
(3, 'Musa', 'Sales', 150000, '2023-02-01', 3, 2, 'Yes'),
(4, 'Chioma', 'IT', 220000, '2020-07-20', 5, 4, 'No'),
(5, 'Kemi', 'HR', 130000, '2022-11-05', 2, 2, 'Yes'),
(6, 'John', 'Sales', 140000, '2021-09-12', 4, 3, 'No'),
(7, 'Blessing', 'IT', 210000, '2023-01-18', 3, 2, 'Yes'),
(8, 'Ibrahim', 'Sales', 160000, '2020-05-25', 5, 5, 'No');
select *
from employees ;


select 
count(*)
from employees
 ;

#what is the percentage of the employees left the company ? the percentage of employee left company is 50.0%

select 
round( count( case when attrition = 'yes' then 1 end ) * 100.0 / count(*), 1)as attrition_rate
from employees;

#which department has the highest attrition ? answer: , it & sales department
select department ,
count( case when attrition = 'yes'  then 1 end ) as 'left',
count( case when attrition = 'no'  then 1 end )   as total_count,
count(*) as total 
from employees
group by department 
order by total_count desc;

#does low satisfaction lead to attrition ? yes, low satisfaction lead to attrition
select  satisfaction_score,
sum(  attrition = 'yes') as 'left',
sum( attrition = 'no'  ) as 'stayed'
from employees
group by satisfaction_score
order by satisfaction_score desc;


#what is the average salary per department  ? answer : hr avg{salary} is 125000, iT is 210000, sales is 150000

select department ,round(avg(salary), 0 ) as 'avg' 
from employees
group by department ;

#do exployee who left , earn less ? yes , employee who left earn less
select attrition,
count(*) ,
round(avg(salary), 0 ) as 'avg' 
from employees
group by attrition;

#OR

select attrition,
count(*) ,
round(sum(salary), 0 ) as 'avg' 
from employees
group by attrition;

#what is the average performance score by department ? hr is 3.0, sales is 4.0, IT is 4.3

select department ,round( avg(performance_score),1) avg_performance_score
from employees
group by department
order by avg_performance_score;

#are high performance staying or leaving ? high performance score are staying

select performance_score,
sum(attrition = 'yes') as 'left' ,
sum(attrition = 'no') as 'stayed' ,
count(*)
from employees
group by performance_score
order by performance_score desc ;

 #how long do emplyees stay before leaving ? (Ada  4 years, Musa stay for 3 years,kemi stays for 4 years,Blessing stay for 3 years)
 
 select 
 first_name, hire_date, attrition,
 year(curdate())- year(hire_date) as tenure_years
 from employees 
 where attrition = 'yes';
 
 
  
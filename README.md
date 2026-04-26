📊 HR Analytics Project: Employee Attrition & Performance Insights
🧠 Overview
This project analyzes employee data to understand attrition trends and identify key factors influencing employee turnover and performance.
The goal is to move beyond raw data and generate actionable HR insights that can support better decision-making.
🎯 Project Objectives
🔹Analyze the percentage of employees who left the company (attrition rate)
🔹Identify the department with the highest attrition
🔹Evaluate the relationship between employee satisfaction and attrition
🔹Determine the average salary across departments
🔹Assess whether lower salary contributes to employee attrition
🔹Analyze average performance scores by department
🔹Examine whether high-performing employees are more likely to stay or leave
🔹Evaluate employee tenure to understand how long employees stay before leaving 
🧾 Dataset Description
The dataset contains employee-level information, including:
first_name – Employee name
department – Department (HR, IT, Sales)
salary – Monthly salary
hire_date – Date employee joined
performance_score – Performance rating (1–5)
satisfaction_score – Job satisfaction level (1–5)
attrition – Employee status (Yes = left, No = active)
💻 Tools Used
SQL (MySQL)
Excel (for optional visualization)
📊 Key Analysis & SQL Queries
🔹 Attrition Rate
Calculated the percentage of employees who left the company.
sql code
SELECT 
(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS attrition_rate
FROM employees;
🔹 Salary Analysis
Compared average salary across departments.
sql code
SELECT 
department,
AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
🔹 Satisfaction vs Attrition
Analyzed how satisfaction impacts employee exits.
 sql code
SELECT 
satisfaction_score,
attrition,
COUNT(*) AS count
FROM employees
GROUP BY satisfaction_score, attrition;
Analyzed how long employees stay before leaving 
🔹 Tenure Analysis
 sql code
SELECT 
attrition,
YEAR(CURDATE()) - YEAR(hire_date) AS tenure_years
FROM employees;
📈 Key Insights
🔹 The overall attrition rate is 50%, indicating high employee turnover
🔹 The HR department recorded 100% attrition, signaling a critical issue
🔹 Employees with low satisfaction scores (≤2) are significantly more likely to leave
🔹 Employees who left earned less on average, suggesting compensation plays a role
🔹 IT department has the highest salaries and strongest performance
🔹 Most employees leave within 1–2 years, indicating early-stage retention issues

🧠 Business Recommendations
🔹 Improve employee satisfaction through engagement programs
🔹 Review compensation structure, especially for lower-paid roles
🔹 Investigate HR department challenges and leadership issues
🔹 Strengthen onboarding and early employee experience
🔹 Focus on retaining high-performing employees

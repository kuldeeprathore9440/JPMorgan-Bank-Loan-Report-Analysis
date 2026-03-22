create database Bank_Loan_DB;
use Bank_Loan_DB;
select * from bank_loan_data;

alter table bank_loan_data
modify issue_date date;

alter table bank_loan_data
modify last_credit_pull_date date;

alter table bank_loan_data
modify last_payment_date date;

alter table bank_loan_data
modify next_payment_date date;

select count(id) as Total_Loan_Application from bank_loan_data;

select count(id) as MTD_Total_Application from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

select count(id) as PMTD_Total_Application from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

select sum(loan_amount) as Total_Funded_Amount from bank_loan_data;

select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 12 AND year(issue_date) = 2021;

select sum(loan_amount) as PMTD_Total_Funded_Amout from bank_loan_data
where month(issue_date) = 11 AND year(issue_date) = 2021;

select sum(total_payment) as Total_Amount_Recieved from bank_loan_data;

select sum(total_payment) as PMTD_Total_Amount_Recieved from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

select sum(total_payment) as MTD_Total_Amount_Recieved from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

select round(avg(int_rate), 4) * 100 as Average_Interest_Rate from bank_loan_data;

select round(avg(int_rate), 4) * 100 as MTD_Average_Interest_Rate from bank_loan_data
where month(issue_date) = 12 AND year(issue_date) = 2021;

select round(avg(int_rate), 4) * 100 as PMTD_Average_Interest_Rate from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

select round(avg(dti), 4) * 100 as Average_DTI from bank_loan_data;

select Round(avg(dti), 4) * 100 as MTD_Average_DTI from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

select Round(avg(dti), 4) * 100 as PMTD_Average_DTI from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

select
(count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100) 
/ count(id) as Good_Loan_Percentage from bank_loan_data;
     
select (count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END))
as Good_Loan_Application from bank_loan_data;
     
select sum(loan_amount) as Good_Loan_Amount from bank_loan_data
where loan_status in ("Fully Paid", "Current");

select sum(total_payment) as Good_Loan_Amout_Recieved from bank_loan_data
where loan_status in ("Fully Paid", "Current");

select
(count(case when loan_status = "Charged Off" THEN id END) * 100)
/ count(id) as Bad_Loan_Percentage
from bank_loan_data;

select
(count(case when loan_status = "Charged Off" THEN id END))
as Good_Loan_Application from bank_loan_data;

select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data 
where loan_status = "Charged Off";

select sum(total_payment) as Bad_Loan_Recieved_Amount from bank_loan_data
where loan_status = "Charged Off" ;

select loan_status as Loan_Status,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Recieved,
avg(int_rate * 100) as Interest_Rate,
avg(dti * 100) as Average_DTI
from bank_loan_data
group by loan_status
order by Total_Loan_Applications desc;

select loan_status,
sum(loan_amount) as MTD_Total_Loan_Amount,
sum(total_payment) as MTD_Total_Amount_Recieved
from bank_loan_data
where month(issue_date) = 12
group by loan_status;

select
	month(issue_date) as month_num,
    monthname(issue_date) as month_name,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by month_num, month_name
order by month_num;    

select address_state,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by address_state
order by count(id) desc;

select term,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by term
order by term;

select emp_length,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by emp_length
order by count(id) desc;

select purpose,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by purpose
order by count(id) desc;

select home_ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Reciecved
from bank_loan_data
group by home_ownership
order by count(id) desc;

select * from bank_loan_data as grid_view




















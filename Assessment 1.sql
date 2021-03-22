/*AMOUNT OWED PER COUNTRY 1*/
SELECT CUST_COUNTRY,SUM(OUTSTANDING_AMT) FROM Customer 
GROUP BY CUST_COUNTRY;

/* Total sum of outstanding_amt per customer 2*/
 SELECT CUST_NAME,sum(OUTSTANDING_AMT) FROM Customer 
 group by cust_name;
 
/* TOP 5 MOST INDEBTED CUSTOMER 3*/
SELECT CUST_NAME,SUM(OUTSTANDING_AMT) FROM Customer 
GROUP BY CUST_NAME 
ORDER BY SUM(OUTSTANDING_AMT) DESC
LIMIT 5;

/*NO OF ORDERS PER CUSTOMER 4*/
select c.cust_code, c.cust_name, COUNT(o.ord_amount)
from customer c
join orders o
on c.cust_code = o.cust_code
group by c.cust_code, c.cust_name;

/*TOTAL NO OF ORDERS after 20th july 2008 5*/
select COUNT(ord_num)
from orders
where ord_date >= '2008-07-20';

/*NO ORDERS PER MONTH 6*/
SELECT 
CASE WHEN AA.Month = 1 THEN 'JANUARY'
	 WHEN AA.Month = 2 THEN 'FEBURARY'
     WHEN AA.Month = 3 THEN 'MARCH'
     WHEN AA.Month = 4 THEN 'APRIL'
     WHEN AA.Month = 5 THEN 'MAY'
     WHEN AA.Month = 6 THEN 'JUNE'
     WHEN AA.Month = 7 THEN 'JULY'
     WHEN AA.Month = 8 THEN 'AUGUST'
     WHEN AA.Month = 9 THEN 'SEPTEMBER'
     WHEN AA.Month = 10 THEN 'OCTOBER'
     WHEN AA.Month = 11 THEN 'NOVEMBER'
     WHEN AA.Month = 12 THEN 'DECEMBER'
ELSE 'OTHER'
END AS MONTH,
AA.ORDER_COUNT
FROM
(
select month(ord_date) as Month,COUNT(*) as Order_Count
from orders
group by month(ord_date)
)AA
ORDER BY AA.MONTH;

   /* SEMSTER AVERAGE 7*/
select semister,ROUND(AVG(class_attended),2) AS SEMSTER_AVG
from studentreport
group by semister;

/* CURRENT SEMSTER AVERGAE PER STUDENT 8*/
select s.name,ROUND(AVG(sr.class_attended),2) as Student_avg_Semester
from student s
inner join studentreport sr
on s.rollid = sr.rollid
group by s.name;

/* list OF AGENTS WITH COMMISIOM PERCENTAGE BETWEEN 11% AND 14% 9*/
select agent_name,commission
from agents
where COMMISSION between 0.11 and 0.12
union 
select agent_name,commission
from agents
where COMMISSION between 0.12 and 0.14;

/* Joining daysorder and orders with same column to get distinct values 10*/
select * from orders
UNION
select * from daysorder;

/*returns all values from daysorder and orders table including duplicate values*/
select * from orders
UNION ALL
select * from daysorder;

















































































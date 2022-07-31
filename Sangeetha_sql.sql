# Question1
SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

# question 2
SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN( SELECT salesman_id FROM salesman WHERE commision = (SELECT MAX(commision) FROM salesman));

# question 3:
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city='nagpur');
     
# question 4:
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date ASC;

# question 5:
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders );

# question 6: Write a query to determine the Nth (Say N=5) highest purch_amt from
# Orders table.

select * from orders ORDER BY purch_amt desc limit 4,1;

# question 7:
# Entities are objects that are contained in Master Data Services models. Each entity contains members, which are the rows of master data that you manage.

# Relationships are the established associations between two or more tables. 
# Relationships are based on common fields from more than one table, often involving primary and foreign keys. 
# A primary key is the field (or fields) that is used to uniquely identify each record in a table.


# question 8:
Select Customer_id , ba.Account_Number,
Case when ifnull(Balance_amount,0) = 0 then   Transaction_amount else Balance_amount end  as Balance_amount
from bank_account_details ba  
inner join
bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
and Account_type = "Credit Card";


# question 9:
Select
ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba  
inner join
bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
And ( Transaction_Date between "2020-03-01" and "2020-04-30");
 


# question 10:
Select
ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba   
Left join bank_account_transaction bat
on ba.Account_Number = bat.Account_Number
And NOT (Transaction_Date between "2020-03-01" and "2020-03-31");

----------------------------------------------------------------------------------
                                   5 June 2023 
----------------------------------------------------------------------------------

CREATE TABLE Orders(orderNumber number(5) NOT NULL,paymentState VARCHAR(12),creationTime DATE,totalAmount number(5),PRIMARY KEY (orderNumber)
);
CREATE TABLE Customers(custId number(5)NOT NULL,cname VARCHAR(20),phone VARCHAR(20),PRIMARY KEY(custId));


CREATE TABLE Products(prodId number(5) NOT NULL,pname VARCHAR(20),price number(5),PRIMARY KEY(prodId));


CREATE TABLE OrderDetail(orderNumber number(5) NOT NULL,prodId number(5) NOT NULL,
			FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber),
			FOREIGN KEY(prodId) REFERENCES Products(prodId));
            
insert into Products values(101,'Watch',2000);
insert into Products values(102,'Laptop',40000);
insert into Products values(103,'Mobile',8000);
insert into Products values(104,'Teddy',1000);
insert into Products values(105,'Dress',1500);

select * from Products;

insert into Customers values(11,'Priya',9876543210);
insert into Customers values(12,'Shiva',8765432109);
insert into Customers values(13,'Lalitha',7654321098);
insert into Customers values(14,'Prem',9874563210);
insert into Customers values(15,'Vivek',98765432211);
select * from Customers;

insert into Orders values(1,'Success','2022-05-15',2000);
insert into Orders values(2,'Success','2023-01-15',40000);
insert into Orders values(3,'Failed','2022-07-11',5000);
insert into Orders values(4,'Failed','2022-09-07',6000);
insert into Orders values(5,'Success','2021-03-21',4000);
select * from Orders;



alter table Orders add custId number(5) NOT NULL;


alter table Orders add constraint fk_cust_orders FOREIGN KEY(custId) REFERENCES Customer(custId);
desc Orders;
alter table Orders drop column custId;
truncate table Orders;
drop table OrderDetail;

alter table Orders add custId number(5) NOT NULL;
alter table Orders add constraint fk_cust_orders FOREIGN KEY(custId) REFERENCES Customer(custId);
/*insert into orders table now*/
insert into Orders values(1,'Success','15-May-2015',2000,11);
insert into Orders values(2,'Success','23-Jun-2025',40000,11);
insert into Orders values(3,'Failed','12-Nov-2011',5000,12);
insert into Orders values(4,'Failed','04-Sep-2007',6000,14);
insert into Orders values(5,'Success','13-Mar-2021',4000,15);

select * from Orders;

/*Create Order Details table*/
drop table OrderDetails;
CREATE TABLE OrderDetails(orderNumber number(5) NOT NULL,prodId number(5) NOT NULL,
			FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber),
			FOREIGN KEY(prodId) REFERENCES Products(prodId));
insert into OrderDetails values(1,101);
insert into OrderDetails values(1,102);
insert into OrderDetails values(2,101);
insert into OrderDetails values(3,102);
insert into OrderDetails values(4,104);
insert into OrderDetails values(5,105);

select * from OrderDetails;

ALTER TABLE OrderDetails
	DROP  CONSTRAINT FK_OrderDetails_prodId;
-- -------
-- Natural Join
SELECT * FROM Orders NATURAL JOIN Products NATURAL JOIN Customers;
SELECT custId, orderNumber FROM Customers INNER JOIN Orders USING (custID);
SELECT c.custId,cname, orderNumber FROM Customers c INNER JOIN Orders o ON c.custId = o.custId;
SELECT c.custId,cname, orderNumber,paymentState FROM Customers c LEFT OUTER JOIN Orders o 
   ON c.custId = o.custId where c.custId=13;
  -- where paymentState='Success';
  
  /*Evaluation order
Multiple joins in a query are evaluated left-to-right in the order that you write them, 
unless you use parentheses to force a different evaluation order. */
SELECT c.custId,cname, orderNumber,paymentState FROM Customers c CROSS JOIN Orders o ;

use Data;
select m.ename "Manager" , e.ename 
from emp e join emp m
on e.mgr =m.empno;

use Data;

-- Return a list of all orders and their associated product items.
SELECT Orders.*, Products.*
FROM Orders 
JOIN OrderDetails
ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products
ON OrderDetails.prodId = Products.prodId;

-- Return the orderid of any order that includes Laptop.
SELECT o.orderNumber, p.pname
FROM Orders o
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
JOIN Products p ON od.prodId = p.prodId
WHERE p.pname = 'Laptop';

SELECT p.pname, COUNT(od.prodId) AS orderCount
FROM Products p
JOIN OrderDetails od ON p.prodId = od.prodId
GROUP BY p.pname
ORDER BY p.pname ASC;

SELECT DISTINCT c.cname AS "Customers who like Laptop"
FROM Customer AS c JOIN Orders as o
ON c.custId = o.custId
JOIN OrderDetail AS od
ON o.orderNumber = od.orderNumber
JOIN Products AS p
ON od.prodId = p.prodId
WHERE p.pname = 'Laptop';
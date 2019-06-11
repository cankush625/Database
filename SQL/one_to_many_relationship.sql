use one_to_many;
select database();

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

/*Using foreign key*/
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

select * from customers;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

select * from orders;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98); /*this fails because there is no user with id 98*/

/*Using cross join*/
/*select orders placed by Boy George*/
/*Using subquery*/
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );

/*Using cross join*/
select * from customers, orders; /*this is almost useless because it takes every customer
								  and combines it with the every order*/
                                  
/*Using inner join*/
-- implicit inner join
select * from customers, orders where customers.id = orders.customer_id;
select first_name, last_name, order_date, amount from customers, orders where customers.id = orders.customer_id;

-- explicit inner join /*Always do this - very important*/
select * from customers join orders on customers.id = customer_id;
select first_name, last_name, order_date, amount from customers join orders on customers.id = customer_id;
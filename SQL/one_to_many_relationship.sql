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
    on delete cascade
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
select first_name, last_name, order_date, amount from customers join orders on customers.id = orders.customer_id;

/*We can also do inner join using keyword inner join*/
select first_name, last_name, order_date, amount from customers inner join orders on customers.id = orders.customer_id;

/*using inner join with group by and order by*/
select first_name, last_name, order_date, sum(amount) as total_spent from customers join orders on customers.id = orders.customer_id group by orders.customer_id order by total_spent;

/*Left join*/
/*Left join takes all(everything) the records from the left side table and if the match is there in right side table then shows that data else shows null*/
select * from customers left join orders on customers.id = orders.customer_id;
select first_name, last_name, sum(amount) from customers left join orders on customers.id = orders.customer_id group by orders.customer_id;

/*Replace null value by 0*/
select first_name, last_name, ifnull(sum(amount), 0) total_spent from customers left join orders on customers.id = orders.customer_id group by orders.customer_id;

/*Right join*/
/*the result we get is same as that of the inner join*/
select * from customers right join orders on customers.id = orders.customer_id;

/*We are unable to delete parent row beacause of the parent key*/
delete from customers where first_name = 'Boy';

-- Note
/*By removing the foreign key we can still join all the tables by exactly same commands that we are used for data with foreign key constraint*/

drop table orders, customers;
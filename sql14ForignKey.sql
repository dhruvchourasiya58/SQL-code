drop database if exists foreigndb;
create database foreigndb;

use foreigndb;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- FOREIGN KEY
    product_id INT,
    quantity INT,
    
    constraint customer_id_fk foreign key ( CUSTOMER_ID ) REFERENCES CUSTOMERS ( CUSTOMER_ID )
);

INSERT INTO orders
VALUES
(1,101,1,2);

INSERT INTO orders
VALUES
(2,999,1,1);

INSERT INTO CUSTOMERS
VALUES
(108,"RAJA");





-- we do join. [Wrong name]
SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id=c.customer_id;

SELECT *
FROM orders o
LEFT JOIN PRODUCTS P
ON o.product_id= p.product_id;



INSERT INTO orders
VALUES
(3,101,500,1);

-- wrong can't order if the product is not listed
SELECT *
FROM orders o
LEFT JOIN products p
ON o.product_id=p.product_id;

SELECT * FROM CUSTOMERS;


-- ----------- $$$$$$$$ ------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);


-- forign key syntax

/* CREATE TABLE child_table (
		column1 data_type,
        column2 data_type,
        ...
        CONSTRAINT fk_name FORIGN KEY
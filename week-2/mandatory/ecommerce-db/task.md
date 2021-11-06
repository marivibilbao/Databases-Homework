# E-Commerce Database

In this homework, you are going to work with an ecommerce database. In this database, you have `products` that `consumers` can buy from different `suppliers`. Customers can create an `order` and several products can be added in one order.

## Submission

Below you will find a set of tasks for you to complete to set up a databases of students and mentors.

To submit this homework write the correct commands for each question here:

```sql


```

When you have finished all of the questions - open a pull request with your answers to the `Databases-Homework` repository.

## Setup

To prepare your environment for this homework, open a terminal and create a new database called `cyf_ecommerce`:

```sql
createdb cyf_ecommerce
```
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
<!-- Se crea la base de datos: -->
CREATE DATABASE cyf_ecommerce;
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

Import the file [`cyf_ecommerce.sql`](./cyf_ecommerce.sql) in your newly created database:

```sql
psql -d cyf_ecommerce -f cyf_ecommerce.sql
```
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
<!-- Se ejecuta el siguiente comando: -->
Primero se debe ir a la ruta donde se encuentra el archivo .sql
psql -U postgres -d cyf_ecommerce -f cyf_ecommerce.sql
psql -U postgres cyf_ecommerce
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

Open the file `cyf_ecommerce.sql` in VSCode and make sure you understand all the SQL code. Take a piece of paper and draw the database with the different relations between tables. Identify the foreign keys and make sure you understand the full database schema.

## Task

Once you understand the database that you are going to work with, solve the following challenge by writing SQL queries using everything you learned about SQL:
<!-- ------------------------------------------------------------------------------------------------------------------------- -->
1. Retrieve all the customers names and addresses who lives in United States
SELECT name, address FROM customers WHERE country = 'United States';
     name     |          address
--------------+----------------------------
 Amber Tran   | 6967 Ac Road
 Edan Higgins | Ap #840-3255 Tincidunt St.
(2 filas)


2. Retrieve all the customers ordered by ascending name
SELECT * FROM customers order by name;
 id |        name        |           address           |       city       |    country  
----+--------------------+-----------------------------+------------------+----------------
  4 | Amber Tran         | 6967 Ac Road                | Villafranca Asti | United States
  3 | Britanney Kirkland | P.O. Box 577, 5601 Sem, St. | Little Rock      | United Kingdom
  5 | Edan Higgins       | Ap #840-3255 Tincidunt St.  | Arles            | United States
  1 | Guy Crawford       | 770-2839 Ligula Road        | Paris            | France
  2 | Hope Crosby        | P.O. Box 276, 4976 Sit Rd.  | Steyr            | United Kingdom
  6 | Quintessa Austin   | 597-2737 Nunc Rd.           | Saint-Marc       | United Kingdom
(6 filas)


3. Retrieve all the products which cost more than 100
SELECT * FROM products WHERE unit_price > 100;
 id |  product_name  | unit_price | supplier_id
----+----------------+------------+-------------
  4 | Mobile Phone X |        299 |           1
  5 | Mobile Phone X |        249 |           4
(2 filas)


4. Retrieve all the products whose name contains the word `socks`





5. Retrieve the 5 most expensive products


6. Retrieve all the products with their corresponding suppliers. The result should only contain the columns `product_name`, `unit_price` and `supplier_name`


7. Retrieve all the products sold by suppliers based in the United Kingdom. The result should only contain the columns `product_name` and `supplier_name`.


8. Retrieve all orders from customer ID `1`


9. Retrieve all orders from customer named `Hope Crosby`


10. Retrieve all the products in the order `ORD006`. The result should only contain the columns `product_name`, `unit_price` and `quantity`.


11. Retrieve all the products with their supplier for all orders of all customers. The result should only contain the columns `name` (from customer), `order_reference` `order_date`, `product_name`, `supplier_name` and `quantity`.


12. Retrieve the names of all customers who bought a product from a supplier from China.


<!-- ------------------------------------------------------------------------------------------------------------------------- -->
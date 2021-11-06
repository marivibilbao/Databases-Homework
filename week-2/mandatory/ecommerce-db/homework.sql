-- Se crea la base de datos:
CREATE DATABASE cyf_ecommerce;

-- Se ejecuta el siguiente comando:
-- Primero se debe ir a la ruta donde se encuentra el archivo .sql
psql -U postgres -d cyf_ecommerce -f cyf_ecommerce.sql
psql -U postgres cyf_ecommerce

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
SELECT * FROM products WHERE product_name LIKE '%socks%';
 id |   product_name   | unit_price | supplier_id
----+------------------+------------+-------------
  6 | Super warm socks |         10 |           1
  7 | Super warm socks |          5 |           2
  8 | Super warm socks |          8 |           3
  9 | Super warm socks |         10 |           4
(4 filas)


5. Retrieve the 5 most expensive products
SELECT * FROM products ORDER BY unit_price DESC LIMIT 5;
 id |  product_name   | unit_price | supplier_id
----+-----------------+------------+-------------
  4 | Mobile Phone X  |        299 |           1
  5 | Mobile Phone X  |        249 |           4
 17 | Javascript Book |         41 |           2
 15 | Javascript Book |         40 |           1
 16 | Javascript Book |         39 |           3
(5 filas)


6. Retrieve all the products with their corresponding suppliers. The result should only contain the columns `product_name`, `unit_price` and `supplier_name`


7. Retrieve all the products sold by suppliers based in the United Kingdom. The result should only contain the columns `product_name` and `supplier_name`.


8. Retrieve all orders from customer ID `1`


9. Retrieve all orders from customer named `Hope Crosby`


10. Retrieve all the products in the order `ORD006`. The result should only contain the columns `product_name`, `unit_price` and `quantity`.


11. Retrieve all the products with their supplier for all orders of all customers. The result should only contain the columns `name` (from customer), `order_reference` `order_date`, `product_name`, `supplier_name` and `quantity`.


12. Retrieve the names of all customers who bought a product from a supplier from China.





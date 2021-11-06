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
SELECT product_name, unit_price, supplier_name FROM products
LEFT JOIN suppliers ON supplier_id=products.supplier_id; 
 product_name       | unit_price | supplier_name
-------------------------+------------+---------------
 Tee Shirt Olympic Games |         20 | Amazon
 Tee Shirt Olympic Games |         20 | Taobao
 Tee Shirt Olympic Games |         20 | Argos
 Tee Shirt Olympic Games |         20 | Sainsburys
 Tee Shirt Olympic Games |         18 | Amazon
 Tee Shirt Olympic Games |         18 | Taobao
 Tee Shirt Olympic Games |         18 | Argos
 Tee Shirt Olympic Games |         18 | Sainsburys
 Tee Shirt Olympic Games |         21 | Amazon
 Tee Shirt Olympic Games |         21 | Taobao
 Tee Shirt Olympic Games |         21 | Argos
 Tee Shirt Olympic Games |         21 | Sainsburys
 Mobile Phone X          |        299 | Amazon
 Mobile Phone X          |        299 | Taobao
 Mobile Phone X          |        299 | Argos
 Mobile Phone X          |        299 | Sainsburys
 Mobile Phone X          |        249 | Amazon
 Mobile Phone X          |        249 | Taobao
 Mobile Phone X          |        249 | Argos
 Mobile Phone X          |        249 | Sainsburys
 Super warm socks        |         10 | Amazon
 Super warm socks        |         10 | Taobao
 Super warm socks        |         10 | Argos
 Super warm socks        |         10 | Sainsburys
 Super warm socks        |          5 | Amazon
 Super warm socks        |          5 | Taobao
 Super warm socks        |          5 | Argos
-- Más  --


7. Retrieve all the products sold by suppliers based in the United Kingdom. The result should only contain the columns `product_name` and `supplier_name`.
SELECT product_name, supplier_name FROM products 
JOIN suppliers ON suppliers.id= products.supplier_id  
WHERE suppliers.country = 'United Kingdom'; 
 product_name       | supplier_name
-------------------------+---------------
 Tee Shirt Olympic Games | Argos
 Mobile Phone X          | Sainsburys
 Super warm socks        | Argos
 Super warm socks        | Sainsburys
 Le Petit Prince         | Sainsburys
 Ball                    | Sainsburys
 Javascript Book         | Argos
 Coffee Cup              | Argos
 Coffee Cup              | Sainsburys
(9 filas)


8. Retrieve all orders from customer ID `1`
SELECT * FROM orders WHERE customer_id = 1;
 id | order_date | order_reference | customer_id
----+------------+-----------------+-------------
  1 | 2019-06-01 | ORD001          |           1
  2 | 2019-07-15 | ORD002          |           1
  3 | 2019-07-11 | ORD003          |           1
(3 filas)


9. Retrieve all orders from customer named `Hope Crosby`


10. Retrieve all the products in the order `ORD006`. The result should only contain the columns `product_name`, `unit_price` and `quantity`.


11. Retrieve all the products with their supplier for all orders of all customers. The result should only contain the columns `name` (from customer), `order_reference` `order_date`, `product_name`, `supplier_name` and `quantity`.


12. Retrieve the names of all customers who bought a product from a supplier from China.





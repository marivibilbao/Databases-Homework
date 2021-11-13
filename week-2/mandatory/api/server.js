const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");
const app = express();

const corsOptions = {
  origin: "http://localhost:3000",
};
app.use(cors(corsOptions));

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cyf_ecommerce",
  password: "123456",
  port: 5432,
});
// En donde dice password si se coloca, te carga correctamente los datos de la base de datos.

app.use(express.json());

app.get("/customers", function (req, res) {
  pool.query("SELECT * FROM customers", (error, result) => {
    res.status(200).json(result.rows);
  });
});

app.get("/suppliers", function (req, res) {
  pool.query("SELECT * FROM suppliers", (error, result) => {
    res.status(200).json(result.rows);
  });
});

app.get("/orders", function (req, res) {
  pool.query("SELECT * FROM orders", (error, result) => {
    res.status(200).json(result.rows);
  });
});

//-- Week 3 GET --- /products
app.get("/products", function (req, res) {
  pool.query(
    "SELECT p.*, supplier_name FROM products p JOIN suppliers s ON p.supplier_id = s.id",
    (error, result) => {
      res.status(200).json(result.rows);
    }
  );
});

//-- Week 3 GET --- /products
app.get('/products', function (req, res) {
  let { name } = req.query
  const selectProdByName = `SELECT p.*, supplier_name 
    FROM products p JOIN suppliers s ON p.supplier_id = s.id
    WHERE p.product_name = $1`;
  const selectAllProducts = `SELECT * FROM products`;

  pool.connect((err, client, release) => {
      if (err) {
          res.status(500).send('Error acquiring client')
      }
      let query;
      let value;
      if (name) {
          query = selectProdByName;
          value = [name];
      } else {
          query = selectAllProducts;
          value = [];
      }
      client.query(query, value, (err, result) => {
          release();
          if (err) {
              res.status(500).send(err.stack)
          } else if (result.rowCount > 0) {
              res.status(200).json(result.rows)
          } else {
              res.status(404).send(`Row not found`)
          }
      });
  });
});


//-- Week 3: GET --- /customers/:customerId
app.get("/customers/:customerId", function (req, res) {
  const customerId = req.params.customerId;

  pool
    .query("SELECT * FROM customers WHERE id=$1", [customerId])
    .then((result) => res.json(result.rows))
    .catch((e) => console.error(e));
});

//-- Week 3: POST --- /customers
app.post("/customers", function (req, res) {
  const newCustomerName = req.body.name;
  const newCustomerAddress = req.body.address;
  const newCustomerCity = req.body.city;
  const newCustomerCountry = req.body.country;

pool
  .query("SELECT * FROM customers WHERE name=$1", [newCustomerName])
  .then((result) => {
    if (result.rows.length > 0) {
      return res
        .status(400)
        .send("A customers with the same name already exists!");
    } else {
      const query =
      "INSERT INTO customers (name, address, city, country) VALUES ($1, $2, $3, $4)";
      pool
        .query(query, [newCustomerName, newCustomerAddress, newCustomerCity, newCustomerCountry])
        .then(() => res.send("Customer created!"))
        .catch((e) => console.error(e));
    }
  });
});

//-- Week 3: POST --- /products
app.post('/products', function (req, res) {
  let { product_name, unit_price, supplier_id } = req.body
  let values = [product_name, unit_price, supplier_id]
  const selectSupplier = `SELECT * FROM suppliers WHERE id = $1`
  const createProduct = `INSERT INTO products (product_name, unit_price, supplier_id) VALUES ($1, $2, $3)`;

  pool.connect((err, client, release) => {
      if (err) {
          return res.send('Error acquiring client')
      }
      client.query(selectSupplier, [supplier_id], (err, result) => {
          if (err) {
              return res.status(500).send(err.message)
          }
          if (result.rowCount < 1) {
              return res.send('The supplier does not exist yet, please insert new supplier')
          }
          if (Number(unit_price) === NaN) {
              return res.send('Unit price Must be a integer')
          }
          client.query(createProduct, values, (err, result) => {
              release
              if (err) {
                  res.send('Error excecuting query')
              }
              console.log(result.rows)
              res.status(201).send(`Product was created`)
          });
      });
  });
});

//-- Week 3: POST --- /customers/:customerId/orders
app.post('/customers/:customerId/orders', function (req, res) {
  let customer_id = parseInt(req.params.customerId)
  let { order_date, order_reference } = req.body
  let values = [order_date, order_reference, customer_id]
  const selectCustomerById = `SELECT * FROM customers WHERE id = $1`;
  const createOrder = `INSERT INTO orders (order_date, order_reference, customer_id) VALUES ($1, $2, $3)`;

  if (!order_date || !order_reference || !customer_id) {
      return res.send('Order is invalid')
  }
  pool.connect((err, client, release) => {
      if (err) {
          res.send('Error acquiring client')
      };
      client.query(selectCustomerById, [customer_id], (err, result) => {
          if (result.rowCount < 1) {
              res.send('This customer does not exists.')
          } else {
              client.query(createOrder, values, (err, result) => {
                  release
                  if (err) {
                      res.status(500).send(err.message)
                  }
                  res.status(201).send(`The order was realized, please check your email.`)
              });
          };
      });
  });
});


//-- Week 3: PUT --- /customers/:customerId (name, address, city and country).
app.put('/customers/:customerId', function (req, res) {
  let customer_id = parseInt(req.params.customerId)
  let { name, address, city, country } = req.body
  let values = [name, address, city, country, customer_id]
  const selectCustomerById = `SELECT * FROM customers WHERE id = $1`;
  const updateCustomer = `UPDATE customers SET name = $1, address = $2, city = $3, country = $4 WHERE id = $5`;

  pool.connect((err, client, release) => {
      if (err) {
          res.send('Error acquiring client')
      }
      client.query(selectCustomerById, [customer_id], (err, result) => {
          if (err) {
              res.send('Error excecuting query.')
          } 
          if (result.rowCount < 1) {
              res.send('The customer with this id does not exist.')
          }
          client.query(updateCustomer, values, (err, result) => {
              res.status(201).send('The customer was updated.')
          });
      });
  });
});

//-- Week 3: DELETE --- /orders/:orderId 
app.delete('/orders/:orderId', function (req, res) {
  let order_id = parseInt(req.params.orderId)
  const deleteOrder = `DELETE FROM orders WHERE id = $1 RETURNING *`;
  const deleteOrderItems = `DELETE FROM order_items WHERE order_id = $1 RETURNING *`;

  pool.connect((err, client, release) => {
      if (err) {
          res.send('Error acquiring client')
      }
      client.query(deleteOrderItems, [order_id], (err, result) => {
          if (err) {
              res.send('Error excecuting query.')
          }
          if (result.rowCount > 0) {
              client.query(deleteOrder, [order_id], (err, result) => {
                  release;
                  if (result.rowCount > 0) {
                      res.status(201).send(`Deleted lines:${result.rowCount}.`)
                  }
              });
          };
      });
  });
});

//-- Week 3: DELETE --- /customers/:customerId
app.delete('/customers/:customerId', async (req, res) => {
  const customerId = parseInt(req.params.customerId)
  const selectCustomerOrders = 'SELECT * FROM orders WHERE customer_id = $1';
  const deleteCustomer = `DELETE FROM customers WHERE id = $1 RETURNING *`;

  pool.connect((err, client, release) => {
      if (err) {
          res.send('Error acquiring client')
      }
      if (customerId > 0) {
          client.query(selectCustomerOrders, [customerId], (err, result) => {
              if (result.rowCount === 0) {
                  client.query(deleteCustomer, [customerId], (err, result) => {
                      release;
                      if (err) {
                          res.send('Error excecuting query')
                      };
                      if (result.rowCount > 0) {
                          res.status(200)
                              .send(`${result.rowCount} customer was deleted`)
                      };
                  });
              } else {
                  return res.send('Not possible to delete the customer. This customer has already orders')
              };
          });
      };
  });
});

//-- Week 3: GET --- /customers/:customerId/orders
app.get('/customers/:customerId/orders', (req, res) => {
  const customerId = parseInt(req.params.customerId)
  const selectCustomerById = `SELECT * FROM customers WHERE id = $1`;
  const selectOrderDetailofCustomer = `SELECT order_reference, order_date, product_name,
    unit_price, supplier_name, quantity
    FROM order_items oi JOIN orders o ON oi.order_id = o.id
    JOIN customers c ON o.customer_id = c.id
    JOIN products p ON oi.product_id = p.id
    JOIN suppliers s ON p.supplier_id = s.id WHERE c.id = $1;`;

  if (customerId > 0) {
      pool.connect((err, client, release) => {
          if (err) {
              res.send('Error acquiring client')
          }
          client.query(selectCustomerById, [customerId], (err, result) => {
              if (result.rowCount < 1) {
                  res.send('This customer does not exists')
              } else {
                  client.query(selectOrderDetailofCustomer, [customerId], (err, result) => {
                      release
                      if (err) {
                          res.status(500).send(err.message)
                      }
                      if (result.rowCount < 1) {
                          return res.status(404).send('This customer doesnt have any orders')
                      }
                      res.status(201).send(result.rows)
                  });
              };
          });
      });
  };
});

const port = 3000;
app.listen(port, () => console.log(`Server is running on PORT ${port}`));

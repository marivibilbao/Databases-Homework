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

//-- Week 3 GET --- /products
app.get("/products", function (req, res) {
  pool.query(
    "SELECT p.*, supplier_name FROM products p JOIN suppliers s ON p.supplier_id = s.id",
    (error, result) => {
      res.status(200).json(result.rows);
    }
  );
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

///REVISAR
//-- Week 3: PUT --- /customers/:customerId (name, address, city and country).
app.put("/customers/:customerId", function (req, res) {
  const customerId = req.params.customerId;
  const newName = req.body.name;
  const newAddress = req.body.address;
  const newCity = req.body.city;
  const newCountry = req.body.country;

  pool
    .query("PUT customers SET name=$1, address=$2, city=$3, country=$4 WHERE id=$5", [newName, newAddress, newCity, newCountry, customerId])
    .then(() => res.send(`Customer ${customerId} updated!`))
    .catch((e) => console.error(e));
});








const port = 3000;
app.listen(port, () => console.log(`Server is running on PORT ${port}`));

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
  password: "newPassword",
  port: 5432,
});

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

app.get("/products", function (req, res) {
  pool.query(
    "SELECT p.*, supplier_name FROM products p JOIN suppliers s ON p.supplier_id = s.id",
    (error, result) => {
      res.status(200).json(result.rows);
    }
  );
});

const port = 3000;
app.listen(port, () => console.log(`Server is running on PORT ${port}`));

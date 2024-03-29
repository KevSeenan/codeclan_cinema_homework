DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT,
  film_id INT
);

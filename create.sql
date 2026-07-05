CREATE DATABASE IF NOT EXISTS lab_mysql;

USE lab_mysql;

DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS salespersons;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
    VIN CHAR(17) PRIMARY KEY,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR,
    colour_of_car VARCHAR(30)
);

CREATE TABLE customers (
    customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(30),
    postal_code VARCHAR(30)
);

CREATE TABLE salespersons (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    store_name VARCHAR(50) NOT NULL,
    store_id INT
);

CREATE TABLE invoices (
    invoice_number INT AUTO_INCREMENT PRIMARY KEY,
    invoice_date DATE NOT NULL,
    VIN CHAR(17) NOT NULL,
    customer_ID INT NOT NULL,
    staff_id INT NOT NULL,

    CONSTRAINT fk_invoice_car
        FOREIGN KEY (VIN) REFERENCES cars(VIN),

    CONSTRAINT fk_invoice_customer
        FOREIGN KEY (customer_ID) REFERENCES customers(customer_ID),

    CONSTRAINT fk_invoice_salesperson
        FOREIGN KEY (staff_id) REFERENCES salespersons(staff_id)
);
CREATE DATABASE car_sales;

USE car_sales;

CREATE TABLE car_sales.car(
	VIN CHAR(17),
    manufacturer VARCHAR (50),
    model VARCHAR (50),
    year YEAR,
    colour_of_Car VARCHAR (30)
    );
    
CREATE TABLE car_sales.Customers (
	customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    phone_number VARCHAR (50),
    email VARCHAR (100),
    address VARCHAR (100),
    city VARCHAR (50),
    state VARCHAR (50),
    country VARCHAR (30),
    postal_code VARCHAR (30)
    );
    
CREATE TABLE car_sales.salespersons(
	staff_id INT auto_increment PRIMARY KEY,
	first_name VARCHAR (50),
    last_name VARCHAR (50),
    store_name VARCHAR (50),
    store_id INT
    );

ALTER TABLE car_sales.car
ADD PRIMARY KEY (VIN);

ALTER TABLE car RENAME TO cars;

CREATE TABLE car_sales.invoices (
    invoice_number INT AUTO_INCREMENT PRIMARY KEY,
    invoice_date DATE,
    VIN CHAR(17),
    customer_ID INT,
    staff_id INT
);

ALTER TABLE car_sales.cars
ADD car_id INT AUTO_INCREMENT UNIQUE FIRST;


ALTER TABLE car_sales.invoices
MODIFY invoice_date DATE NOT NULL,
MODIFY VIN CHAR(17) NOT NULL,
MODIFY customer_ID INT NOT NULL,
MODIFY staff_id INT NOT NULL;

ALTER TABLE car_sales.invoices
ADD CONSTRAINT fk_invoice_car
FOREIGN KEY (VIN)
REFERENCES car_sales.cars(VIN);

ALTER TABLE car_sales.invoices
ADD CONSTRAINT fk_invoice_customer
FOREIGN KEY (customer_ID)
REFERENCES car_sales.Customers(customer_ID);

ALTER TABLE car_sales.invoices
ADD CONSTRAINT fk_invoice_salesperson
FOREIGN KEY (staff_id)
REFERENCES car_sales.salespersons(staff_id);
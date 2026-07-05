USE lab_mysql;

-- The duplicate VIN (DAM41UDN3CHU2WVF6) was not inserted because VIN is the primary key and must be unique.
INSERT INTO cars
(VIN, manufacturer, model, year, colour_of_car)
VALUES
('3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray');

INSERT INTO customers
(first_name,last_name,phone_number,email,address,city,state,country,postal_code)
VALUES
('Pablo','Picasso','+34 636 17 63 82',NULL,'Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045'),
('Abraham','Lincoln','+1 305 907 7086',NULL,'120 SW 8th St','Miami','Florida','United States','33130'),
('Napoléon','Bonaparte','+33 1 79 75 40 00',NULL,'40 Rue du Colisée','Paris','Île-de-France','France','75008');

INSERT INTO salespersons
(first_name,last_name,store_name,store_id)
VALUES
('Petey','Cruiser','Madrid',1),
('Anna','Sthesia','Barcelona',2),
('Paul','Molive','Berlin',3),
('Gail','Forcewind','Paris',4),
('Paige','Turner','Mimia',5),
('Bob','Frapples','Mexico City',6),
('Walter','Melon','Amsterdam',7),
('Shonda','Leer','São Paulo',8);

INSERT INTO invoices
(invoice_date, VIN, customer_ID, staff_id)
VALUES
('2018-08-22', '3K096I98581DHSNUP', 1, 3),
('2018-12-31', 'RKXVNNIHLVVZOUB4M', 3, 5),
('2019-01-22', 'ZM8G7BEUQZ97IH46V', 2, 7);

UPDATE customers
SET email = 'ppicasso@gmail.com'
WHERE first_name = 'Pablo'
AND last_name = 'Picasso';

UPDATE customers
SET email = 'lincoln@us.gov'
WHERE first_name = 'Abraham'
AND last_name = 'Lincoln';

UPDATE customers
SET email = 'hello@napoleon.me'
WHERE first_name = 'Napoléon'
AND last_name = 'Bonaparte';

SET SQL_SAFE_UPDATES = 0;
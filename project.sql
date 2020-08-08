-- Create Salesperson table

CREATE TABLE salesperson(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(15),
	email VARCHAR(200)
);

--Create customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(200),
	phone VARCHAR(15),
	email VARCHAR(200)
);

-- Create Cars table
CREATE TABLE cars(
	serial_id INTEGER PRIMARY KEY,
	make VARCHAR(50),
	model VARCHAR(50),
	staff_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- Create Sales Invoice Table
CREATE TABLE sales_invoice(
	sales_id SERIAL PRIMARY KEY,
	amount NUMERIC(9,2),
	purchase_date DATE,
	serial_id INTEGER NOT NULL,
	staff_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(serial_id) REFERENCES cars(serial_id),
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- Create mechanic table
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(200),
	phone VARCHAR(15),
	email VARCHAR(200)
);
-- Create service invoice table
CREATE TABLE service_invoice(
	service_id SERIAL PRIMARY KEY,
	order_date DATE,
	amount NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	description VARCHAR(500),
	customer_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

--Creat mechanic record table
CREATE TABLE mechanic_record(
	record_id SERIAL PRIMARY KEY,
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);
-- Create Parts table
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	part_type VARCHAR(100),
	part_price NUMERIC(6,2),
	service_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id)
);

--INSERT into salesperson
INSERT INTO salesperson(
	staff_id,
	first_name,
	last_name,
	phone,
	email
)
VALUES(
	1,
	'Robert',
	'Mann',
	'574-555-9087',
	'rmann@luckymotors.com'
);
INSERT INTO salesperson(
	staff_id,
	first_name,
	last_name,
	phone,
	email
)
VALUES(
	2,
	'Nate',
	'Welter',
	'312-555-3219',
	'ndubya@luckymotors.com'
);
INSERT INTO salesperson(
	staff_id,
	first_name,
	last_name,
	phone,
	email
)
VALUES(
	3,
	'Sam',
	'Schnell',
	'260-555-2719',
	'ss@luckymotors.com'
);

-- INSERT into customer table
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	1,
	'Donny',
	'Draper',
	'675 E Fake St, Chicago, IL 60611',
	'407-555-9000',
	'donnyd@gmail.com'
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	2,
	'Ric',
	'Flair',
	'1335 N Lincoln St, Bloomington, IN 47401',
	'312-555-8732',
	'ricflair@thenatureboy.com'
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	3,
	'Spencer',
	'Darr',
	'457 N Wells St, Chicago, IL 60611',
	'407-555-6789',
	'spennydarr@gmail.com'
);

-- INSERT into cars table (CHANGED PROPERTY OF FOREIGN KEYS TO ALLOW THEM TO BE NULLABLE FOR UNSOLD INVENTORY)
INSERT INTO cars(
	serial_id,
	make,
	model,
	staff_id,
	customer_id
)
VALUES(
	1,
	'Subaru',
	'WRX',
	1,
	2
);
INSERT INTO cars(
	serial_id,
	make,
	model,
	staff_id,
	customer_id
)
VALUES(
	2,
	'BMW',
	'M240i',
	1,
	1
);
INSERT INTO cars(
	serial_id,
	make,
	model
)
VALUES(
	3,
	'Honda',
	'Civic'
);
INSERT INTO cars(
	serial_id,
	make,
	model,
	customer_id
)
VALUES(
	4,
	'Lamborghini',
	'Countach',
	3
);
-- Insert into sales invoice
INSERT INTO sales_invoice(
	sales_id,
	amount,
	purchase_date,
	customer_id,
	serial_id,
	staff_id
)
VALUES(
	1,
	50000,
	'08/07/2020',
	2,
	1,
	1
);
INSERT INTO sales_invoice(
	sales_id,
	amount,
	purchase_date,
	customer_id,
	serial_id,
	staff_id
)
VALUES(
	2,
	65000,
	'08/05/2020',
	1,
	2,
	1
);
--Insert into mechanic
INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	address,
	phone,
	email	
)
VALUES(
	1,
	'Billy',
	'Jones',
	'123 Real St, Boise, Idaho 12312',
	'360-555-9090',
	'billyb@luckymotors.com'
);
INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	address,
	phone,
	email	
)
VALUES(
	2,
	'Jason',
	'Rutledge',
	'123 Fake St, Topeka, KS 12312',
	'360-555-9190',
	'jr@luckymotors.com'
);
-- Insert into service invoice
INSERT INTO service_invoice(
	service_id,
	order_date,
	amount,
	total_cost,
	description,
	customer_id,
	mechanic_id	
)
VALUES(
	1,
	'08/08/2020',
	200,
	210.50,
	'Oil change, tire rotation, and all-points inspection',
	3,
	2
);

-- Insert Into mechanic record
INSERT INTO mechanic_record(
	record_id,
	service_id,
	mechanic_id
)
VALUES(
	1,
	1,
	2
);

--Insert into parts
INSERT INTO parts(
	parts_id,
	part_type,
	part_price
)
VALUES(
	1,
	'CAT converter',
	500
);
INSERT INTO parts(
	parts_id,
	part_type,
	part_price
)
VALUES(
	2,
	'Spark plug',
	15
);
INSERT INTO parts(
	parts_id,
	part_type,
	part_price,
	service_id
)
VALUES(
	3,
	'Luxury car oil',
	100,
	1
);
SELECT *
FROM parts;
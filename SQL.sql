CREATE TABLE assistant(
	assistant_id SERIAL PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL,
	position VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE,
	salary NUMERIC(10,2)
);

SELECT * FROM assistant;
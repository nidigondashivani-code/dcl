CREATE DATABASE if not exists company_db;
USE company_db;

CREATE TABLE if not exists employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

# INSERT INTO employees VALUES
# (1, 'Rahul', 'HR', 40000),
# (2, 'Anjali', 'IT', 50000);

# CREATE USER 'staff_user'@'localhost' IDENTIFIED BY 'staff123';

GRANT SELECT ON company_db.employees TO 'staff_user'@'localhost';

SHOW GRANTS FOR 'staff_user'@'localhost';

GRANT USAGE ON *.* TO 'staff_user'@'localhost'
GRANT SELECT ON `company_db`.`employees`
TO 'staff_user'@'localhost'

INSERT INTO employees VALUES
(3, 'Kiran', 'Finance', 45000);


GRANT INSERT ON company_db.employees
TO 'staff_user'@'localhost';

INSERT INTO employees VALUES
(3, 'Kiran', 'Finance', 45000);

SELECT * FROM employees;

REVOKE INSERT ON company_db.employees
FROM 'staff_user'@'localhost';

SHOW GRANTS FOR 'staff_user'@'localhost';

CREATE TABLE if not exists bank_account (
    acc_no INT PRIMARY KEY,
    customer_name VARCHAR(50),
    balance INT
);

INSERT INTO bank_account VALUES
(101, 'Shivani', 10000);

SELECT * FROM bank_account;

START TRANSACTION;

UPDATE bank_account
SET balance = balance - 2000
WHERE acc_no = 101;

SELECT * FROM bank_account
WHERE acc_no = 101;

ROLLBACK;

SELECT * FROM bank_account
WHERE acc_no = 101;

START TRANSACTION;

UPDATE bank_account
SET balance = balance - 2000
WHERE acc_no = 101;

SELECT * FROM bank_account
WHERE acc_no = 101;

COMMIT;

SELECT * FROM bank_account
WHERE acc_no = 101;
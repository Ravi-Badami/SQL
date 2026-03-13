DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
                           emp_id      INT,
                           first_name  VARCHAR(50),
                           last_name   VARCHAR(50),
                           department  VARCHAR(50),
                           salary      INT,
                           hire_date   DATE,
                           city        VARCHAR(50),
                           age         INT,
                           email       VARCHAR(100),
                           phone       VARCHAR(15),
                           manager_id  INT,
                           status      VARCHAR(10)
);

INSERT INTO employees VALUES (101, 'Ravi',      'Kumar',   'Sales',     55000, '2019-03-15', 'Mumbai',    30, 'ravi.kumar@gmail.com',       '9876543210', 201, 'Active');
INSERT INTO employees VALUES (102, 'Anita',     'Sharma',  'HR',        48000, '2020-07-22', 'Delhi',     27, 'anita.sharma@yahoo.com',     '9823456789', 202, 'Active');
INSERT INTO employees VALUES (103, 'Suresh',    'Nair',    'IT',        72000, '2018-11-10', 'Bengaluru', 34, 'suresh.nair@company.com',    NULL,         203, 'Active');
INSERT INTO employees VALUES (104, 'Priya',     'Reddy',   'Finance',   61000, '2021-01-05', 'Hyderabad', 29, 'priya.reddy@gmail.com',      '9745678901', 201, 'Active');
INSERT INTO employees VALUES (105, 'Karan',     'Mehta',   'IT',        85000, '2017-06-18', 'Bengaluru', 36, 'karan.mehta@company.com',    '9667890123', 203, 'Active');
INSERT INTO employees VALUES (106, 'Deepa',     'Iyer',    'Sales',     42000, '2022-04-11', 'Chennai',   24, NULL,                         '9589012345', 201, 'Active');
INSERT INTO employees VALUES (107, 'Amit',      'Joshi',   'HR',        53000, '2019-09-30', 'Pune',      31, 'amit.joshi@yahoo.com',       NULL,         202, 'Inactive');
INSERT INTO employees VALUES (108, 'Neha',      'Gupta',   'Marketing', 67000, '2020-02-14', 'Mumbai',    28, 'neha.gupta@gmail.com',       '9401234567', 204, 'Active');
INSERT INTO employees VALUES (109, 'Rajesh',    'Pillai',  'Finance',   74000, '2016-12-01', 'Kochi',     38, 'rajesh.pillai@company.com',  '9312345678', 201, 'Active');
INSERT INTO employees VALUES (110, 'Sonal',     'Verma',   'Marketing', 58000, '2021-08-25', 'Delhi',     26, 'sonal.verma@gmail.com',      '9223456789', 204, 'Active');
INSERT INTO employees VALUES (111, 'Vikram',    'Singh',   'IT',        91000, '2015-05-07', 'Bengaluru', 42, 'vikram.singh@company.com',   '9134567890', 203, 'Active');
INSERT INTO employees VALUES (112, 'Kavya',     'Nair',    'Sales',     47000, '2023-01-19', 'Mumbai',    23, 'kavya.nair@gmail.com',       '9045678901', 201, 'Active');
INSERT INTO employees VALUES (113, 'Manish',    'Tiwari',  'Finance',   63000, '2018-07-14', 'Delhi',     33, 'manish.tiwari@yahoo.com',    '8956789012', 201, 'Inactive');
INSERT INTO employees VALUES (114, 'Arun',      'Pillai',  'IT',        78000, '2019-11-22', 'Bengaluru', 35, 'arun.pillai@company.com',    '8867890123', 203, 'Active');
INSERT INTO employees VALUES (115, 'Sneha',     'Patil',   'HR',        44000, '2022-10-08', 'Pune',      25, 'sneha.patil@gmail.com',      '8778901234', 202, 'Active');
INSERT INTO employees VALUES (116, 'Rohit',     'Desai',   'Marketing', 71000, '2017-03-29', 'Mumbai',    39, 'rohit.desai@company.com',    NULL,         204, 'Active');
INSERT INTO employees VALUES (117, 'Pooja',     'Menon',   'Finance',   56000, '2020-06-17', 'Kochi',     27, 'pooja.menon@gmail.com',      '8601234567', 201, 'Active');
INSERT INTO employees VALUES (118, 'Siddharth', 'Rao',     'Sales',     65000, '2018-02-28', 'Hyderabad', 32, 'siddharth.rao@yahoo.com',    '8512345678', 201, 'Active');
INSERT INTO employees VALUES (119, 'Lakshmi',   'Nambiar', 'HR',        NULL,  '2023-05-15', 'Chennai',   22, 'lakshmi.nambiar@gmail.com',  '8423456789', 202, 'Active');
INSERT INTO employees VALUES (120, 'Arjun',     'Kaur',    'IT',        95000, '2014-08-20', 'Bengaluru', 44, 'arjun.kaur@company.com',     '8334567890', 203, 'Active');


DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
                             dept_id    VARCHAR(5),
                             dept_name  VARCHAR(50),
                             location   VARCHAR(50),
                             head_count INT,
                             budget     INT
);

INSERT INTO departments VALUES ('D01', 'Sales',     'Mumbai',    4, 500000);
INSERT INTO departments VALUES ('D02', 'HR',        'Delhi',     4, 300000);
INSERT INTO departments VALUES ('D03', 'IT',        'Bengaluru', 5, 900000);
INSERT INTO departments VALUES ('D04', 'Finance',   'Hyderabad', 4, 700000);
INSERT INTO departments VALUES ('D05', 'Marketing', 'Mumbai',    3, 600000);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
                        order_id        VARCHAR(5),
                        emp_id          INT,
                        product         VARCHAR(50),
                        amount          INT,
                        order_date      DATE,
                        delivery_status VARCHAR(20)
);

INSERT INTO orders VALUES ('O001', 101, 'Laptop',     75000,  '2023-01-10', 'Delivered');
INSERT INTO orders VALUES ('O002', 103, 'Monitor',    22000,  '2023-02-15', 'Pending');
INSERT INTO orders VALUES ('O003', 105, 'Keyboard',   3500,   '2023-03-22', 'Delivered');
INSERT INTO orders VALUES ('O004', 108, 'Headphones', 8000,   '2023-04-05', 'Cancelled');
INSERT INTO orders VALUES ('O005', 112, 'Laptop',     75000,  '2023-05-11', 'Delivered');
INSERT INTO orders VALUES ('O006', 115, 'Mouse',      1500,   '2023-06-18', 'Pending');
INSERT INTO orders VALUES ('O007', 101, 'Printer',    18000,  '2023-07-29', 'Delivered');
INSERT INTO orders VALUES ('O008', 120, 'Server',     250000, '2023-08-14', 'Pending');
INSERT INTO orders VALUES ('O009', 109, 'Tablet',     35000,  '2023-09-01', 'Delivered');
INSERT INTO orders VALUES ('O010', 116, 'Webcam',     5000,   '2023-10-20', NULL);



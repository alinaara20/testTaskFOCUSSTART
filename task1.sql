CREATE DATABASE IF NOT EXISTS bank;
USE bank;
CREATE TABLE IF NOT EXISTS clients(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(1000),
    place_of_birth VARCHAR(1000),
    date_of_birth DATE,
    address VARCHAR(1000),
    passport VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS tarifs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100),
    cost DECIMAL(10,2)
);
CREATE TABLE IF NOT EXISTS product_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100),
    begin_date DATE,
    end_date DATE,
    tarif_ref INT,
    FOREIGN KEY (tarif_ref) REFERENCES tarifs (id)
);
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_id INT,
    name_ VARCHAR(100),
    client_ref INT,
    open_date DATE,
    close_date DATE,
    FOREIGN KEY (product_type_id) REFERENCES product_type(id),
    FOREIGN KEY (client_ref) REFERENCES clients(id)
);
CREATE TABLE IF NOT EXISTS accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(100),
    saldo DECIMAL(10,2),
    client_ref INT,
    open_date DATE,
    close_date DATE,
    product_ref INT,
    acc_num VARCHAR(25),
    FOREIGN KEY (client_ref) REFERENCES clients(id),
    FOREIGN KEY (product_ref) REFERENCES products(id)
);
CREATE TABLE IF NOT EXISTS records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dt BOOL,
    sum DECIMAL(10,2),
    acc_ref INT,
    oper_date DATE,
    FOREIGN KEY (acc_ref) REFERENCES accounts(id)
);
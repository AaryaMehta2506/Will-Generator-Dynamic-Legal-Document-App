CREATE DATABASE IF NOT EXISTS will_db;
USE will_db;

USE will_db;

-- Existing tables already assumed: testator, beneficiaries, bank_accounts

CREATE TABLE insurance_policies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    policy_name VARCHAR(100),
    policy_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);

CREATE TABLE stocks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    firm_name VARCHAR(100),
    account_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);

CREATE TABLE mutual_funds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    distributor VARCHAR(100),
    account_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);

CREATE TABLE jewellery (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    jewellery_type VARCHAR(100),
    invoice_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);

CREATE TABLE houses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    property_name VARCHAR(100),
    registration_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);

CREATE TABLE lands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testator_id INT,
    land_name VARCHAR(100),
    registration_number VARCHAR(50),
    remark VARCHAR(255),
    beneficiary VARCHAR(100),
    share FLOAT,
    FOREIGN KEY (testator_id) REFERENCES testator(id)
);


-- Project: BloodDonationMVC
-- Developer: Riya Maity
-- Database: blood_donation


-- Create Database
CREATE DATABASE IF NOT EXISTS blood_donation;
USE blood_donation;


-- Table: donors
CREATE TABLE IF NOT EXISTS donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Sample Data for donors table

INSERT INTO donors (full_name, email, password, blood_group, city, phone, created_at) VALUES
('Tina Sharma', 'tina@gmail.com', 'tina123', 'A+', 'Kolkata', '9876543210', '2025-10-05 15:57:31'),
('Arjun Kumar', 'arjun@gmail.com', 'arjun123', 'O+', 'Delhi', '9876543211', '2025-10-05 15:57:31'),
('Vansh Jain', 'vansh@gmail.com', 'vansh123', 'O-', 'Delhi', '7830522401', '2025-10-05 15:57:31'),
('Sneha Das', 'sneha@gmail.com', 'sneha123', 'B+', 'Mumbai', '9876543212', '2025-10-05 15:57:31'),
('Harsh Patel', 'harsh@gmail.com', 'harsh123', 'AB-', 'Nashik', '9968226199', '2025-10-05 20:30:24'),
('Fatima Khan', 'fatima@gmail.com', 'fatima123', 'A+', 'Kolkata', '9888473210', '2025-10-05 21:22:25'),
('Raj Nagar', 'raj@gmail.com', 'raj123', 'O+', 'Delhi', '8874934785', '2025-10-05 21:22:25'),
('Ujjwal', 'ujjwal@gmail.com', 'ujjwal123', 'O-', 'Delhi', '9074789611', '2025-10-05 21:22:25'),
('Naman Jain', 'naman@gmail.com', 'naman123', 'O+', 'Delhi', '9074037855', '2025-10-05 23:12:56'),
('Priya Jain', 'priya12@gmail.com', 'priya12', 'AB+', 'Indore', '7649762435', '2025-12-27 20:11:08');

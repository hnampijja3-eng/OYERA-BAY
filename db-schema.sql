-- 1. Drop old tables if they exist to prevent errors
DROP TABLE IF EXISTS service_jobs CASCADE;
DROP TABLE IF EXISTS inventory CASCADE;

-- 2. Create the Parts & Lubricants Table
CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    price_ugx INT NOT NULL,
    stock_quantity INT NOT NULL
);

-- 3. Create the Service Jobs Table (To track cars in the bay)
CREATE TABLE service_jobs (
    id SERIAL PRIMARY KEY,
    car_plate VARCHAR(20) NOT NULL,
    vehicle_model VARCHAR(100) NOT NULL,
    service_type VARCHAR(100) NOT NULL, -- e.g., "Oil Change", "Brake Replacement"
    job_status VARCHAR(20) DEFAULT 'Pending' -- Pending, In Progress, Completed
);

-- 4. Insert Fresh Sample Data for Parts
INSERT INTO inventory (part_name, price_ugx, stock_quantity) VALUES
('Standard Engine Oil', 85000, 15),
('Premium Synthetic Oil', 150000, 10),
('Oil Filter', 25000, 30),
('Brake Pads Set', 90000, 12),
('Spark Plug', 15000, 50);

-- 5. Insert Sample Data for Active Service Jobs
INSERT INTO service_jobs (car_plate, vehicle_model, service_type, job_status) VALUES
('UBL 123X', 'Toyota Premio', 'Full Engine Service', 'In Progress'),
('UBM 789A', 'Subaru Forester', 'Brake Pads Replacement', 'Pending'),
('UBN 456C', 'Honda CR-V', 'Spark Plug Change', 'Completed');
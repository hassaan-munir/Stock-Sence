-- CREATE DATABASE smart_retail_ai_v2;
USE smart_retail_ai_v2;

CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    owner_name VARCHAR(255) NOT NULL,
    business_email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    
    plan_type VARCHAR(50) DEFAULT 'Free',
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('owner','admin','staff') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(100),
    category VARCHAR(100),
    cost_price DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    current_stock INT DEFAULT 0,
    min_stock_level INT DEFAULT 0,
    expiry_date DATE NULL,
    supplier_name VARCHAR(255),
    supplier_phone VARCHAR(20),
    supplier_email VARCHAR(255),
    supplier_whatsapp VARCHAR(20),
    supplier_last_contact_date DATE,
    auto_reorder_enabled BOOLEAN DEFAULT FALSE,
    reorder_qty_default INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    user_id INT NOT NULL,
    sale_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('cash','card','online') NOT NULL,
    note TEXT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE sale_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    qty INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE
);

CREATE TABLE refunds (
    refund_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    store_id INT NOT NULL,
    qty INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    reason TEXT,
    refund_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE
);

CREATE TABLE stock_movements (
    move_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    user_id INT NOT NULL,
    type ENUM('restock','damage','adjust') NOT NULL,
    qty INT NOT NULL,
    note TEXT,
    move_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE attendance (
    att_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    checkin_time DATETIME,
    checkout_time DATETIME,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);
------------------------------------------------



ALTER TABLE stores
ADD COLUMN password VARCHAR(255);

ALTER TABLE stores
MODIFY COLUMN created_at DATETIME(3);


SELECT * FROM stores;

DESCRIBE stores;
SELECT * FROM products;
INSERT INTO products 
(store_id, name, sku, category, cost_price, sale_price, current_stock, min_stock_level, expiry_date, supplier_name, supplier_phone, supplier_email, supplier_whatsapp, supplier_last_contact_date, auto_reorder_enabled, reorder_qty_default, created_at)
VALUES
(1, 'Rice 1kg', 'RICE001', 'Grocery', 200, 250, 40, 10, '2026-12-31', 'Ali Traders', '03001234567', 'ali@traders.com', '03001234567', '2026-02-01', 1, 20, NOW()),
(1, 'Sugar 1kg', 'SUGAR001', 'Grocery', 180, 220, 35, 10, '2026-12-31', 'Sweet Suppliers', '03007654321', 'sweet@supply.com', '03007654321', '2026-01-25', 1, 15, NOW()),
(1, 'Cooking Oil 1L', 'OIL001', 'Grocery', 500, 550, 30, 5, '2027-01-31', 'Oil Corp', '03009876543', 'oil@corp.com', '03009876543', '2026-02-10', 1, 10, NOW()),
(1, 'Milk Pack', 'MILK001', 'Dairy', 150, 180, 50, 15, '2026-03-15', 'Dairy House', '03005432109', 'dairy@house.com', '03005432109', '2026-02-05', 1, 25, NOW()),
(1, 'Tea 500g', 'TEA001', 'Beverages', 550, 600, 25, 5, '2026-12-31', 'Tea Traders', '03001112233', 'tea@traders.com', '03001112233', '2026-01-20', 1, 10, NOW());


INSERT INTO products 
(store_id, name, sku, category, cost_price, sale_price, current_stock, min_stock_level, expiry_date, supplier_name, supplier_phone, supplier_email, supplier_whatsapp, supplier_last_contact_date, auto_reorder_enabled, reorder_qty_default, created_at)
VALUES
(3, 'Biscuits Pack', 'BIS001', 'Snacks', 100, 120, 60, 20, '2026-12-31', 'Snack Suppliers', '03002223344', 'snack@supply.com', '03002223344', '2026-02-01', 1, 30, NOW()),
(3, 'Soft Drink 1.5L', 'SD001', 'Beverages', 130, 150, 45, 15, '2026-08-31', 'Drinks Co', '03003334455', 'drinks@co.com', '03003334455', '2026-01-30', 1, 20, NOW()),
(3, 'Shampoo Bottle', 'SHAM001', 'Personal Care', 300, 320, 20, 5, '2027-01-31', 'Care Products', '03004445566', 'care@products.com', '03004445566', '2026-02-10', 1, 10, NOW()),
(3, 'Soap Bar', 'SOAP001', 'Personal Care', 80, 90, 80, 20, '2027-06-30', 'Soapy Suppliers', '03005556677', 'soapy@supply.com', '03005556677', '2026-02-05', 1, 40, NOW()),
(3, 'Toothpaste', 'TOOTH001', 'Personal Care', 180, 200, 30, 10, '2027-01-31', 'Dental Corp', '03006667788', 'dental@corp.com', '03006667788', '2026-02-15', 1, 15, NOW());

SELECT email, password_hash FROM users WHERE email = '7@g.c';
SELECT * FROM users;
SELECT user_id, full_name, email, role, store_id FROM users;
INSERT INTO users (store_id, full_name, email, password_hash, role, is_active)
VALUES (4, 'Hassaan', 'hassaanmunirpc@gmail.com', 'temp123', 'owner', 1);
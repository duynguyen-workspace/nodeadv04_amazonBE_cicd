--- users: user_id, first_name, last_name, age, phone, role_id
--- products: product_id, name, price, image, description, attributes
--- orders: order_id, product_id, user_id, created_date
--- shipping: shipping_id, product_id, order_id, first_name, last_name, street, phone, city, gender
--- payment: payment_id, user_id, order_id, payment_value, payment_status, payment_link
--- ratings: rate_id, user_id, product_id, rating_number, review
--- likes: like_id, user_id, product_id, like_status, emoji

--- auth: uuid, user_id, email, password, access_token, refresh_token, facebook_app_id, gmail_app_id
--- roles: role_id, role_name, permissions: CREATE, READ, DELETE 
--- >> admin, customer, supplier, guest

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    email VARCHAR(255),
    phone TEXT
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price FLOAT NOT NULL,
    image TEXT,
    description TEXT,
    attributes JSONB
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    created_date TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE shipping (
    shipping_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    order_id INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email VARCHAR(255) NOT NULL,
    street TEXT NOT NULL,
    phone TEXT NOT NULL,
    city TEXT NOT NULL,
    gender TEXT
);

INSERT INTO products (name, price, image, description, attributes) VALUES
('Wireless Mouse', 29.99, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Ergonomic wireless mouse with adjustable DPI.', '{"color": "black", "connectivity": "wireless", "battery_life": "12 months"}'),
('Mechanical Keyboard', 79.49, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'RGB backlit mechanical keyboard with blue switches.', '{"color": "white", "switch_type": "blue", "connection": "USB"}'),
('Gaming Monitor', 249.99, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', '27 inch 144Hz gaming monitor with 1ms response time.', '{"resolution": "2560x1440", "refresh_rate": "144Hz", "panel_type": "IPS"}'),
('USB-C Hub', 39.95, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', '7-in-1 USB-C hub with HDMI, USB 3.0, and SD card reader.', '{"ports": 7, "hdmi_support": "4K@30Hz", "power_delivery": "60W"}'),
('Noise Cancelling Headphones', 129.99, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Over-ear headphones with active noise cancellation.', '{"color": "black", "battery_life": "20 hours", "wireless": true}'),
('Smartwatch', 199.00, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Fitness smartwatch with heart rate monitor and GPS.', '{"color": "black", "water_resistant": true, "battery_life": "7 days"}'),
('External SSD 1TB', 159.95, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Portable external SSD with USB 3.1 interface.', '{"capacity": "1TB", "read_speed": "550MB/s", "write_speed": "500MB/s"}'),
('Bluetooth Speaker', 49.99, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Compact Bluetooth speaker with 12 hours playtime.', '{"color": "blue", "battery_life": "12 hours", "waterproof": false}'),
('4K Action Camera', 299.99, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Waterproof 4K action camera with wide-angle lens.', '{"resolution": "4K", "waterproof_depth": "30m", "battery_life": "2 hours"}'),
('Laptop Stand', 25.00, 'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg', 'Adjustable aluminum laptop stand for better ergonomics.', '{"material": "aluminum", "adjustable": true, "weight_capacity": "10kg"}');


INSERT INTO users (first_name, last_name, age, phone, email) VALUES
('Alice', 'Johnson', 28, '+1-202-555-0171', 'alice.johnson@example.com'),
('Bob', 'Smith', 34, '+1-303-555-0145', 'bob.smith@example.com'),
('Carol', 'Davis', 22, '+44 7700 900123', 'carol.davis@example.co.uk'),
('David', 'Miller', 45, '+1-415-555-0198', 'david.miller@example.com'),
('Eva', 'Brown', 31, '+61 412 345 678', 'eva.brown@example.au'),
('Frank', 'Wilson', 27, '+49 170 1234567', 'frank.wilson@example.de');
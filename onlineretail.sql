create database Online_Retail_Shop;
use Online_retail_shop;
create table Users(user_id int primary key auto_increment,
username varchar(25) unique not null,
password varchar(21) not null,
role enum('buyer','seller') default 'buyer',
create_at datetime default current_timestamp,
check(CHAR_LENGTH(password) between 8 and 20));
create table customers( 
customer_id varchar(12) primary key,
user_id int unique,
name varchar(100),
age int,
gender enum('male','female','other'),
phone varchar(15),
profile_photo_url text,
foreign key(user_id) references users(user_id));
create table sellers(
seller_id int primary key auto_increment,
user_id int unique,
shop_name varchar(100),
phone varchar(15),
address text,
foreign key(user_id) references users(user_id));
create table address(
address_id int primary key auto_increment,
customer_id varchar(12),
address_line Text,
address_type enum('home','work','billing','shipping'),
foreign key (customer_id) references customers(customer_id));
create table items(
item_id int primary key auto_increment,
seller_id int,
name varchar(100),
type varchar(100),
cost decimal(10,2),
image_url text,
description text,
rating decimal check (rating between 1 and 5),
foreign key (seller_id) references sellers(seller_id));
create table cart_items(
cart_item_id int primary key auto_increment,
customer_id varchar(12),
item_id int,
quantity int default 1,
added_at datetime default current_timestamp,
foreign key (customer_id) references customers(customer_id),
foreign key(item_id) references items(item_id));
create table orders (
order_id int primary key auto_increment,
customer_id varchar(17),
address_id int,
order_date datetime default current_timestamp,
payment_type enum('card', 'upi' , 'netbanking' , 'cod' ),
total_amount decimal(10,2),
foreign key (customer_id) references customers(customer_id),
foreign key(address_id) references address(address_id));
create table order_item (
order_item_id int primary key auto_increment,
order_id int,
item_id int,
quantity int,
price decimal(10,2),
foreign key (order_id) references orders(order_id),
foreign key (item_id) references items(item_id));
create table order_status(
status_id int primary key auto_increment,
order_id int,
status varchar(50),
update_at datetime default current_timestamp,
foreign key (order_id) references orders(order_id));
create table comments( comment_id int primary key auto_increment,
 customer_id varchar(12),
 item_id int,
 comment text,
 commented_at datetime default current_timestamp,
 foreign key (customer_id) references customers(customer_id),
 foreign key (item_id) references items(item_id));
 create table feedback(
 feedback_id int primary key auto_increment,
 customer_id varchar(12),
 order_id int,
 feedback text,
 rating decimal check (rating between 1 and 5),
 foreign key (customer_id) references customers(customer_id),
 foreign key (order_id) references orders(order_id));
create table user_logins(
login_id int primary key auto_increment,
user_id int,
login_time datetime default current_timestamp,
foreign key (user_id) references users(user_id));
create table coupons(
coupons_id int primary key auto_increment,
code varchar(30),
discount int,
expiry_date date);
ALTER TABLE orders
ADD COLUMN coupons_id INT,
ADD FOREIGN KEY (coupons_id) REFERENCES coupons(coupons_id);
ALTER TABLE coupons
ADD COLUMN is_used BOOLEAN DEFAULT FALSE;
ALTER TABLE items MODIFY rating DECIMAL(2,1) CHECK (rating BETWEEN 1 AND 5);
ALTER TABLE feedback MODIFY rating DECIMAL(2,1) CHECK (rating BETWEEN 1 AND 5);
INSERT INTO Users(user_id, username, password, role) VALUES (1, 'ravi1', 'Pass@1word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (2, 'kasaiah2', 'Pass@2word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (3, 'praveen3', 'Pass@3word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (4, 'omkar4', 'Pass@4word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (5, 'manvi5', 'Pass@5word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (6, 'manjula6', 'Pass@6word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (7, 'kalyan7', 'Pass@7word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (8, 'harsha8', 'Pass@8word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (9, 'sandeep9', 'Pass@9word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (10, 'divya10', 'Pass@10word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (11, 'lakshmi11', 'Pass@11word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (12, 'swapna12', 'Pass@12word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (13, 'srikanth13', 'Pass@13word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (14, 'bhavana14', 'Pass@14word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (15, 'vamsi15', 'Pass@15word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (16, 'kamal16', 'Pass@16word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (17, 'chaitanya17', 'Pass@17word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (18, 'satya18', 'Pass@18word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (19, 'pavani19', 'Pass@19word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (20, 'rajesh20', 'Pass@20word', 'buyer');
INSERT INTO Users(user_id, username, password, role) VALUES (21, 'meghana21', 'Pass@21word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (22, 'suresh22', 'Pass@22word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (23, 'sindhu23', 'Pass@23word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (24, 'anil24', 'Pass@24word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (25, 'keerthi25', 'Pass@25word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (26, 'gopi26', 'Pass@26word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (27, 'rekha27', 'Pass@27word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (28, 'vinay28', 'Pass@28word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (29, 'deepak29', 'Pass@29word', 'seller');
INSERT INTO Users(user_id, username, password, role) VALUES (30, 'anusha30', 'Pass@30word', 'seller');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070001', 1, 'Ravi', 28, 'male', '9876543210', 'https://example.com/photos/ravi1.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070002', 2, 'Kasaiah', 35, 'male', '9876543211', 'https://example.com/photos/kasaiah2.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070003', 3, 'Praveen', 24, 'male', '9876543212', 'https://example.com/photos/praveen3.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070004', 4, 'Omkar', 30, 'male', '9876543213', 'https://example.com/photos/omkar4.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070005', 5, 'Manvi', 26, 'female', '9876543214', 'https://example.com/photos/manvi5.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070006', 6, 'Manjula', 32, 'female', '9876543215', 'https://example.com/photos/manjula6.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070007', 7, 'Kalyan', 29, 'male', '9876543216', 'https://example.com/photos/kalyan7.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070008', 8, 'Harsha', 27, 'male', '9876543217', 'https://example.com/photos/harsha8.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070009', 9, 'Sandeep', 31, 'male', '9876543218', 'https://example.com/photos/sandeep9.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070010', 10, 'Divya', 23, 'female', '9876543219', 'https://example.com/photos/divya10.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070011', 11, 'Lakshmi', 30, 'female', '9876543220', 'https://example.com/photos/lakshmi11.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070012', 12, 'Swapna', 27, 'female', '9876543221', 'https://example.com/photos/swapna12.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070013', 13, 'Srikanth', 28, 'male', '9876543222', 'https://example.com/photos/srikanth13.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070014', 14, 'Bhavana', 24, 'female', '9876543223', 'https://example.com/photos/bhavana14.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070015', 15, 'Vamsi', 32, 'male', '9876543224', 'https://example.com/photos/vamsi15.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070016', 16, 'Kamal', 29, 'male', '9876543225', 'https://example.com/photos/kamal16.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070017', 17, 'Chaitanya', 31, 'male', '9876543226', 'https://example.com/photos/chaitanya17.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070018', 18, 'Satya', 30, 'male', '9876543227', 'https://example.com/photos/satya18.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070019', 19, 'Pavani', 26, 'female', '9876543228', 'https://example.com/photos/pavani19.jpg');

INSERT INTO customers(customer_id, user_id, name, age, gender, phone, profile_photo_url)
VALUES ('2024070020', 20, 'Rajesh', 34, 'male', '9876543229', 'https://example.com/photos/rajesh20.jpg');

INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (21, 'Meghana Fashions', '7896543210', 'Meghana Fashions, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (22, 'Suresh Electronics', '7896543211', 'Suresh Electronics, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (23, 'Sindhu Books', '7896543212', 'Sindhu Books, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (24, 'Anil Mobiles', '7896543213', 'Anil Mobiles, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (25, 'Keerthi Homeware', '7896543214', 'Keerthi Homeware, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (26, 'Gopi Groceries', '7896543215', 'Gopi Groceries, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (27, 'Rekha Clothing', '7896543216', 'Rekha Clothing, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (28, 'Vinay Furniture', '7896543217', 'Vinay Furniture, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (29, 'Deepak Sports', '7896543218', 'Deepak Sports, Hyderabad');
INSERT INTO sellers(user_id, shop_name, phone, address) VALUES (30, 'Anusha Kitchen', '7896543219', 'Anusha Kitchen, Hyderabad');
-- Seller 1 (Meghana Fashions)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(1, 'Cotton Saree', 'Clothing', 1200.00, 'https://example.com/items/saree1.jpg', 'Soft cotton saree from Meghana Fashions', 4.5),
(1, 'Silk Kurti', 'Clothing', 1500.00, 'https://example.com/items/kurti1.jpg', 'Festive silk kurti', 4.2),
(1, 'Embroidered Dupatta', 'Clothing', 800.00, 'https://example.com/items/dupatta1.jpg', 'Fancy dupatta with zari work', 4.3),
(1, 'Lehenga Choli', 'Clothing', 2800.00, 'https://example.com/items/lehenga1.jpg', 'Traditional lehenga choli', 4.6);

-- Seller 2 (Suresh Electronics)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(2, 'Wireless Headphones', 'Electronics', 2999.00, 'https://example.com/items/headphones.jpg', 'Noise-cancelling headphones', 4.7),
(2, 'Bluetooth Speaker', 'Electronics', 1999.00, 'https://example.com/items/speaker.jpg', 'Deep bass portable speaker', 4.6),
(2, 'Smart Watch', 'Electronics', 3499.00, 'https://example.com/items/smartwatch.jpg', 'Smart watch with fitness tracker', 4.4),
(2, 'Power Bank', 'Electronics', 1499.00, 'https://example.com/items/powerbank.jpg', '10000mAh quick charge power bank', 4.5);
-- Seller 3 (Sindhu Books)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(3, 'Telugu Novel', 'Books', 350.00, 'https://example.com/items/book1.jpg', 'Top-selling Telugu novel', 4.1),
(3, 'Study Guide', 'Books', 450.00, 'https://example.com/items/book2.jpg', 'Comprehensive exam guide', 4.3),
(3, 'History Book', 'Books', 399.00, 'https://example.com/items/book3.jpg', 'Indian History explained', 4.2),
(3, 'Math Workbook', 'Books', 299.00, 'https://example.com/items/book4.jpg', 'Math practice workbook', 4.4);

-- Seller 4 (Anil Mobiles)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(4, 'Smartphone Case', 'Accessories', 299.00, 'https://example.com/items/case.jpg', 'Shockproof mobile case', 4.0),
(4, 'Mobile Charger', 'Accessories', 699.00, 'https://example.com/items/charger.jpg', 'Fast-charging charger', 4.3),
(4, 'Screen Protector', 'Accessories', 199.00, 'https://example.com/items/screen.jpg', 'Tempered glass screen guard', 4.1),
(4, 'Earphones', 'Accessories', 499.00, 'https://example.com/items/earphones.jpg', 'Bass boosted wired earphones', 4.2);

-- Seller 5 (Keerthi Homeware)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(5, 'Steel Kettle', 'Kitchenware', 999.00, 'https://example.com/items/kettle.jpg', 'Electric steel kettle', 4.4),
(5, 'Plastic Containers', 'Kitchenware', 499.00, 'https://example.com/items/containers.jpg', 'Set of 5 storage containers', 4.0),
(5, 'Non-stick Tava', 'Kitchenware', 850.00, 'https://example.com/items/tava.jpg', 'Flat non-stick tawa pan', 4.2),
(5, 'Gas Lighter', 'Kitchenware', 150.00, 'https://example.com/items/lighter.jpg', 'Durable kitchen gas lighter', 4.1);

-- Seller 6 (Gopi Groceries)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(6, 'Toor Dal 1kg', 'Groceries', 110.00, 'https://example.com/items/toordal.jpg', 'Premium quality dal', 4.5),
(6, 'Groundnut Oil 1L', 'Groceries', 170.00, 'https://example.com/items/oil.jpg', 'Cold pressed oil', 4.3),
(6, 'Wheat Flour 5kg', 'Groceries', 230.00, 'https://example.com/items/atta.jpg', 'High quality wheat flour', 4.2),
(6, 'Turmeric Powder 200g', 'Groceries', 60.00, 'https://example.com/items/haldi.jpg', 'Pure haldi powder', 4.4);

-- Seller 7 (Rekha Clothing)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(7, 'Women T-shirt', 'Clothing', 599.00, 'https://example.com/items/tshirt.jpg', 'Cotton printed tee', 4.2),
(7, 'Leggings Set', 'Clothing', 799.00, 'https://example.com/items/leggings.jpg', 'Pack of 3 leggings', 4.3),
(7, 'Summer Top', 'Clothing', 699.00, 'https://example.com/items/top.jpg', 'Cool cotton top', 4.1),
(7, 'Cotton Dress', 'Clothing', 1199.00, 'https://example.com/items/dress.jpg', 'Casual day dress', 4.5);

-- Seller 8 (Vinay Furniture)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(8, 'Wooden Chair', 'Furniture', 2500.00, 'https://example.com/items/chair.jpg', 'Cushioned wooden chair', 4.6),
(8, 'Study Table', 'Furniture', 3200.00, 'https://example.com/items/table.jpg', 'Compact study table', 4.7),
(8, 'Shoe Rack', 'Furniture', 1800.00, 'https://example.com/items/rack.jpg', '3-layer wooden rack', 4.3),
(8, 'Wall Shelf', 'Furniture', 1300.00, 'https://example.com/items/shelf.jpg', 'Stylish wall shelf', 4.4);

-- Seller 9 (Deepak Sports)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(9, 'Cricket Bat', 'Sports', 1500.00, 'https://example.com/items/bat.jpg', 'Lightweight cricket bat', 4.3),
(9, 'Yoga Mat', 'Fitness', 850.00, 'https://example.com/items/yogamat.jpg', 'Non-slip yoga mat', 4.4),
(9, 'Skipping Rope', 'Fitness', 250.00, 'https://example.com/items/rope.jpg', 'Adjustable jump rope', 4.1),
(9, 'Football', 'Sports', 900.00, 'https://example.com/items/football.jpg', 'Size 5 football', 4.2);

-- Seller 10 (Anusha Kitchen)
INSERT INTO items(seller_id, name, type, cost, image_url, description, rating) VALUES
(10, 'Frying Pan', 'Cookware', 999.00, 'https://example.com/items/pan.jpg', 'Non-stick frying pan', 4.2),
(10, 'Mixing Bowls', 'Cookware', 699.00, 'https://example.com/items/bowls.jpg', 'Set of 3 steel bowls', 4.0),
(10, 'Knife Set', 'Cookware', 599.00, 'https://example.com/items/knives.jpg', 'Sharp kitchen knives', 4.3),
(10, 'Measuring Cups', 'Cookware', 350.00, 'https://example.com/items/cups.jpg', '4-piece measuring set', 4.1);

INSERT INTO address (customer_id, address_line, address_type) VALUES
('2024070001', 'H.No 1-20, Main Road, Guntur, Andhra Pradesh', 'home'),
('2024070001', 'Office No 201, Tech Park, Hyderabad', 'work'),

('2024070002', '7-2-33, Station Road, Ongole', 'home'),
('2024070002', 'Billing Dept, Ongole Post Office', 'billing'),

('2024070003', 'D.No 10-4, RTC Colony, Vijayawada', 'home'),
('2024070003', 'Shipping Warehouse, Benz Circle, Vijayawada', 'shipping'),

('2024070004', 'Flat No 22, Kukatpally, Hyderabad', 'home'),
('2024070004', 'IT Tower, Madhapur, Hyderabad', 'work'),

('2024070005', 'D.No 5-11, Beach Road, Vizag', 'home'),

('2024070006', 'Old Market Street, Nellore', 'home'),

('2024070007', 'Plot 88, Rajahmundry Bypass', 'home'),
('2024070007', 'Office 33, BHEL Township, Hyderabad', 'work'),

('2024070008', 'Main Road, Karimnagar', 'home'),

('2024070009', 'Temple Street, Eluru', 'home'),
('2024070009', 'ABC Bank Office, Eluru', 'billing'),

('2024070010', 'Civil Lines, Kurnool', 'home'),

('2024070011', 'House No 14, Gandhi Nagar, Tirupati', 'home'),
('2024070011', 'Billing Office, Tirupati Bazaar', 'billing'),

('2024070012', 'Flat 301, Ram Nagar, Kakinada', 'home'),

('2024070013', '8-20, Jawahar Street, Anantapur', 'home'),
('2024070013', 'Warehouse #7, Gooty Road', 'shipping'),

('2024070014', '3rd Lane, Balaji Colony, Warangal', 'home'),
('2024070014', 'Techno Park Office, Hanamkonda', 'work'),

('2024070015', 'Survey No 44, Karimnagar Road, Nizamabad', 'home'),

('2024070016', 'Apt 22B, Amaravati Towers, Guntur', 'home'),

('2024070017', 'D.No 2-44, Sri Nagar Colony, Vizianagaram', 'home'),

('2024070018', 'Main Road, Yanam', 'home'),

('2024070019', 'Old Town, Machilipatnam', 'home'),

('2024070020', 'Plot 101, Rajiv Nagar, Srikakulam', 'home'),
('2024070020', 'Shipping Center, Market Area, Srikakulam', 'shipping');

INSERT INTO cart_items (customer_id, item_id, quantity) VALUES
('2024070001', 41, 2),
('2024070001', 42, 1),
('2024070002', 43, 1),
('2024070002', 44, 2),
('2024070003', 45, 1),
('2024070003', 46, 2),
('2024070004', 47, 1),
('2024070005', 48, 1),
('2024070005', 49, 2),
('2024070006', 50, 1),
('2024070006', 51, 2),
('2024070007', 52, 1),
('2024070007', 53, 2),
('2024070008', 54, 3),
('2024070009', 55, 1),
('2024070009', 56, 1),
('2024070010', 57, 2),
('2024070011', 58, 1),
('2024070011', 59, 2),
('2024070012', 60, 1),
('2024070013', 61, 1),
('2024070013', 62, 2),
('2024070014', 63, 2),
('2024070014', 64, 1),
('2024070015', 65, 3),
('2024070015', 66, 1),
('2024070016', 67, 2),
('2024070016', 68, 1),
('2024070017', 69, 1),
('2024070017', 70, 2),
('2024070018', 71, 2),
('2024070018', 72, 1),
('2024070019', 73, 2),
('2024070019', 74, 1),
('2024070020', 75, 1),
('2024070020', 76, 2);

INSERT INTO coupons (code, discount, expiry_date)
VALUES
('NEWUSER10', 10, '2025-12-31'),
('FESTIVE20', 20, '2025-11-15'),
('SAVE15', 15, '2025-10-01'),
('SHOPNOW5', 5, '2025-09-30'),
('BIGSALE25', 25, '2025-12-01'),
('WELCOME50', 50, '2025-12-31'),
('FREESHIP', 5, '2025-09-15'),
('DIWALI30', 30, '2025-10-30'),
('FLASHSALE40', 40, '2025-08-31'),
('SUMMERDEAL', 20, '2025-07-31'),
('WINTER20', 20, '2025-12-15'),
('EXTRA15', 15, '2025-09-20'),
('LIMITED5', 5, '2025-08-15'),
('WELCOME100', 100, '2025-09-01'),
('STUDENT10', 10, '2025-10-10');

INSERT INTO orders (customer_id, address_id, order_date, payment_type, total_amount, coupons_id)
VALUES
-- Customer 2024070001
('2024070001', 1, NOW(), 'upi', 1150.00, 2),
('2024070001', 2, NOW(), 'card', 2300.00, NULL),

-- Customer 2024070002
('2024070002', 3, NOW(), 'netbanking', 1450.00, 1),
('2024070002', 4, NOW(), 'cod', 2999.00, NULL),

-- Customer 2024070003
('2024070003', 5, NOW(), 'upi', 1200.00, 3),
('2024070003', 6, NOW(), 'card', 1800.00, NULL),

-- Customer 2024070004
('2024070004', 7, NOW(), 'card', 3200.00, NULL),
('2024070004', 8, NOW(), 'netbanking', 1980.00, 5),

-- Customer 2024070005
('2024070005', 9, NOW(), 'upi', 900.00, NULL),
('2024070005', 9, NOW(), 'cod', 2750.00, 4),
('2024070006', 11, NOW(), 'upi', 1890.00, NULL),
('2024070006', 11, NOW(), 'card', 2599.00, 1),
('2024070007', 12, NOW(), 'cod', 990.00, NULL),
('2024070007', 13, NOW(), 'upi', 1999.00, 2),
('2024070008', 14, NOW(), 'netbanking', 3250.00, 3),
('2024070008', 14, NOW(), 'card', 1450.00, NULL),
('2024070009', 15, NOW(), 'upi', 950.00, NULL),
('2024070009', 16, NOW(), 'cod', 2400.00, 4),
('2024070010', 17, NOW(), 'card', 1680.00, NULL),
('2024070010', 17, NOW(), 'netbanking', 1985.00, 5),
('2024070006', 11, NOW(), 'card', 1850.00, 4),
('2024070007', 13, NOW(), 'upi', 2120.00, NULL),
('2024070008', 14, NOW(), 'netbanking', 1320.00, 5),
('2024070009', 16, NOW(), 'cod', 980.00, NULL),
('2024070010', 17, NOW(), 'card', 2450.00, 2),
('2024070011', 18, NOW(), 'upi', 1700.00, NULL),
('2024070012', 20, NOW(), 'netbanking', 1599.00, 3),
('2024070013', 21, NOW(), 'cod', 2999.00, NULL),
('2024070014', 22, NOW(), 'card', 3150.00, 1),
('2024070015', 23, NOW(), 'upi', 850.00, NULL),
('2024070016', 24, NOW(), 'netbanking', 1200.00, 4),
('2024070017', 25, NOW(), 'cod', 1475.00, 5),
('2024070018', 26, NOW(), 'card', 3350.00, NULL),
('2024070019', 27, NOW(), 'upi', 2225.00, 2),
('2024070020', 28, NOW(), 'netbanking', 1999.00, NULL);


INSERT INTO order_item (order_id, item_id, quantity, price) VALUES
-- Order 1
(1, 41, 1, 1200.00),
(1, 42, 1, 1100.00),

-- Order 2
(2, 43, 1, 2300.00),

-- Order 3
(3, 44, 2, 725.00),

-- Order 4
(4, 45, 1, 2999.00),

-- Order 5
(5, 46, 1, 1200.00),

-- Order 6
(6, 47, 2, 900.00),

-- Order 7
(7, 48, 1, 3200.00),

-- Order 8
(8, 49, 1, 1980.00),

-- Order 9
(9, 50, 1, 900.00),

-- Order 10
(10, 51, 1, 1500.00),
(10, 52, 1, 1250.00),

-- Order 11
(11, 53, 1, 1890.00),

-- Order 12
(12, 54, 1, 2599.00),

-- Order 13
(13, 55, 1, 990.00),

-- Order 14
(14, 56, 1, 1999.00),

-- Order 15
(15, 57, 2, 1600.00),

-- Order 16
(16, 58, 1, 1450.00),

-- Order 17
(17, 59, 1, 1680.00),

-- Order 18
(18, 60, 1, 1985.00),

-- Order 19
(19, 61, 1, 1850.00),

-- Order 20
(20, 62, 1, 2120.00),

-- Order 21
(21, 63, 1, 1320.00),

-- Order 22
(22, 64, 1, 980.00),

-- Order 23
(23, 65, 1, 2450.00),

-- Order 24
(24, 66, 1, 1700.00),

-- Order 25
(25, 67, 1, 1599.00),

-- Order 26
(26, 68, 1, 2999.00),

-- Order 27
(27, 69, 1, 3150.00),

-- Order 28
(28, 70, 1, 850.00),

-- Order 29
(29, 71, 1, 1200.00),

-- Order 30
(30, 72, 1, 1475.00),

-- Order 31
(31, 73, 1, 3350.00),

-- Order 32
(32, 74, 1, 2225.00),

-- Order 33
(33, 75, 1, 1999.00),

-- Order 34
(34, 76, 1, 1999.00);
INSERT INTO feedback (customer_id, order_id, feedback, rating)
VALUES
('2024070001', 1, 'Smooth delivery and great quality!', 4.8),
('2024070001', 2, 'Loved the items, worth the price.', 4.5),
('2024070002', 3, 'Good offers and fast checkout.', 4.2),
('2024070002', 4, 'Packaging was a bit poor.', 3.5),
('2024070003', 5, 'Excellent service, will buy again.', 5.0),
('2024070003', 6, 'Items arrived slightly late.', 3.9),
('2024070004', 7, 'Very satisfied with the purchase.', 4.6),
('2024070004', 8, 'Had some issues with payment.', 3.8),
('2024070005', 9, 'Good quality items.', 4.1),
('2024070005', 10, 'Amazing deal with the coupon.', 4.9),
('2024070006', 11, 'Quick delivery, decent packaging.', 4.3),
('2024070006', 12, 'Could improve app experience.', 3.7),
('2024070007', 13, 'Great for gifting!', 4.4),
('2024070007', 14, 'Smooth ordering process.', 4.6),
('2024070008', 15, 'Top-notch quality.', 4.9),
('2024070008', 16, 'Nice UI, easy to navigate.', 4.5),
('2024070009', 17, 'Product didn’t match image.', 3.2),
('2024070009', 18, 'Helpful customer support.', 4.0),
('2024070010', 19, 'Delivered ahead of time!', 4.7),
('2024070010', 20, 'Satisfied with my purchase.', 4.4),
('2024070006', 21, 'Repeat customer, very happy.', 4.8),
('2024070007', 22, 'Loved the variety.', 4.5),
('2024070008', 23, 'Packaging was okay.', 3.9),
('2024070009', 24, 'Expected better quality.', 3.4),
('2024070010', 25, 'Really fast delivery.', 4.7),
('2024070011', 26, 'Good order tracking system.', 4.2),
('2024070012', 27, 'Everything was smooth and easy.', 4.6),
('2024070013', 28, 'Order came slightly damaged.', 2.8),
('2024070014', 29, 'Excellent and reliable.', 5.0),
('2024070015', 30, 'Average packaging but good value.', 3.9),
('2024070016', 31, 'Quick and simple checkout.', 4.3),
('2024070017', 32, 'Product is fine but late.', 3.5),
('2024070018', 33, 'Very happy with service.', 4.8),
('2024070019', 34, 'The coupon worked great!', 4.7),
('2024070020', 35, 'First order, fully satisfied.', 4.5);




INSERT INTO user_logins (user_id, login_time)
VALUES
-- Buyer logins
(1, '2025-07-13 09:12:00'),
(1, '2025-07-14 10:30:00'),
(2, '2025-07-15 08:45:00'),
(3, '2025-07-14 19:20:00'),
(4, '2025-07-13 12:55:00'),
(5, '2025-07-15 11:40:00'),
(6, '2025-07-14 15:00:00'),
(7, '2025-07-13 08:00:00'),
(8, '2025-07-15 07:45:00'),
(9, '2025-07-14 18:30:00'),
(10, '2025-07-13 17:10:00'),
(11, '2025-07-13 08:30:00'),
(11, '2025-07-15 10:05:00'),
(12, '2025-07-14 09:15:00'),
(12, '2025-07-15 12:40:00'),
(13, '2025-07-13 16:10:00'),
(13, '2025-07-14 11:55:00'),
(14, '2025-07-15 13:20:00'),
(15, '2025-07-13 07:50:00'),
(15, '2025-07-14 14:35:00'),
(16, '2025-07-15 15:25:00'),
(17, '2025-07-13 17:45:00'),
(17, '2025-07-14 18:10:00'),
(18, '2025-07-15 08:00:00'),
(19, '2025-07-13 10:30:00'),
(19, '2025-07-15 09:50:00'),
(20, '2025-07-14 07:35:00'),
(20, '2025-07-15 10:55:00'),

-- Seller logins
(21, '2025-07-14 08:00:00'),
(22, '2025-07-15 09:45:00'),
(23, '2025-07-13 14:00:00'),
(24, '2025-07-14 16:30:00'),
(25, '2025-07-15 12:00:00'),
(26, '2025-07-13 07:50:00'),
(27, '2025-07-14 11:25:00'),
(28, '2025-07-15 10:10:00'),
(29, '2025-07-13 13:15:00'),
(30, '2025-07-14 17:40:00');

INSERT INTO user_logins (user_id, login_time)
VALUES 
  -- Buyer logins (user_id: 1–20)
  (1, '2025-07-13 09:12:00'),
  (1, '2025-07-14 10:30:00'),
  (2, '2025-07-15 08:45:00'),
  (3, '2025-07-14 19:20:00'),
  (4, '2025-07-13 12:55:00'),
  (5, '2025-07-15 11:40:00'),
  (6, '2025-07-14 15:00:00'),
  (7, '2025-07-13 08:00:00'),
  (8, '2025-07-15 07:45:00'),
  (9, '2025-07-14 18:30:00'),
  (10, '2025-07-13 17:10:00'),
  (11, '2025-07-13 08:30:00'),
  (11, '2025-07-15 10:05:00'),
  (12, '2025-07-14 09:15:00'),
  (12, '2025-07-15 12:40:00'),
  (13, '2025-07-13 16:10:00'),
  (13, '2025-07-14 11:55:00'),
  (14, '2025-07-15 13:20:00'),
  (15, '2025-07-13 07:50:00'),
  (15, '2025-07-14 14:35:00'),
  (16, '2025-07-15 15:25:00'),
  (17, '2025-07-13 17:45:00'),
  (17, '2025-07-14 18:10:00'),
  (18, '2025-07-15 08:00:00'),
  (19, '2025-07-13 10:30:00'),
  (19, '2025-07-15 09:50:00'),
  (20, '2025-07-14 07:35:00'),
  (20, '2025-07-15 10:55:00'),

  -- Seller logins (user_id: 21–30)
  (21, '2025-07-14 08:00:00'),
  (22, '2025-07-15 09:45:00'),
  (23, '2025-07-13 14:00:00'),
  (24, '2025-07-14 16:30:00'),
  (25, '2025-07-15 12:00:00'),
  (26, '2025-07-13 07:50:00'),
  (27, '2025-07-14 11:25:00'),
  (28, '2025-07-15 10:10:00'),
  (29, '2025-07-13 13:15:00'),
  (30, '2025-07-14 17:40:00');

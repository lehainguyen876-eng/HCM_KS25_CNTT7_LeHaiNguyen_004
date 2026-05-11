create database hackathon;
use hackathon;

create table customer(
	customer_id varchar(5) primary key not null,
    customer_name varchar(100) not null,
    customer_email varchar(100) not null unique,
    customer_phone varchar(15) not null unique,
    customer_address varchar(255) not null
);

create table product (
	product_id varchar(5) primary key not null,
    product_name varchar(50) not null,
    product_price decimal(10,2) not null,
    category varchar(20) not null,
    stock_quantity int not null
);

create table orders (
	order_id int primary key not null auto_increment,
    customer_id varchar(5) not null,
    product_id varchar(5) not null,
    order_date date not null,
    order_quantity int not null,
    total_amount decimal(10,2) not null
);

create table payment (
	payment_id int primary key not null auto_increment,
    order_id int not null,
    payment_method varchar(50) not null,
    payment_date date not null,
    payment_stuatus varchar(50) not null
);

insert into customer(customer_id, custormer_name, customer_email, customer_phone, customer_address)
values
('C001','Nguyen Anh Tu','tu.nguyen@example.com','0987654321','Hanoi'),
('C002','Tran Thi Mai','mai.tran@example.com','0987654322','Ho Chi Minh'),
('C003','Le Minh Hoang','hoang.le@example.com','0987654323','Danang'),
('C004','Pham Hoang Nam','nam.pham@example.com','098654324','Hue'),
('C005','Vu Minh Thu','thu.vu@example.com','0987654325','Hai Phong');

insert into product(product_id, product_name,category,price, stock_quantity)
values
('P001','Laptop Dell','Electronics','15000.00','10'),
('P002','iphone 15','Electronics','20000.00','5'),
('P003','T-Shirt','Clothing','200.00','50'),
('P004','Running Shoes','Footwear','1500.00','20'),
('P005','Table Lamp','Furniture','500.00','15');

insert into orthers(customer_id, product_id,order_date,order_quantity, total_amount)
values
('C001','P001','2025-06-01',1,'15000.00'),
('C002','P003','2025-06-02',2,'400.00'),
('C003','P002','2025-06-03',1,'20000.00'),
('C001','P004','2025-06-03',1,'1500.00'),
('C005','P001','2025-06-04',2,'30000.00');

insert into payment(order_id, payment_date, payment_method, payment_status)
values
('2025-06-01','Banking','Paid'),
('2025-06-02','Cash','Paid'),
('2025-06-03','Credit Card','Paid'),
('2025-06-04','Banking','Pending'),
('2025-06-05','Credit Card','Paid');

update customer
set customer_phone = '0999888777'
where customer_id = 'C001';

update product
set stock_quality = stock_quality + 50 and product_price *1.1;

delete from payment 
where payment_status = 'Pending' and payment_method = 'Banking';

select product_id, product_name,product_price from product
where category ='Electronics';

select customer_name, customer_email, customer_address from customers
where name like 'Nguyen';

select order_id, order_date, total_amount from orders
order by  total_amount;

select * from  payment order by dob asc
limit 3;

select product_id, product_name
from products
limit 3
offset 1;
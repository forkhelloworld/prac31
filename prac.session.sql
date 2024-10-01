CREATE TABLE medicines (
    id serial PRIMARY KEY,
    active_ingredient varchar(100) NOT NULL CHECK(active_ingredient != ''),
    dosage real NOT NULL CHECK(dosage > 0)
);


CREATE TABLE prices (
    medicines_id int REFERENCES medicines(id),
    price real NOT NULL CHECK(price > 0),
    quantity INT NOT NULL CHECK(quantity > 0)
);


CREATE TABLE pharmacy (
    id serial PRIMARY KEY,
    name VARCHAR(256) NOT NULL CHECK(name != ''),
    phone_number varchar(20) NOT NULL CHECK (phone_number != '')
);


CREATE TABLE pharmacy_addresses(
    pharmacy_id int REFERENCES pharmacy(id),
    address varchar(256) NOT NULL CHECK(address != ''),
    PRIMARY key(pharmacy_id, address)
);


CREATE TABLE users (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    PRIMARY KEY (orders_id, medicines_id)
);


CREATE TABLE orders (
    id serial PRIMARY key,
    user_id int REFERENCES users(id),
    pharmacy_id int REFERENCES pharmacy(id),
    data date
);


CREATE TABLE orders_to_medicines (
    orders_id int REFERENCES orders(id),
    medicines_id int REFERENCES medicines(id),
    quantity int NOT NULL CHECK(quantity > 0)
);


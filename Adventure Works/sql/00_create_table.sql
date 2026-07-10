CREATE TABLE calendar (
    calendar_date DATE NOT NULL
);

CREATE TABLE territories (
    sales_territory_key SERIAL PRIMARY KEY,
    region VARCHAR(50),
    country VARCHAR(50),
    continent VARCHAR(50)
);

CREATE TABLE customers (
    customer_key SERIAL PRIMARY KEY,
    prefix VARCHAR(10),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    marital_status VARCHAR(50) NOT NULL
        CHECK (marital_status IN('M', 'S', 'Unknown')),
    gender VARCHAR(50) NOT NULL
        CHECK (Gender IN('M', 'F', 'Unknown')),
    email_address VARCHAR(50) NOT NULL UNIQUE,
    annual_income NUMERIC(10,2) NOT NULL
        CONSTRAINT positive_number CHECK (annual_income > 0),
    total_children NUMERIC NOT NULL,
    education_level VARCHAR(50) NOT NULL,
    occupation VARCHAR(50) NOT NULL,
    home_owner VARCHAR(50) 
);

CREATE TABLE product_categories (
    product_category_key SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE product_subcategories (
    product_subcategory_key SERIAL PRIMARY KEY,
    subcategory_name VARCHAR(50),
    product_category_key INTEGER NOT NULL
        REFERENCES product_categories(product_category_key)
        ON DELETE CASCADE
);

CREATE TABLE products (
    product_key SERIAL PRIMARY KEY,
    product_subcategory_key INTEGER NOT NULL
        REFERENCES product_subcategories(product_subcategory_key),
    product_s_k_u VARCHAR(50) NOT NULL UNIQUE,
    product_name VARCHAR(100) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    product_color VARCHAR(50),
    product_size VARCHAR(50),
    product_style VARCHAR(50),
    product_cost NUMERIC(10,2) NOT NULL,
    product_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE returns (
    return_date DATE NOT NULL,
    territory_key INTEGER NOT NULL
        REFERENCES territories(sales_territory_key),
    product_key INTEGER NOT NULL
        REFERENCES products(product_key),
    return_quantity INTEGER NOT NULL
);

CREATE TABLE sales (
    sales_key SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    stock_date DATE NOT NULL,
    order_number VARCHAR(40) NOT NULL,
    customer_key INTEGER NOT NULL
        REFERENCES customers(customer_key),
    product_key INTEGER NOT NULL
        REFERENCES products(product_key),
    territory_key INTEGER NOT NULL
        REFERENCES territories(sales_territory_key),
    order_line_item INTEGER NOT NULL,
    order_quantity INTEGER
);
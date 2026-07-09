CREATE TABLE calendar (
    CalendarDate DATE NOT NULL
);

CREATE TABLE customers (
    CustomerKey SERIAL PRIMARY KEY,
    Prefix VARCHAR(10),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    MaritalStatus VARCHAR(5) NOT NULL
        CHECK (MaritalStatus IN("M", "S")),
    Gender VARCHAR(5) NOT NULL
        CHECK (Gender IN("M", "F")),
    EmailAddress VARCHAR(50) NOT NULL UNIQUE,
    AnnualIncome NUMERIC(10,2) NOT NULL
        CONSTRAINT positive_number CHECK (AnnualIncome > 0),
    TotalChildren NUMERIC NOT NULL,
    EducationLevel VARCHAR(20) NOT NULL,
    Occupation VARCHAR(20) NOT NULL,
    HomeOwner VARCHAR(20) 
);

CREATE TABLE product_categories (
    ProductCategoryKey SERIAL PRIMARY KEY,
    CategoryName VARCHAR(20)
);

CREATE TABLE product_subcategories (
    ProductSubCategoryKey SERIAL PRIMARY KEY,
    SubCategoryName VARCHAR(20),
    ProductCategoryKey INTEGER NOT NULL
        REFERENCES product_categories(ProductCategoryKey)
        ON DELETE CASCADE,
);

CREATE TABLE products (
    ProductKey SERIAL PRIMARY KEY,
    ProductSubCategoryKey INTEGER NOT NULL
        REFERENCES product_subcategories(ProductSubCategoryKey),
    ProductSKU VARCHAR(50) NOT NULL UNIQUE,
    ProductName VARCHAR(100) NOT NULL,
    ModelName VARCHAR(100) NOT NULL,
    ProductDescription VARCHAR(100),
    ProductColor VARCHAR(50),
    ProductSize VARCHAR(50),
    ProductStyle VARCHAR(50),
    ProductCost NUMERIC(10,2) NOT NULL,
    ProductPrice NUMERIC(10,2) NOT NULL
);

CREATE TABLE returns (
    ReturnDate DATE NOT NULL,
    SalesTerritoryKey INTEGER NOT NULL
        REFERENCES territories(SalesTerritoryKey),
    ProductKey INTEGER NOT NULL
        REFERENCES products(ProductKey)
    ReturnQuantity INTEGER NOT NULL
);

CREATE TABLE sales (
    SalesKey SERIAL PRIMARY KEY,
    OrderDate DATE NOT NULL,
    StockDate DATE NOT NULL,
    OrderNumber INTEGER NOT NULL,
    CustomerKey INTEGER NOT NULL
        REFERENCES customers(CustomerKey),
    ProductKey INTEGER NOT NULL
        REFERENCES products(ProductKey),
    SalesTerritoryKey INTEGER NOT NULL
        REFERENCES territories(SalesTerritoryKey),
    OrderLineItem INTEGER NOT NULL,
    OrderQuantity INTEGER
);

CREATE TABLE territories (
    SalesTerritoryKey SERIAL PRIMARY KEY,
    Region VARCHAR(50),
    Country VARCHAR(50),
    Continent VARCHAR(50)
);
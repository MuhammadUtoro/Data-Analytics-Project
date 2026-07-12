# AdventureWorks Sales Analytics Project

## Project Overview

This project demonstrates an end-to-end data analytics workflow using the AdventureWorks dataset.

The goal is to transform raw business data into meaningful insights by building a complete analytics pipeline:

1. **Data Extraction and Transformation using Python**
2. **Data Loading into PostgreSQL**
3. **Business Analysis using SQL**
4. **Data Visualization using Tableau**
5. *(Future Expansion)* Predictive Modeling using Machine Learning

The project simulates a real-world analytics workflow where raw transactional data is cleaned, modeled, analyzed, and presented to support business decision-making.

---

# Dataset

The project uses the AdventureWorks dataset containing sales, customer, product, territory, and return information.

# 1. Data Engineering (Python ETL)

## Extraction

Raw CSV files were imported using Python and Pandas.

The extraction process loads each dataset into DataFrames for further processing.

## Transformation

The cleaning pipeline includes:

* Removing duplicate records
* Standardizing date columns
* Handling missing values
* Validating data types
* Checking primary key uniqueness
* Ensuring referential integrity between tables

---

# 2. Database Design (PostgreSQL)

The cleaned datasets were loaded into PostgreSQL.

Foreign key relationships were created to maintain data integrity.

# 3. SQL Business Analysis

SQL was used to answer business questions and prepare analytical datasets.

Business questions explored:

* Which products generate the most revenue?
* Which categories perform best?
* Which products have high return rates?

Techniques used:

* Aggregations
* Joins
* Ranking functions
* Window functions
* Date analysis

---

# 4. Tableau Visualization

The SQL results were visualized using Tableau dashboards.

## Executive Sales Dashboard

Designed for business stakeholders.

Key metrics:

* Total Revenue
* Total Profit
* Total Orders

Visualizations:

* Monthly revenue trend
* Revenue by territory
* Revenue by category
* Top products by revenue

---

# Key Business Metrics

## Revenue

```
Order Quantity × Product Price
```

## Cost

```
Order Quantity × Product Cost
```

## Profit

```
Revenue - Cost
```

## Profit Margin

```
Profit / Revenue
```

## Return Rate

```
Returned Quantity / Sold Quantity
```

---

# Tools Used

| Tool       | Purpose                       |
| ---------- | ----------------------------- |
| Python     | ETL and data cleaning         |
| Pandas     | Data manipulation             |
| PostgreSQL | Database storage and querying |
| SQLAlchemy | Database connection           |
| SQL        | Business analysis             |
| Tableau    | Visualization                 |
| Git        | Version control               |

---

# Future Improvements

## Machine Learning Expansion

The project can be extended with predictive analytics.

Possible implementations:

## Customer Segmentation (KNN)

Using customer attributes:

* Annual Income
* Total Children
* Purchase Frequency
* Total Spending

Possible outcome:

* Identify similar customer groups
* Support targeted marketing strategies

---

# Conclusion

This project demonstrates an end-to-end analytics workflow:

**Raw Data → ETL → Database → SQL Analysis → Visualization → Predictive Analytics**

It combines data engineering, analytical SQL, and business intelligence techniques to transform raw transactional data into actionable insights.

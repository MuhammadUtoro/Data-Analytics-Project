# 🛒 Superstore Sales Analysis Project

## 📌 Project Overview

This project analyzes the **Superstore Dataset**, a retail transactional dataset containing sales, profit, customer, and shipping information.

The goal is to transform raw sales data into **actionable business insights** that help understand:
- What drives sales and profitability
- Which products, regions, and customers perform best
- Where losses occur and why
- How business performance changes over time

This is an end-to-end data analytics project covering **data cleaning, SQL analysis, Python EDA, and data visualization (Tableau)**.

---

## 🎯 Business Problem

A retail company wants to improve profitability and better understand its operations.

Although sales are strong, profit performance varies significantly across products, regions, and customer segments.

The company wants to answer:

- Which products and categories are most profitable?
- Which regions and states underperform?
- Which customers contribute the most value?
- Are there products with high sales but low profit?
- How do sales and profit change over time?

---

## 🧰 Tools & Technologies

This project uses the following tools:

- **Excel** → Initial data exploration and validation  
- **Python (Jupyter Notebook)** → Data cleaning & exploratory data analysis  
  - Pandas  
  - NumPy  
  - Matplotlib  
- **SQL (PostgreSQL)** → Data querying and business analysis  
- **Tableau** → Interactive dashboards and visual storytelling  

---

## 📊 Dataset Information

- Source: Superstore dataset (retail transactions)
- Rows: ~9,994 records
- Key fields:
  - Order ID
  - Order Date
  - Product Name
  - Category / Sub-Category
  - Sales
  - Quantity
  - Discount
  - Profit
  - Region / State
  - Customer Segment

---

## 🔍 Project Workflow

### 1. Data Cleaning
- Handled encoding issues (latin1 / cp1252)
- Checked missing values and data types
- Standardized column formats

### 2. Exploratory Data Analysis (Python)
- Sales and profit distribution
- Category and sub-category performance
- Customer segment behavior
- Time-based trends

### 3. SQL Analysis (PostgreSQL)
- Aggregated sales and profit by category, region, and segment
- Identified top-performing and underperforming products
- Calculated profit margins
- Ranked products within categories

### 4. Data Visualization (Tableau)
- Sales and profit dashboards
- Regional performance analysis
- Category-level profitability comparison
- Time series analysis

---

## 📈 Key Analysis Areas

This project answers key business questions such as:

### 💰 Sales Performance
- Which regions generate the highest revenue?
- Which categories dominate total sales?

### 📉 Profitability Analysis
- Which products generate losses?
- Which categories have low profit margins?

### 👥 Customer Insights
- Which customer segments are most valuable?
- How do different segments contribute to profit?

### 📦 Product Performance
- What are the top-selling products?
- Which products are over-discounted and unprofitable?

### ⏱️ Time Trends
- How do sales and profit evolve over time?
- Are there seasonal patterns in revenue?

---

## 📊 Insights 

- The number of items sold, sales, and profit are increasing each year
- The average profit per order is $57.18
- Office supplies make 60% of total sales
- Staple envelope is the most profitable product with a contribution of almost 44% of total profit

---
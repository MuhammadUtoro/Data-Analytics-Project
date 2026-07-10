from extract import load_csv
from transform import table_profile, clean_table, combine_sales, rename_col, to_numeric, standardize_columns
from load import load_table, engine

# Iterate through the files and rename the file for sql tables
FILE_PREFIX = 'AdventureWorks_'
EXTENSION = '.csv'
FILE_PATH = 'data/'

table_names = [
    'Calendar',
    'Customers',
    'Product_Categories',
    'Product_Subcategories',
    'Products',
    'Returns',
    'Sales_2015',
    'Sales_2016',
    'Sales_2017',
    'Territories'
]

tables = {
    f"{FILE_PREFIX}{table}{EXTENSION}": table.lower()
    for table in table_names
}

LOAD_ORDER = [
    "calendar",
    "territories",
    "customers",
    "product_categories",
    "product_subcategories",
    "products",
    "sales",
    "returns"
]

dataframes = {} 

# Observe the data
for filename, table_name in tables.items():
    # Load CSV files
    df = load_csv(FILE_PATH, filename)
    # Clean Raw data
    df = clean_table(df, table_name)
    # Convert to numeric
    df = to_numeric(df, table_name)
    # lower_case_snake 
    df = standardize_columns(df)
    table_profile (df, table_name)

    dataframes[table_name] = df

# Combine sales_2015, sales_2016, sales_2017 into one table sales
sales = combine_sales(dataframes)
dataframes['sales'] =  sales

dataframes['calendar'] = rename_col(
    dataframes['calendar'],
    {"date": "calendar_date"}
) 

print(dataframes["calendar"].columns)

# for table_name in LOAD_ORDER:
#     load_table(
#         dataframes[table_name],
#         table_name,
#         engine
#     )

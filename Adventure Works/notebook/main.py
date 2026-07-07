from extract import load_csv
from transform import table_profile, clean_data
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

# Observe the data
for filename, table_name in tables.items():
    df = load_csv(FILE_PATH, filename)
    table_profile (df, table_name)
    df = clean_data(df, table_name)

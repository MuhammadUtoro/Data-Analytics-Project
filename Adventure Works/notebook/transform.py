import pandas as pd
# Check data profile
def table_profile(df, table_name):
    print(f"\nTable: {table_name.upper()}")
    
    # Shape
    print(f"Shape: {df.shape}")

    # Columns
    print("\nColumn(s):")
    print(df.columns.tolist())

    # Null-values
    print("\nMissing Values:")
    print(df.isnull().sum())

    # Data types
    print("\nData Types:")
    print(df.dtypes)

# Clean data
def clean_table(df_raw, table_name):
    df_raw = df_raw.drop_duplicates()
    for cols in df_raw.columns:
        if 'date' in cols.lower():
            df_raw[cols] = pd.to_datetime(df_raw[cols], errors='coerce')
    df_cleaned = df_raw.dropna()
    return df_cleaned


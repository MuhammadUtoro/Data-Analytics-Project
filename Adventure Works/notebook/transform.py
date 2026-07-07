# Check data profile
def table_profile(df, table_name):
    print(f"\nTable: {table_name}")
    
    # Shape
    print(f"Shape: {df.shape}")

    # Null-values
    print("\nMissing Values:")
    print(df.isnull().sum())

    # Data types
    print("\nData Types:")
    print(df.dtypes)

# Clean data
def clean_data(df, table_name):
    df = df.drop_duplicates()

    return df
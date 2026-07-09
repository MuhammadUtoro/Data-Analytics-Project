from sqlalchemy import create_engine

username = "postgres"
password = "admin"
host = "localhost"
port = "5432"
db = "adventureworks"

engine =  create_engine(
    f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{db}"
)

with engine.connect() as conn:
    print("Database connection successful!")

def load_table(df, table_name, engine):
    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="append",
        index=False
    )

    print(f"{table_name}: {len(df)} rows loaded!\n")
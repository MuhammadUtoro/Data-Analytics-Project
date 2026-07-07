# Create a function to extract data
import pandas as pd
import os

def load_csv(file_path, file_name):
    file = os.path.join(file_path, file_name) 
    return pd.read_csv(file, encoding='latin1')

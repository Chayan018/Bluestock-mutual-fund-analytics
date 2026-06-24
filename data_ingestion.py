# data_ingestion.py

import pandas as pd
import os

path = "data/raw"

for file in os.listdir(path):
    if file.endswith(".csv"):
        df = pd.read_csv(os.path.join(path, file))

        print("\n", "="*50)
        print("File:", file)

        print("Shape:")
        print(df.shape)

        print("\nData Types:")
        print(df.dtypes)

        print("\nFirst 5 Rows:")
        print(df.head())
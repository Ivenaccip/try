import pandas as pd 

root='profiles.xlsx'

df=pd.read_excel(root)

root_csv='profiles.csv'

df.to_csv(root_csv, index=False)

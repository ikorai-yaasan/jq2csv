import pandas as pd

df1 = pd.read_csv('j1.csv', names=('iid', 'col1-1'))
df2 = pd.read_csv('j2.csv', names=('iid', 'col2-1'))

df = pd.merge(df1, df2)

df.to_csv('to_csv_out.csv', index=False)

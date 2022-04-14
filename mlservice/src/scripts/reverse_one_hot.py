import pandas as pd

# pd.set_option('display.max_columns', None)

k_means = pd.read_pickle('../modules/k_means.pkl')

for index, col in enumerate(k_means.columns):
    print(f'{index}\t{col}')

print(f'\nk_means ({k_means.shape}):\n{k_means}')

print('\nk_means[0]:\n', k_means.iloc[0, :])

cities = k_means.iloc[:, 0:415].idxmax(1)
zip_codes = k_means.iloc[:, 415:863].idxmax(1)
county_no = k_means.iloc[:, 863:962].idxmax(1)

df = pd.DataFrame(data={
    'cities': cities,
    'zip_codes': zip_codes,
    'county_no': county_no
})

averages = k_means.iloc[:, 8722:8725]
df = df.join(averages)

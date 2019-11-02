import pandas as pd
import requests
import json
import time

#import CSV
ISOs = pd.read_csv('ISOs.csv')
ISOs = ISOs.rename(columns={'Unnamed: 0':'Country', '0':'ISO'})

CNF_df = ISOs.loc[ISOs['ISO'] == 'CNF'].copy()

#individual google search for the missing countries
correct_ISO = ['TWN','KOR', 'CYP', 'HKG', 'PSE', 'COG', 'COD']

CNF_df['ISO'] = correct_ISO

ISOs = ISOs[ISOs['ISO'] != 'CNF']
ISOs = pd.concat([ISOs, CNF_df])
ISOs = ISOs.sort_index()

print(ISOs)

ISOs.to_csv(r'ISOs-clean.csv')


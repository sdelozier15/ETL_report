import pandas as pd
import requests
import json
import time

#import CSV
happiness = pd.read_csv('2017.csv')

#pull list of countries from the dataframe
countries = happiness['Country'].tolist()

#create empty list for ISO codes
ISO = {}
skip = []

#url for Rest Countries API
url = 'https://restcountries.eu/rest/v2/name/'

for country in countries:
    try:
        time.sleep(.5)
        response = requests.get(url + country).json()
        info = response[0]['alpha3Code']
        ISO.update({country:info})
        print(f'{country}:{info}')
    except KeyError:
        skip.append(country)
        ISO.update({country:'CNF'})
        print(f'{country} not found')

ISOs = pd.DataFrame.from_dict(ISO, orient='index')
ISOs.to_csv(r'ISOs.csv')

print(ISO)
print(skip)
print(ISOs)




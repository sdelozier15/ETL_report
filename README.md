# ETL_report

Refugee Resettlement & World Happiness Report

Goal: Examine push and pull factors in refugee resettlement. (2017)

Sources: 
UNHCR Resettlement Data Finder - https://rsq.unhcr.org/en/#BsP8
World Happiness Report 2017 - https://www.kaggle.com/unsdsn/world-happiness
Country Codes -  http://restcountries.eu/#api-endpoints-name

Summary ERD: 
Made ERD on: https://app.quickdatabasediagrams.com/#/
Retyped column names from sql query and identified foreign keys and primary keys
Saved as: “resettle_ERD.png”




Resettlement Data:
Pulled data as CSV from UNHCR Resettlement Data Finder.
Opened CSV in Excel to examine raw data.
Removed extraneous information at the top and bottom of file.
Deleted “Country of Asylum” and “Country of Asylum (ISO)” columns (empty columns with no relevant data).
Saved CSV as “resettlement_data.csv”
Imported CSV to Pandas; renamed columns.  See code in “resettlement_cleaning.ipynb”
Exported new dataframe to CSV: “clean_resettlement_df.csv”
Exported bar chart showing number of people resettled from each country of origin: “refugee_numbers.png”
In Excel, removed the index column.


World Happiness Data:
Saved CSV from Kaggle. “2017.csv”
Imported CSV table to Pandas for cleaning: “clean_happiness_to_csv.ipynb”
Removed columns ‘whisker’, added column ‘Year_data’ identifying all data as being from 2017 - in case future research needs this identifier.
Renamed columns using df.rename for SQL.
Saved new dataframe as CSV: “cleaned_happiness_reports.csv”
In Excel, removed the index column created from csv export.



Country Codes:
Utilized the code in ‘ISO.py”
Imported 2017 World Happiness data CSV: “2017.csv”
Requested from Rest Countries API for the 3 character ISO code for the country names in the CSV in order to match with the codes in Resettlement Data
http://restcountries.eu/#api-endpoints-name
Exported CSV as “ISOs.csv”
Countries which were not found were labeled ‘CNF’
Utilized the code in “ISO-Cleaner.py”
Imported “ISOs.csv” to Pandas
Manually searched on Google for the countries which had ‘CNF’ for the ISO code
Created a list and updated the DataFrame with corrected ISO codes
Exported “ISOs-clean.csv”
Removed index column in Excel

SQL Queries:
NOTE: file paths for the cleaned CSV files will need to be inserted into data import queries so they can run without errors. Data could also be imported manually.
Run “table_queries.sql” in blank database in pgAdmin4
DROP TABLE IF EXISTS for all table names
Create SQL table: clean_resettlement
Create SQL table: clean_happiness_scores
Create SQL table: clean_ISO
Import data from cleaned CSV files 

Tableau Visualization: 
Imported the three cleaned CSVs into Tableau
Generated a Symbols Map utilizing Country of Origin (ISO) from the resettlement data as text, the happiness rank as color, and used the ISO code as a text label.
Saved as “ETL Data.twb” and “Picture2.png”

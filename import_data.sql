COPY clean_resettlement(Year, Origin_ISO, Origin_Country, Resettlement_ISO, Resettlement_Country, Total_Resettled) 
FROM 'clean_resettlement_df.csv' csv delimiter ',' header;

COPY clean_happiness_scores(Country, Happiness_rank, Happiness_score, GDP_per_capita, Family, Life_expectancy,
    Freedom, Generosity, Trust_gov, Year_data) 
FROM 'cleaned_happiness_reports.csv' csv delimiter ',' header;

COPY clean_iso(Country, ISO) 
FROM 'ISOs-clean.csv' csv delimiter ',' header;
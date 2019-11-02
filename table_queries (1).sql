DROP TABLE IF EXISTS clean_happiness_scores;
DROP TABLE IF EXISTS clean_iso;
DROP TABLE IF EXISTS clean_resettlement;

CREATE TABLE clean_resettlement (
    Year INT NOT NULL,
    Origin_ISO VARCHAR(100) NOT NULL,
    Origin_Country VARCHAR(100) NOT NULL,
    Resettlement_ISO VARCHAR(100) NOT NULL,
    Resettlement_Country VARCHAR(100) NOT NULL,
    Total_Resettled INT NOT NULL)
;

CREATE TABLE clean_happiness_scores (
    Country varchar(50) NOT NULL,
    Happiness_rank int NOT NULL,
    Happiness_score decimal NOT NULL,
    GDP_per_capita decimal NOT NULL,
    Family decimal NOT NULL,
    Life_expectancy decimal NOT NULL,
    Freedom decimal NOT NULL,
    Generosity decimal NOT NULL,
    Trust_gov decimal NOT NULL,
    Year_data INT NOT NULL,
    PRIMARY KEY (Country))
;

CREATE TABLE clean_iso (
    Country varchar(50) NOT NULL,
    ISO varchar(50) NOT NULL,
    PRIMARY KEY (Country))
;

COPY clean_resettlement(Year, Origin_ISO, Origin_Country, Resettlement_ISO, Resettlement_Country, Total_Resettled) 
FROM 'clean_resettlement_df.csv' csv delimiter ',' header
;

COPY clean_happiness_scores(Country, Happiness_rank, Happiness_score, GDP_per_capita, Family, Life_expectancy, Freedom, Generosity, Trust_gov, Year_data) 
FROM 'cleaned_happiness_reports.csv' csv delimiter ',' header
;

COPY clean_iso(Country, ISO) 
FROM 'ISOs-clean.csv' csv delimiter ',' header
;
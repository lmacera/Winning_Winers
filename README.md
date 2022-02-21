# Winning_Winers
Group Project
## Project Overview
Data analyst: Ryan Cramer, Leah Ikenberry, Lisa Macera, Leslie Mayeux, Krystin McKee
Group 2
Create a mockup of a database
- Tables
- Airline 
- Flight
- Causation
Will be joining databases by flight number
- Cancellation
- Delay 
- flight Actuals
- flight schedule
- encoded ML tables
Will be joining databases by flight number and index
Decide which technologies will be used.
- R
- Tableau
- Jupyter
- Python
- Machine learning
## Analysis Topic and Reasoning
We have decided to examine a dataset of flights during the early days of the COVID-19 pandemic (January to June 2020). We will be examining the percentage of flights that were delayed, and the primary causes of those delays (government restrictions, staffing shortages, mechanical issues, adverse weather, and others). We have all experienced these delays personally, or our close family or friends have been delayed and forced to book a new flight or forced to deal with an unexpected delay. We are attempting to determine if we can accurately predict delays before they happen.

## Data Set
We are going to be using the COVID-19 Airline Flight Delays and Cancelations data set from Kaggle.

https://www.kaggle.com/akulbahl/covid19-airline-flight-delays-and-cancellations?select=jantojun2020.csv

This data set contains approximately 11 million flights and contains detailed flight delay and cancellation data. The United States Department of Transportation Bureau of Transportation Statistics tracks on time performance of domestic flights operated by large air carriers. This data contains relevant flight information for our analysis; on-time, delayed, canceled and diverted flights.

## The questions we will answer:
We are attempting to predict the percentage likelihood of a flight being canceled by training a machine learning model with our data set. We are also looking to determine the largest causation of delay or cancelation with in our data set (i.e. staffing issues, mechanical issues, adverse weather, or something unexpected). We are also looking to determine the ideal time and day of the week to schedule a flight to avoid as many delays as possible. We may also attempt to add current weather data to our model to increase the accuracy of our model.

## Dashboard
The main tool we will be using for our dashboard is Tableau. Instead of creating an interactive dashboard, we will be exporting screenshots of our analysis so that we can imbed them into our presentation for a cohesive and effective story.
## Google Slides Presentation Link
https://docs.google.com/presentation/d/1P19V19i7VjQFV2h0O-d2SU_5dwpZlarhB_ilmC1GpcY/edit?usp=sharing


## Machine Learning Model

### Preliminary Preparation

The data for this project was taken off of Kaggle.com and contains information about 11 million flights in the United States. This data will be used to try and understand what factors can contribute to a flight being delayed. In order to make this data usuable for machine learning model, all of the null values were removed and unnecessary columns were dropped. All of the originating flights by their location were examined and there was a large discrepancy in the numbers so the origination locations with less than 100,000 flights were grouped into an "other" column. The originated locations were then one-hot encoded. The destination locations were also slimmed down into an "other" column if they had less than 100,000 flights. The destination location columns were also one-hot encoded. All of the carrier codes were one-hot encoded as well as the cancellation codes.

#### Feature Selection

For this project, there was already a column with binary values for if a flight was cancelled or not. This column provides the opportunity to run a logistic regression model and all of the other cleaned columns could be used to provide factors to decide of a flight will be cancelled or not.  

## Training and Testing Split

The data for this model will be split using the train_test_split function from the sklearn.model_selection library. Since there is a lot of data in this dataset the data can be split into a 75% training set and a 25% testing set.

## Model Choice

Since all of the data is labeled with outcomes of each flight, a supervised machine learning model would be appropiate for this project and since there is a binary outcome column with delayed flight information this data is already set up for a logistic regression model. However, since there are potentially a very large number of input values, if the logistic regression model is not a good fit, random forest model might be used to more accurately represent the data at hand.

### Testing the Model

Using the mock data from the previous week, which is the first fifty rows of the entire dataset, this model was split into training and testing groups. However, the model could not be run since there was only one instance of a flight not being cancelled instead of at least 2 in this mock dataset. This problem will easily be fixed with when the full dataset is being use for this model. At this time there is no accuracy score or imbalanced classification report that can be reported at this time but the script is set up to run and print all of the required elements. This was run in the Testing_regression_model.ipynb

### Generated Data

When using generated data to test the basic format of the logistic regression model in the logistic_regression_model.ipynb, the model is able to perfectly classify each data point into its group. This just shows how the model should run when all of the actual data is correctly formatted.

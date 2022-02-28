# Machine Learning Model

## Preliminary Preparation

The data for this project was taken off of Kaggle.com and contains information about 11 million flights in the United States. This data will be used to try and understand what factors can contribute to a flight being delayed. In order to make this data usuable for machine learning model, all of the null values were removed and unnecessary columns were dropped. All of the originating flights by their location were examined and there was a large discrepancy in the numbers so the origination locations with less than 100,000 flights were grouped into an "other" column. The originated locations were then one-hot encoded. The destination locations were also slimmed down into an "other" column if they had less than 100,000 flights. The destination location columns were also one-hot encoded. All of the carrier codes were one-hot encoded as well as the cancellation codes.

### Feature Selection

For this project, all of the data was labeled with outcomes and there was already a column with binary values for if a flight was delayed or not (DEP_DEL15). This column provides the opportunity to run a logistic regression model and all of the other cleaned and encoded columns could be used to provide factors to decide of a flight will be delayed or not. Some of the variables used to determine if a flight is delayed will be the origin of the flight, the airline, the date and the time of departure.

## Training and Testing Split

The data for this model will be split using the train_test_split function from the sklearn.model_selection library. Since there is a lot of data in this dataset the data can be split into a 75% training set and a 25% testing set. If there is a real imbalance between the delayed and non-delayed flights, once the data has been cleaned, various methods of sampling will be used to try and find the best fit.

## Model Choice

Since all of the data is labeled with outcomes of each flight, a supervised machine learning model would be appropiate for this project and since there is a binary outcome column with delayed flight information this data is already set up for a logistic regression model (dep_del15). However, since there are potentially a very large number of input values, if the logistic regression model is not a good fit, random forest model might be used to more accurately represent the data at hand.

### Testing the Model

It took a good amount of time to clean the entire dataset and figure out a way to store the dataset in AWS and merge the appropiate tables in SQL. The final dataset was successfully loaded and separated into training and testing sets and scaled. However there is currently a problem with the number of samples (Found input variables with inconsistent numbers of samples: [80316015, 2745847]) which will be address shortly. This means that there is still no accuracy score or imbalanced classification report. However there has been good progress made with getting the data ready to go into the model. This was all done in the "Real_data_model_test.ipynb".

### Generated Data

When using generated data to test the basic format of the logistic regression model in the logistic_regression_model.ipynb, the model is able to perfectly classify each data point into its group. This just shows how the model should run when all of the actual data is correctly formatted.

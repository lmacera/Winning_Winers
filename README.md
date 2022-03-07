# Perpetually Delayed
## Project Overview
**Data analyst**: Ryan Cramer, Leah Ikenberry, Lisa Macera, Leslie Mayeux, Krystin McKee

Through out the COVD-19 Pandemic, many companies, and individuals experienced changes to operations and often faced issues with supply chains and staffing shortages. One industry severely impacted by the effects of COVID-19 was the airline industry, forced to cancel, restrict, and delay flights because of various issues caused by the pandemic. Using a dataset of over 3 million flights from before and during the COVID pandemic, January 2020- June 2020, our team has examined the main causes of flight cancellations before and after the COVID-19 Pandemic. Through a machine learning logistic regression our team attempted to accurately predict when a flight will be delayed and or cancelled.

## Resources

-	Data Source: https://www.kaggle.com/akulbahl/covid19-airline-flight-delays-and-cancellations?select=jantojun2020.csv  (This data set contains approximately 3 million flights and contains detailed flight delay and cancellation data. The United States Department of Transportation Bureau of Transportation Statistics tracks on time performance of domestic flights operated by large air carriers. This data contains relevant flight information for our analysis; on-time, delayed, canceled and diverted flights.)
-	Software: Python (Jupyter Notebook), SQL, Tableau, AWS, and GoogleDocs
-	Stored cleaned data: https://s3.console.aws.amazon.com/s3/buckets/final-project77?region=us-east-1&tab=objects 
-	Presentation: https://docs.google.com/presentation/d/1P19V19i7VjQFV2h0O-d2SU_5dwpZlarhB_ilmC1GpcY/edit?usp=sharing 
-	Dashboard: 

## Flight Analysis

### Cleaning the Data

With the dataset containing over 3 million rows of flight data our team used Python to clean the dataset. Removing over 20 rows of information that we did not consider pertinent to our analysis. The following steps were taken to obtain our two analysis tables for flight scheduled delays and flight scheduled cancellations:
-	Removed all NAN values and replaced with 0. Our team did not remove the NAN values as doing so removed a significant amount of data.
-	Replaced all string data with integers
-	Performed density analysis to bucket the origination and destination cities
-	Encoded the cancellation response, delay reasons, airline carrier names, destination state name, and origination state name, to run through the machine learning model.

### Dataset Analysis

##### Assumptions

Though our team was able to use a lot of the raw data provided our biggest assumptions were:
-	Replacing all NAN values with 0. For example, we assumed that if a cancellation row was blank then the flight was not cancelled and thus, we entered a 0 instead of a 1.
-	For each flight that was delayed there were multiple reasons for delay, in minutes. To analysis the primary cause of delay we assigned the reason for delay to the highest minute delay reason. For example, if a flight was delayed by 5 minutes for security, 10 minutes for weather, and 20 minutes for late aircraft arrival we assumed that the delay reason was late aircraft arrival.
-
#### What the data told us

-	Busiest Airlines are:
      o	American Airlines
      o	Delta Airlines
      o	Southwest Airlines
      o	United Airlines
-	Busiest Destination and Origination states are
o	Texas 
o	California 
o	Florida 
o	Illinois 
o	Georgia 
o	North Carolina 
o	New York 
o	Colorado 
o	Virginia 
-	Primary causes for Delay and Cancellation
o	Delay:
	Carrier Delay ( i.e. maintenance, staffing)
	Late aircraft
	National Aviation System ( i.e. airport traffic, airport operations, and air traffic control).
o	Cancellation
	Security
	Carrier
-	Worst airlines for delays 
o	Allegiant Air
o	Frontier Airlines
o	Jet Blue
o	Spirit Airlines
-	Effects of COVID-19
o	Carrier delay increased from 36% of delays to 53%
o	Late Aircraft delays decreased from 34% to 20%
o	Security cancellations went from 75% to 95%

## Machine Learning Model

### Preliminary Preparation

The data for this project was taken off of Kaggle.com and contains information for over 2 million flights in the United States. This data was used to try and understand what factors can contribute to a flight being delayed or cancelled. In order to make this data useable for machine learning model, all of the null values were removed and unnecessary columns were dropped. All of the originating flights by their location were examined and there was a large discrepancy in the numbers so the origination locations with less than 100,000 flights were grouped into an "other" column. The originated locations were then one-hot encoded. The destination locations were also slimmed down into an "other" column if they had less than 100,000 flights. The destination location columns were also one-hot encoded. All of the carrier codes were one-hot encoded as well as the cancellation codes. Columns with unique information such as flight_id and mkt_carrier_fl_num were removed since they would not be beneficial to the model.

#### Feature Selection

For this project, all of the data was labeled with outcomes and there was already a column with binary values for if a flight was delayed or not ('dep_del15'). This column provides the opportunity to run a classification model such as a logistic regression or random forest model and all of the other cleaned and encoded columns could be used to provide factors to decide of a flight will be delayed or not. Some of the variables used to determine if a flight is delayed will be the origin of the flight, the airline, the date and the time of departure. There was also a binary column for if a flight was cancelled ('cancelled') or not which allows another analysis on cancelled flights with the same information.

### Training and Testing Split

The data for this model was split using the train_test_split function from the sklearn.model_selection library. Since there is a lot of data in this dataset the data can be split into a 75% training set and a 25% testing set. There was a huge discrepancy between the number of on-time flights (2476064) and delayed flights (269783) meaning that a sampling method needed to be used to address the discrepancy. There was a similar problem for cancelled flights (282926) and non-cancelled flights (2462921). Naive Random Oversampling was chosen as a sampling method for both the cancelled and delayed models.

### Model Choice

All of the data is labeled with outcomes of each flight, a supervised machine learning model was appropriate for this project. Since there is a binary outcome column with delayed flight information this data is set up for a logistic regression model and or a random forest model. A logistic regression model was chosen because it is an intuitive model that often gives clear outcomes. A risk our team considered when choosing a logistic regression was that the results may be since there are so many features’ beings used for this analysis. A random forest classifier model will be used in the case that the logistic regression model is not adequate. A random forest model is beneficial since it can take a lot of input features, can handle a large dataset more efficiently than other models and reduces the chance of overfitting. One disadvantage is that a random forest model is harder to interpret and relies on feature importance to explain it.

#### Testing the Model

It took a good amount of time to clean the entire dataset and figure out a way to store the dataset in AWS and merge the appropriate tables in SQL. The final dataset was successfully loaded and separated into training and testing sets and scaled. There were two completely different models run on the delayed flights and the cancelled flights. Naive random oversampling was chosen as the method for the logistic regression model due to time constraints.

##### Delayed Flights

- The delayed flights model was trained using naive random oversampling to address the difference in sample numbers and then put into a logistic regression model, the accuracy was a little over 62% (0.623469) and a confusion matrix and an imbalanced classification report were generated with the output below. 

![Accuracy of Logistic Regression for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Accuracy_lm_delay.png)

The confusion matrix showed that this model did have more true positives and true negatives than false positives and false negatives but there could be some improvement. 

![Confusion Matrix of LR for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Matrix_lm_delay.png) 

The imbalanced classification report showed that this model was much better at predicting on-time flights than delayed flights with a precision score of 87% and a recall score of 67% meaning that a delayed flight was correctly classified 67% of the time.

![Classification Report of LR for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Class_report_lm_delay.png) 

- Since the logistic regression model was not very successful at classifying delayed flights, a random forest classifier model was used and trained. The accuracy improved from 62% to 66% (0.667811).  The below results showed that this model was little better at classifying true values than the false values. 

![Accuracy of RF for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Accuracy_rf_delay.png)

 ![Confusion Matrix of RF for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Matrix_rf_delay.png) 

The classification report had very similar recall and precision scores to the logistic regression model. 

![Classification Report of RF for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Classreport_rf_delay.png) 

One of the features from the random forest model is a ranking of the importance of features to that model. This image shows the most important features which should be analyzed further to understand better what they mean.

![Top Features of RF for Delays](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Top_feats_rf_delay.png)

##### Cancelled Flights

- Just as with the delayed flights, the cancelled flights were tested with a logistic regression model after naive over sampling the data. The accuracy for this model was about 72% (0.721583), meaning that the model could correctly identify if a flight was cancelled or not 72% of the time. 

![Accuracy of LR for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Accuracy_lm_cancel.png) 

The confusion matrix showed that there were more true negatives and positives than false negatives and positives.

![Confusion Matrix of LR for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Matrix_lm_cancel.png) 

The recall score for this model was lower at almost 69% but the precision score show that the model was better at predicting if a flight would be on time than if it was cancelled.

![Classification Report of LR for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Classreport_lm_cancel.png) 

- After the logistic model did not return a very reliable model a random forest model was run on the cancelled data. The accuracy of this model was almost 90% (0.899691). This high accuracy score indicates that this model is good at predicting on-time vs cancelled flights. 

![Accuracy of RF for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Accuracy_rf_cancel.png) 

Here it is easy to see that almost all of the flights were correctly identified and labeled correctly.

![Confusion Matrix of RF for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Matrix_rf_cancel.png) 

The recall score for this model was 87% which means that a flight was identified as cancelled or on-time 87% of the time and a precision score of 93%. 

 ![Classification Report of RF for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Classreport_rf_cancel.png) 

Below are the top features ranked by importance for the random forest model. The top four features are the same as the ones from the delayed model but in a different order. Future analysis should be done on these features.

![Top Features of RF for Cancels](https://github.com/lmacera/Winning_Winers/blob/likenberry_branch/Resources/Top_feats_rf_cancel.png) 


### Model Conclusions

Overall, the random forest classifier models were better able to classify the data correctly than logistic regression. It was also easier to classify cancelled flights than delayed flights. The best accuracy score was from the random forest model for both cancelled and delayed flights. It was easier to classify cancelled than delayed flights. Future analysis would include testing other sampling methods and model that might more accurately represent this data. It would also be good to test this model on flight data covering a couple of years and investigate the important features presented by the random forest model. Statistical analysis could be performed to see if there was actual statistical significance to the features and between the effects of before during COVID-19.

## Conclusion
All in all, we found that COVID- 19 had a large effect on the carrier delays, increasing from 36% of delays to 53%, and security cancellations, increasing from 75% to 95%. When running our dataset through various machine learning models we found that the machine learning models were able to accurately predict cancelled flights but struggled to accurately predict delayed flights. For future analysis we would like to analyze a bigger dataset over various years to see if this would improve our machine learning results. 



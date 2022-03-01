# Perpetually Delayed
## Project Overview
**Data analyst**: Ryan Cramer, Leah Ikenberry, Lisa Macera, Leslie Mayeux, Krystin McKee

Through out the COVD-19 Pandemic, many companies, and individuals experienced changes to operations and often faced issues with supply chains and staffing shortages. One industry severely impacted by the effects of COVID-19 was the airline industry, forced to cancel, restrict, and delay flights because of various issues caused by the pandemic. Using a dataset of over 3 million flights from before and during the COVID pandemic, January 2020- June 2020, our team has examined the main causes of flight cancellations before and after the COVID-19 Pandemic. Through a machine learning logistic regression our team attempted to accurately predict when a flight will be delayed and or cancelled.

## Resources

-	Data Source: https://www.kaggle.com/akulbahl/covid19-airline-flight-delays-and-cancellations?select=jantojun2020.csv  (TThis data set contains approximately 3 million flights and contains detailed flight delay and cancellation data. The United States Department of Transportation Bureau of Transportation Statistics tracks on time performance of domestic flights operated by large air carriers. This data contains relevant flight information for our analysis; on-time, delayed, canceled and diverted flights.)
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
o	Carrier delay incread from 36% of delays to 53%
o	Late Aircraft delays decreased from 34% to 20%
o	Security cancellations went from 75% to 95%

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

## Conclusion


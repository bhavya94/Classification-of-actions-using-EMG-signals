# Classification-of-actions-using-EMG-signals

This project was completed as a part of Applied Data Science (16-791) course at the Robotics Institute at Carnegie Mellon University. 
The project was an attempt to implement supervised machine learning models to classify EMG signals recorded from human subjects. 

EMG or Electromyography is the process of recording electrical signals from the skeletal muscles to monitor their health and assess neuromuscular connection.The readings are generally taken using an EMG apparatus which records muscle ‘contraction’ and ‘relaxation’ over a period using electrodes attached to the muscles of the subject/patient. The signal hence received from each electrode is a function of time, frequency, and amplitude. 

In this project, we worked on a very specific application of EMG signal processing using surface electrodes which has its roots in kinesiology. We aimed to build a supervised learning model to classify EMG signals collected from 4 subjects performing a particular action. A successful classification model could help biomedical engineers understand the time-series features that differentiate a particular activity from another. The results could have applications ranging from performance enhancement of an athlete to detection and diagnosis of anomalous behavior in muscles. E.g., neuromuscular problems like epileptic seizures.

We specifically focused on building a classifier that could successfully classify an ‘aggressive’ action against a ‘normal’ action. We hypothesized that the aggressive actions and normal actions vary a lot in terms of signal amplitude, frequency, and pattern. Hence, a model built on the processed signals will be able to classify between the activities successfully.

# Description of code

1. Raw data visualization - Contains the code to load raw data of each action of each subject. We also tested our hypothesis about the difference between 'normal' and 'aggressive' activities by visualizing the signals.

2. EMG_data_processing - Contains MATLAB code for processing the raw signals. The signal in raw form has poor signal-to-noise ratio and is distorted. Hence, to improve the signal-to-noise ratio, we detrended the raw data to filter out the DC offset. Next, we rectified the data by converting the signal to a single polarity, to ensure that signals don’t average to 0 during analysis. The Savitzky-Golay filter, set to an order of 5 and framelength of 49, was then applied to smoothen the data and further eliminate noise.

3. 500W50S Featurization - Contains code to create time-series features from the processed signals. We divided individual time-series actions into several smaller windows and extracted features for each window using sliding/moving window approach. The code uses 500 records as window size and 50 records as step-size for sliding window approach.

4. 2000W200S - Contains code to create time-series features from the processed signals using 2000 records as window size and 200 records as step-size for sliding window approach.

5. Classification 2000W200S - Contains code to run classification models on the featurized data of 2000 Window size and 200 Step size. Ran 4-fold cross-validation and compared performance of Logisitic Regression, Naives Bayes, Random Forest and default(random choice) models using ROC curve and Accuracy.

6. Classification 500W50S - Contains code to run classification models on the featurized data of 500 Window size and 50 Step size. Ran 4-fold cross-validation and compared performance of Logisitic Regression, Naives Bayes, Random Forest and default(random choice) models using ROC curve and Accuracy.

7. FeatureExtraction_ProcessedData_S1000W100 - Contains code to create time-series features from the processed signals using 1000 records as window size and 100 records as step-size for sliding window approach.

8. EMG_Aggressive_vs_Normal_Classification - Contains code to run classification models on the featurized data of 1000 Window size and 100 Step size. Ran 4-fold cross-validation and compared performance of Logisitic Regression, Naives Bayes, Random Forest and default(random choice) models using ROC curve and Accuracy. The performance of this combination was the best and was selected for feature engineering and parameter tuning to improve the model performance. Interpreted the result using the important features selected by the model. 



# Classification-of-actions-using-EMG-signals

This project was completed as a part of Applied Data Science (16-791) course at the Robotics Institute at Carnegie Mellon University. 
The project was an attempt to implement supervised machine learning models to classify EMG signals recorded from human subjects. 

EMG or Electromyography is the process of recording electrical signals from the skeletal muscles to monitor their health and assess neuromuscular connection.The readings are generally taken using an EMG apparatus which records muscle ‘contraction’ and ‘relaxation’ over a period using electrodes attached to the muscles of the subject/patient. The signal hence received from each electrode is a function of time, frequency, and amplitude. 

In this project, we worked on a very specific application of EMG signal processing using surface electrodes which has its roots in kinesiology. We aimed to build a supervised learning model to classify EMG signals collected from 4 subjects performing a particular action. A successful classification model could help biomedical engineers understand the time-series features that differentiate a particular activity from another. The results could have applications ranging from performance enhancement of an athlete to detection and diagnosis of anomalous behavior in muscles. E.g., neuromuscular problems like epileptic seizures.

We specifically focused on building a classifier that could successfully classify an ‘aggressive’ action against a ‘normal’ action. We hypothesized that the aggressive actions and normal actions vary a lot in terms of signal amplitude, frequency, and pattern. Hence, a model built on the processed signals will be able to classify between the activities successfully.

# Description of code

1. Raw data visualization - Contains the code to load raw data of each action of each subject. We also tested our hypothesis about the difference between 'normal' and 'aggressive' activities by visualizing the signals.

2. EMG_data_processing - Contains MATLAB code for processing the raw signals. The signal in raw form has poor signal-to-noise ratio and is distorted. Hence, to improve the signal-to-noise ratio, we detrended the raw data to filter out the DC offset. Next, we rectified the data by converting the signal to a single polarity, to ensure that signals don’t average to 0 during analysis. The Savitzky-Golay filter, set to an order of 5 and framelength of 49, was then applied to smoothen the data and further eliminate noise.

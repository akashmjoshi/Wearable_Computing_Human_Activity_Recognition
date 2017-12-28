# Wearable_Computing_Human_Activity_Recognition
# Absract
Human Activity Recognition has emerged as one of the key research areas in the past decade. We have seen HAR being used in thegaming industry a lot. Most of the animation we see its done using human activity recognition. Cameras and Video capturing have been done to do human activity recognition. 

Based on this a new field of research emerged where hardware sensors where mounted at different locations on a human and this
sensor data was then used in a machine learning algorithm to perform Human Activity Recognition. In this project we doing
classification of body postures and movements by attaching four accelerometer data located at the waist, left thigh, right ankle
and upper right arm. The classification of data set is done by using the accelerometer data in the x, y and z axis and other features
such as gender, age, height, body mass index and weight. The data is taken in packets over 150 millisecond window. Each packet is
then converted into a single data point and labeled into an activity. This is called supervised learning. These parameters help in
classification of the dataset.  
The dataset is classified into 5 activities which are sitting, siitingdown, standing, standingup and walking. The dataset was first
divided into 2 parts – “training dataset” and “testing dataset” keeping the percentage class distribution the same in comparison
to the original dataset. Before the training data was every given to different models the data needed to be cleaned and preprocessed

and various measures such as treatment of missing values, outlier detection and removal, categorical data merging,
feature dimensionality expansion or reduction and normalization might help in preprocessing the dataset. We will see some of these
methods of preprocessing used on the dataset. The pre-processed data was then sent to various types of classifiers to train them
for the incoming testing dataset. It was found that K-Nearest Neighbors gave the best F1-score of 0.99 on the testing dataset and
we were able to correctly classify almost all the data correctly. This goes to show that using hardware sensors is the one of the best
methods of performing human activity recognition.  
# Goals and Methodology   
The primary goal of this project is to find a classification model which can accurately categorize incoming unknown data points with
any overall accuracy of greater than 80 % and also identify other variable sensor positions to improve the classification by adding in
more activities in the dataset. To achieve this goal meant that the data had to be pre-processed and cleaned thoroughly and then
sent to suitable classifiers to model them for the testing dataset.  

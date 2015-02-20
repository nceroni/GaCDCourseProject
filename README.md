## Getting and Cleaning Data ##

### Course Project ###

**NOTE:** I'm not english speaker, and I do my best writing this readme.

This README file explain how to use the run_analisys.R Code for create a tidy data from the UCI HAR Datasets. 

First, you have to download the reshape2 library executing the next comand in R console, if you have this package installed, this is not necesary. 

 - install.packages("reshape2")

Second, have to run the reshape2 package with the next comand: 

- library(reshape2)

Third, it's needed that you have the files of the UCI HAR Datasets unziped in the working directory in the folder "UCI HAR Datasets". This data sets can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzip the data in the working directory.

Now you can Run the code with the next command:

- Source("run_analisys.R")

This file read the train and test with the correspondient column names. Then add the subject and the activity for each datasets, and finally merge the dataset. 
Then create the tidy dataset, by melt the data, and group by the activity, subject and feature. 
The ouput of this code is the tidy_data.txt, the same file that is uploaded in the project page of the course.

For more information, read the coments in the code. 

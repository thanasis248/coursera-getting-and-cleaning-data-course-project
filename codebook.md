CODEBOOK.MD

1.Get X, Y, SUBJECT train and test datasets and Merge them to Merged_X , Merged_Y and Merged_Subject Dataset
2.Then Extract the selected Features from merged_X dataset based on RegEx(Regular Expression) of the columns that contain mean() OR std() words. So we assign the selected Columns to merged_X Dataset.
3.After that we convert the values of merged_Y Dataset from the ID of the activity to the Activity Label.  
4.We use Appropriate labels for the Subject DataSet 
5.Create a second Dataset with the average of each variable for each activity and each subject.

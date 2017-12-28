%% Data Seperation 
function [feature_train,label_train,feature_test,label_test] = dataseparation(dataset)
warning off;
label_dataset = (dataset(:,end));
label_dataset(find(strcmp(table2cell(label_dataset), 'sitting')),1) = {'1'};   
label_dataset(find(strcmp(table2cell(label_dataset), 'sittingdown')),1) = {'2'};   
label_dataset(find(strcmp(table2cell(label_dataset), 'standing')),1) = {'3'};
label_dataset(find(strcmp(table2cell(label_dataset), 'standingup')),1) = {'4'};
label_dataset(find(strcmp(table2cell(label_dataset), 'walking')),1) = {'5'};
label_dataset = double(cell2mat(table2cell(label_dataset)))-48;

cv = cvpartition(label_dataset,'Kfold',2);
feature_train = (dataset(find(cv.training(1)==1),1:18)); 
label_train = (label_dataset(find(cv.training(1)==1))); 
feature_test = (dataset(find(cv.training(1)==0),1:18));  
label_test = (label_dataset(find(cv.training(1)==0)));
end


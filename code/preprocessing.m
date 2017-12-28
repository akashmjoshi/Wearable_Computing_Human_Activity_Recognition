%% Pre-Processing DataSet
function [final_feature,label] = preprocessing(feature,label)
%% Recasting the representation of features
pp_feature = zeros(size(feature,1),size(feature,2));
final_feature = zeros(size(feature,1),size(feature,2));
for i = 1 : size(feature,2)
    if (iscellstr(table2cell(feature(1,i))) == 1)
        uni = unique(feature(:,i));
        for j = 1 : size(unique(feature(:,i)))
            pp_feature(:,i) = j * strcmp(table2cell(feature(:,i)),table2cell(uni(j,1)));
            final_feature(:,i) = final_feature(:,i) + pp_feature(:,i);
        end
    else
        final_feature(:,i) = cell2mat(table2cell(feature(:,i)));
    end
end
%% Removing 1st and 2nd feature
final_feature = final_feature(:,3:end);
%% Removing NaN and replacing them with mode values
for i = 1 : size(final_feature,2)
[row, ~] = find(isnan(final_feature(:,i)));
final_feature(row(:),:) = []; label(row(:),:) = []; 
end
% % KNN Imputaiton
% % feature_train_pp(:,19:21) = knnimpute(feature_train_pp(:,19:21));
% %% Histogram Merging
% % final_feature(find(ismember(final_feature(:,3),[3 5 6])),3) = 1;
% 
% % final_feature(find(ismember(final_feature(:,7),[4:9])),7) = 4;
% % final_feature(find(ismember(final_feature(:,8),[25 26])),8) = 4;
% % final_feature(find(ismember(final_feature(:,8),[6])),8) = 5;
% % final_feature(find(ismember(final_feature(:,9),[2:6 8:16 18:end])),9) = 2;
% % final_feature(find(ismember(final_feature(:,9),[7])),9) = 3;
% % final_feature(find(ismember(final_feature(:,9),[17])),9) = 4;
% 
% %% Feature Demensionality Reduction
% correl = corrcoef(final_feature,'rows','pairwise');
% fdr = [1 2 6 11 20 21 23:41 43:47]; %38 40 41 45];%
% final_feature(:,fdr(:)) = [];   variables(:,fdr(:)) = [];
% %% Categorical Feature Exapnsion
% for h = [1:6 8 15]
%     final_feature(:,h) = 2.^(final_feature(:,h)-1);
%     bin = dec2bin(final_feature(:,h));
%     sz = size(final_feature,2);
%     for i = 1 : size(unique(final_feature(:,h)),1)
%         final_feature(:,sz+i) = bin(:,i)-48;
%     end
% end
% final_feature(:,[1:6 8 15]) = []; variables(:,[1:6 8 15]) = [];
%% Sparse Feature Removal  
vari = var(final_feature); % Find near to zero variance features and remove them        
final_feature(:,find(vari<0.1)) = [];
%% Outlier Detection and Removal
[~,idx] = outliers(final_feature,1000);  
rowout = idx(:,1);
final_feature(rowout(:),:) = []; label(rowout(:),:) = []; 
%% Normalizing Data
final_feature = zscore(final_feature); % Normalize the features     
% %% Unique Data Set Required
% [~,unind,~] = unique(final_feature(:,:),'rows','stable');
% final_feature = final_feature(unind(:),:); label = label(unind(:),:);

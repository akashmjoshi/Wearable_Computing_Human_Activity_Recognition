%% Course Project Assingment
%  Main Porject .m File Created by Akash Mukesh Joshi - USC ID - 4703642421
tic; clc; clear; close all; data = readtable('dataset.dat');
data = data(2:end,:);
%% Data Separation
[feature_train,label_train,feature_test,label_test] = dataseparation(data);
%% Precrossing
[feature_train_pp,label_train] = preprocessing(feature_train,label_train);
[feature_test_pp,label_test] = preprocessing(feature_test,label_test);
% label_shift = label_test_um(rowdh(:),:);
% predicted_shift = ones(size(rowdh,1),1);
%% Classification Learner Data Preparation
xtrain = [feature_train_pp label_train];
%% MSE Model
predicted_label = multiclass(feature_train_pp',double(label_train'),feature_test_pp', '[''all-pairs'', 0, ''LS'', 1000]');
disp(mean(predicted_label == double(label_test'))); figure;
[m_f1,~] = classification_report(double(label_test),double(predicted_label'), 1);
%% KNN
predicted_label = Nearest_Neighbor(feature_train_pp', double(label_train'), feature_test_pp', 10);
disp(mean(predicted_label == double(label_test')));
[m_f1,~] = classification_report(double(label_test),double(predicted_label'), 1);
%% With PCA Does not Work properly 
[patterns, targets, UW, m, W] = PCA(feature_train_pp', double(label_train'), 2);
[patternstest, targetstest, UW, m, W] = PCA(feature_train_pp', double(label_train'), 2);
predicted_label = multiclass(patterns,double(targets),patternstest, '[''all-pairs'', 0, ''LS'', 1000]');
disp(mean(predicted_label == double(targetstest))); figure;
[m_f1,~] = classification_report(double(label_test),double(predicted_label), 1);
%% Interactive 
predicted_label = Interactive_Learning(feature_train_pp',double(label_train'),feature_test_pp', [10 1]);
disp(mean(predicted_label == double(label_test'))); figure;
[m_f1,~] = classification_report(double(label_test),double(predicted_label'), 1);
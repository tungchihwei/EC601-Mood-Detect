import csv
import pandas as pd
import numpy as np
from sklearn.neighbors import KNeighborsClassifier

text_file = open("ctrain.txt", "r")
train_type = text_file.read().split(' ')
#print(train_type[0])
csv_file = pd.read_csv("./train_data.csv", header=None, sep=',', skiprows=1, dtype='float', skipinitialspace=True)
train_data_temp = csv_file.values

train_data=[]
train_line=[]
for i in range(len(train_data_temp)):
	for j in range(len(train_data_temp[i])):
		train_line.append(train_data_temp[i][j])
	train_data.append(train_line)
	train_line = []

csv_file2 = pd.read_csv("./test_data.csv", header=None, sep=',', skiprows=1, dtype='float', skipinitialspace=True)
test_data_temp = csv_file2.values

test_data=[]
test_line=[]
for i in range(len(test_data_temp)):
	for j in range(len(test_data_temp[i])):
		test_line.append(test_data_temp[i][j])
	test_data.append(test_line)
	test_line = []

# Create the knn model.
# Look at the five closest neighbors.
#knn = KNeighborsRegressor(n_neighbors=5)
knn=KNeighborsClassifier(n_neighbors=5)
# Fit the model on the training data.
knn.fit(train_data, train_type)

# Make point predictions on the test set using the fit model.
predictions = knn.predict(test_data)
print(predictions)

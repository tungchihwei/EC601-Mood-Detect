import csv
import pandas as pd
import numpy as np
from sklearn.neighbors import KNeighborsClassifier

#print("woman")
text_file = open("train.txt", "r")
train_type = text_file.read().split(' ')
print(len(train_type))
csv_file = pd.read_csv("./mood_features_train.csv", header=None, sep=',', skiprows=0, dtype='float', skipinitialspace=True)
train_data_temp = csv_file.values


train_data=[]
train_line=[]
for i in range(len(train_data_temp)):
	for j in range(len(train_data_temp[i])):
		train_line.append(train_data_temp[i][j])
	train_data.append(train_line)
	train_line = []
print(len(train_data))

csv_file2 = pd.read_csv("./csv_all1.csv", header=None, sep=',', skiprows=0, dtype='float', skipinitialspace=True)
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
knn=KNeighborsClassifier(n_neighbors=5)
# Fit the model on the training data.
knn.fit(train_data, train_type)

# Make point predictions on the test set using the fit model.
predictions = knn.predict(test_data)
print(predictions)

H=0
S=0
C=0
A=0
for i in range(len(predictions)):
	if predictions[i] == "Happy":
		H += 1
	elif predictions[i] == "Sad":
		S += 1
	elif predictions[i] == "Calm":
		C += 1
	elif predictions[i] == "Angry":
		A += 1

All = A + C + S + H
Hp = H/All
Sp = S/All
Cp = C/All
Ap = A/All
print("Happy: ", Hp*100, "%" )
print("Sad: ", Sp*100, "%" )
print("Calm: ", Cp*100, "%" )
print("Angry: ", Ap*100, "%" )

if max(Hp, Sp, Cp, Ap) == Hp:
	print("Happy")
elif max(Hp, Sp, Cp, Ap) == Sp:
	print("Sad")
elif max(Hp, Sp, Cp, Ap) == Cp:
	print("Calm")
elif max(Hp, Sp, Cp, Ap) == Ap:
	print("Angry")
else:
	print("confused")


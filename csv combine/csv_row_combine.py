import csv
file1=open("formants2.csv")
file2=open("pitch2.csv")
file3=csv.writer(open("Combine3.csv","w"))

csv1=[]
for line in file1:
    Str1=str(line.rstrip('\r\n'))
    Str1=Str1.split(',')
    csv1.append(Str1)

for line in file2:
	Str2=str(line.rstrip('\r\n'))
	Str2=Str2.split(',')
	csv1.append(Str2)

for i in range(len(csv1)):
	Str=csv1[i]
	file3.writerow(list(Str))

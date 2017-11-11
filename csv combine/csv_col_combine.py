import csv
file1=open("formants.csv")
file2=open("pitch.csv")
file3=csv.writer(open("Combine.csv","w"))

csv1=[]
for line in file1:
    Str1=str(line.rstrip('\r\n'))
    Str1=Str1.split(',')
    csv1.append(Str1)

csv2=[]
for line in file2:
	Str2=str(line.rstrip('\r\n'))
	Str2=Str2.split(',')
	csv2.append(Str2)

for i in range(len(csv1)):
	Str=csv1[i]+csv2[i]
	file3.writerow(list(Str))

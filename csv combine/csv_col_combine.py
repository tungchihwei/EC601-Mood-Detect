import csv
file1=open("pitch.csv")
file2=open("formants.csv")
file3=open("MFCC.csv")
file4=csv.writer(open("Combined.csv","w"))

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

csv3=[]
for line in file3:
	Str3=str(line.rstrip('\r\n'))
	Str3=Str3.split(',')
	csv3.append(Str3)

for i in range(len(csv1)):
	Str=csv1[i]+csv2[i]+csv3[i]
	file4.writerow(list(Str))

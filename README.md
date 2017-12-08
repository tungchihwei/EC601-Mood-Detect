# EC601-Mood-Detect
## Copyright 2017 Zhonghao Guo gzh1994@bu.edu
### Oct.10
What I've done is a de-noise processing which efficiently eliminates low-frequency environment noise.
Attached are 3 samples of famous theme song to Disney cartoon movie——FROZEN. The original version of "Let it go" has annoying background noise, as the file labeled "original" demonstrated. After some technical operation, we can find the "de-noised" version has much more clear tone. 

### Oct.20
Pitch extraction using toolbox "voicebox" in MATLAB. Get mean, median, maximum, minimum, etc. Create a 10-dimensional vector. 

### Nov.9
A one-click pitch extraction and MFCC extraction implemented by *.m file. Data sets are produced in format *.csv

### Nov.10
100 new voice samples of "happy" and "sad" were recorded by ourselves. Then pitch and MFCC were extracted by matlab(there is still some problem when getting MFCC) and claasified by KNN algorithm. Unknown voices were classified, the accuracy......hard to say

### Nov.11
Formant extraction done!!! Unknown bugs appear sometimes and I'm trying to fix them. Theoratically, now we've got three features of voice samples.  

### Nov.12
An *.m file which automatically detect silent parts and voiced parts in audio files. Cut voiced parts to n cells. Later I gonna transfer them to matrix(by cell2mat), arrange them together and reshape them to 2-sec samples.

### Nov.16
All pre-processing procedure done. Now unvoiced parts elemination, 2sec resizing, pitch extraction, MFCC extraction, formants extraction are all done by one-click of VSP.m. The default input/output folder is D:\sample\. Drop all raw *.wav files in and you may get 3 .csv charts( if no fault reported...).

### Nov.20
Fix a bug when audio file is too short to get formants successfully. 

### Nov.26
Creat a '.bat' file which autotically run 'VSP.m' in command line mode as well as exit MATLAB when all things done. Now it's possible to combine this tiny '.bat' with python code to do all work automatically.

### Nov.29
WAV file monitor implemented by Windows Powershell. A '.ps1' script runs in background, detecting any '.wav' file uploaded to server by tomcat, triggering 'VSP.bat' in a short while. Now we don't need to start VSP.bat by hand anymore.

### Dec.4
In order to enable python code access to the gender information in SQL server database, I changed some code in VSP.m, silence_remove.m and csvcombine.m to attach username uploaded by tomcat to the final csv file. Then the python may seek the needed information in dataset by csv filename.

### Dec.7
Arguments in formants.m adjusted. Now an occasionally appeared problem, when operating too many voice pieces in formants.m, was fixed.

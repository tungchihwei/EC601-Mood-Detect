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

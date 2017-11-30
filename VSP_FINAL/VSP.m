% Copyright 2017 Zhonghao Guo gzh1994@bu.edu

% The script VSP(Voice Signal Processing), is to pre-process the voice signal obtained by de-noise recorder.
% It provides an easy one-click access to un-voiced parts elimination, 2-sec segments resizing and pitch/MFCC/formants extraction.
% All *.wav files in d:\sample\. are readable by the function.
% Attention! For privacy concern, the original audio files might be deleted after features extraction.
% You should get three *.csv files, named pitch.csv/MFCC.csv/formant.csv in d:\sample\ folder.
% Enjoy it!

clear
clc
run('silence_remove');
run('pitch_extraction');
run('formant_extraction');
run('MFCC_extraction');

delete([folder '*.wav']);
run('csvcombine');

exit


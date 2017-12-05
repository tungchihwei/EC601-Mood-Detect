folder = 'c:\sample_temp\';
folder_final = 'c:\sample\';
filedir = dir([folder_final '*.wav']);
filename_temp = filedir.name;
filename_final = filename_temp(1:(length(filename_temp)-4));
csv_1 = csvread([folder 'pitch.csv']);
csv_2 = csvread([folder 'MFCC.csv']);
csv_3 = csvread([folder 'formants.csv']);
csv_all = [csv_1 csv_2 csv_3];
csvwrite([folder_final filename_final '.csv'],csv_all);
delete([folder '*.csv'])


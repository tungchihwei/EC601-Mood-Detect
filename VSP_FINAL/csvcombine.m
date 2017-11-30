folder = 'c:\sample_temp\';
folder_final = 'c:\sample\';
csv_1 = csvread([folder 'pitch.csv']);
csv_2 = csvread([folder 'MFCC.csv']);
csv_3 = csvread([folder 'formants.csv']);
csv_all = [csv_1 csv_2 csv_3];
csvwrite([folder_final 'csv_all.csv'],csv_all);
delete([folder '*.csv'])


clear all
clc
folder = 'c:\sample_temp\';
files = dir([folder '*.wav']);
pitch = cell(length(files),12);
for i=1:length(files)
    file = [folder files(i).name];
    [Data,Fs] = wavread(file);
    [fx,tt] = fxrapt(Data,Fs,'u',50);
    
    fx_adjust = fx(~isnan(fx));
    fx_mean = mean(fx_adjust);
    fx_max = max(fx_adjust);
    fx_min = min(fx_adjust);
    fx_variance = fx_max - fx_min;
    fx_median = median(fx_adjust);
    
    fx_der = diff(fx_adjust);
    fx_mean_der = mean(fx_der);
    fx_max_der = max(fx_der);
    fx_min_der = min(fx_der);
    fx_variance_der = fx_max_der - fx_min_der;
    fx_median_der = median(fx_der);
    
    fx_energy_avg = mean(Data);
    if length(fx_energy_avg) >1
        fx_energy_avg = fx_energy_avg(1) + fx_energy_avg(2);
    end
    speaking_rate = length(fx)/length(fx_adjust);
    
    pitch(i,1) = num2cell(fx_mean);
    pitch(i,2) = num2cell(fx_max);
    pitch(i,3) = num2cell(fx_min);
    pitch(i,4) = num2cell(fx_variance);
    pitch(i,5) = num2cell(fx_median);
    pitch(i,6) = num2cell(fx_mean_der);
    pitch(i,7) = num2cell(fx_max_der);
    pitch(i,8) = num2cell(fx_min_der);
    pitch(i,9) = num2cell(fx_variance_der);
    pitch(i,10) = num2cell(fx_median_der);
    pitch(i,11) = num2cell(fx_energy_avg);
    pitch(i,12) = num2cell(speaking_rate);
end
cell2csv('c:\sample_temp\pitch.csv',pitch);
        
    


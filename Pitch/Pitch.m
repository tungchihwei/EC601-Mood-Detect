% Copyright 2017 Zhonghao Guo gzh1994@bu.edu
% Pitch Extraction by Voicebox in MATLAB

clear all
clc
filename1 = 'd:/calm.wav';
filename2 = 'd:/happy.wav';
[Data1,Fs1]=wavread(filename1);
[Data2,Fs2]=wavread(filename2);
x1=[1:151423,1];
x2=[1:143807,1];
plot(
	x1,Data1,'g',x2,Data2,'r');
[fx1,tt1] = fxrapt(Data1,Fs1,'u',50);
[fx2,tt2] = fxrapt(Data2,Fs2,'u',50);
x3=[1:684,1];
x4=[1:649,1];
figure(2)
plot(x3,fx1,'g',x4,fx2,'r');

fx1_adjust = fx1(~isnan(fx1));
fx2_adjust = fx2(~isnan(fx2));
fx1_mean = mean(fx1_adjust);
fx2_mean = mean(fx2_adjust);
fx1_max = max(fx1_adjust);
fx2_max = max(fx2_adjust);
fx1_min = min(fx1_adjust);
fx2_min = min(fx2_adjust);
fx1_variance = fx1_max-fx1_min;
fx2_variance = fx2_max-fx2_min;
fx1_midian = median(fx1_adjust);
fx2_midian = median(fx2_adjust);

fx1_derivative = diff(fx1_adjust);
fx2_derivative = diff(fx2_adjust);

fx1_energy_avg = mean(Data1);
fx2_energy_avg = mean(Data2);
speaking_rate1 = length(fx1)/length(fx1_adjust);
speaking_rate2 = length(fx2)/length(fx2_adjust);
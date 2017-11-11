% MFCC Extraction %
clear all
clc
folder = 'd:\sample\';
files = dir([folder '*.wav']);
MFCC = cell(length(files),96);
for i=1:length(files)
    file = [folder files(i).name];
    [Data,Fs] = wavread(file);
    bank = melbankm(24,256,Fs,0,0.4,'t');
    bank = full(bank); %full() convert sparse matrix to full matrix
    bank = bank/max(bank(:));
    for l=1:12
        n=0:23;
        dctcoef(l,:) = cos((2*n+1)*l*pi/(2*24));
    end
    w = 1+6*sin(pi*[1:12]./12);
    w = w/max(w);
    Data = Data + randn(size(Data))*1E-10;
    xx = double(Data);
    xx = filter([1-0.9375],1,xx);
    xx = enframe(xx,256,80);
    
    for j=1:size(xx,1)
        y = xx(j,:);
        s = y'.*hamming(256);
        t = abs(fft(s));
        t = t.^2;
        c1 = dctcoef*log(bank*t(1:129));
        c2 = c1.*w';
        m(j,:) = c2;
    end

    dtm = zeros(size(m));
    for k=3:size(m,1)-2
        dtm(k,:) = -2*m(k-2,:)-m(k-1,:)+m(k+1,:)+2*m(k+2,:);
    end
    dtm = dtm/3;
    
    ccc = [m dtm];
    ccc = ccc(3:size(m,1)-2,:);
    
    means = zeros(1,24);
    variance = zeros(1,24);
    maximum = zeros(1,24);
    minimum = zeros(1,24);
    
    % To calculate the mean of each argument
    for p=1:24
        means(p) = mean(ccc(:,p));
    end
    
    % To calculate the maximum value of each argument
    for p=1:24
        maximum(p) = max(ccc(:,p));
    end
    
    % To calculate the minimum value of each argument
    for p=1:24
        minimum(p) = min(ccc(:,p));
    end
    
    % To calculate the variance value of each argument
    for p=1:24
        variance(p) = maximum(p) - minimum(p);
    end
    
    MFCC(i,1:96) = [num2cell(means) num2cell(maximum) num2cell(minimum) num2cell(variance)];
end
cell2csv('d:\sample\MFCC.csv',MFCC);

    
    

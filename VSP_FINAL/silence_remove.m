%Remove the unvoiced parts/seperate to 2sec parts/save as *.wav file/Delete
%the original record
clear 
clc
folder = 'c:\sample\';
folder_temp = 'c:\sample_temp\';
files = dir([folder '*.wav']);
N = 2; %Time length when dividing voice sample
for i=1:length(files)
    file = [folder files(i).name];
    [Data,Fs] = detectVoiced(file);
    for j=1:length(Data)
        Value = cell2mat(Data(j));
        if length(Value) <=1.5*Fs
           continue
        elseif length(Value) <= 2*Fs
            wavwrite(Value,Fs,[folder_temp num2str(i) '_' num2str(j) '.wav']);
        else
            num = floor(length(Value)/(N*Fs));
            for k=1:num
                Value_temp = Value((2*(k-1)*Fs+1):2*k*Fs,:);
                wavwrite(Value_temp,Fs,[folder_temp num2str(i) '_' num2str(j) '_' num2str(k) '.wav']);
            end
        end
    end
    delete(file);
end

    









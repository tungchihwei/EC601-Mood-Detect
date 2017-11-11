clear all
clc
folder = 'd:\sample\';
files = dir([folder '*.wav']);
formants = cell(length(files),48);
for i=1:length(files)
    file = [folder files(i).name];
    [Data,Fs] = wavread(file);
    Data = (Data(:,1)+Data(:,2))/2;
    Data = filter([1 -.9375],1,Data);
    wlen = 512;
    inc = 256;
    win = hamming(wlen);
    Data_filt = enframe(Data,win,inc);
    [row,column] = size(Data_filt);
    Data_filt_dif = diff(Data_filt);
    [row_dif,column_dif] = size(Data_filt_dif);
    for j=1:row
        u = (Data_filt(j,:))';
        p = 12;
        a = lpc(u,p);
        U = lpcar2pf(a,255);
        df = Fs/2048;
        [Val,Loc] = findpeaks(U);
        ll = length(Loc);
        for k=1:ll
            m = Loc(k);
            m1 = m-1;
            m2 = m+1;
            p = Val(k);
            p1 = U(m1);
            p2 = U(m2);
            aa = (p1+p2)/2-p;
            bb = (p2-p1)/2;
            cc = p;
            dm = -bb/2/aa;
            pp = -bb*bb/4/aa+cc;
            m_new = m+dm;
            bf = -sqrt(bb*bb-4*aa*(cc-pp/2))/aa;
            F(k) = (m_new-1)*df;
            Bw(k) = bf*df;    
        end
        F_chart(j,1:3) = F(1:3);
        Bw_chart(j,1:3) = Bw(1:3);
    end
    
    for l=1:row_dif
        u_dif = (Data_filt_dif(l,:))';
        p_dif = 12;
        a_dif = lpc(u_dif,p_dif);
        U_dif = lpcar2pf(a_dif,255);
        df_dif = Fs/2048;
        [Val_dif,Loc_dif] = findpeaks(U_dif);
        ll_dif = length(Loc_dif);
        for n=1:ll_dif
            m_dif = Loc_dif(n);
            m_dif_1 = m_dif-1;
            m_dif_2 = m_dif+1;
            p_dif = Val_dif(n);
            p_dif_1 = U_dif(m_dif_1);
            p_dif_2 = U_dif(m_dif_2);
            aa_dif = (p_dif_1+p_dif_2)/2-p_dif;
            bb_dif = (p_dif_2-p_dif_1)/2;
            cc_dif = p_dif;
            dm_dif = -bb_dif/2/aa_dif;
            pp_dif = -bb_dif*bb_dif/4/aa_dif+cc_dif;
            m_new_dif = m_dif+dm_dif;
            bf_dif = -sqrt(bb_dif*bb_dif-4*aa_dif*(cc_dif-pp_dif/2))/aa_dif;
            F_dif(n) = (m_new_dif-1)*df_dif;
            Bw_dif(n) = bf_dif*df_dif;
        end
        F_dif_chart(l,1:3) = F_dif(1:3);
        Bw_dif_chart(l,1:3) = Bw_dif(1:3);
    end
    temp = [F_chart(2:length(F_chart),:) Bw_chart(2:length(Bw_chart),:) F_dif_chart Bw_dif_chart];
    for num=1:12
        means(:,num) = mean(temp(:,num));
        maximum(:,num) = max(temp(:,num));
        minimum(:,num) = min(temp(:,num));
        variance(:,num) = maximum(:,num) - minimum(:,num);
    end
    formants(i,:) = [num2cell(means) num2cell(maximum) num2cell(minimum) num2cell(variance)];
end
cell2csv('d:\sample\formants.csv',formants);

    
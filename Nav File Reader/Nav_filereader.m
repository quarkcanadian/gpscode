#GPS Navigation RINEX 2.11 Format

#instructions for noobs:
#scroll down to the bottom 

clear all;
clc;
data = fileread('ALBH0010.07N');
[lines] = strsplit (data,'\n')';

cut = -1
record_length = 8;

for i = 1:1:length(lines)

if ~isempty( regexp(lines{i},'END OF HEADER'))
cut = i;
break;
end

end

header = {};
other_data = {};

if cut == -1
  disp('corrupt file');
  else
  header = lines(1:cut-1,1);
  other_data = lines(cut+1:end,1);
 end

if mod(length(other_data),record_length)
  other_data = other_data(1:end-1,1);
end

 starter = 1;
 ender = record_length;
 
 
 
 for i = 1:1:length(other_data)/record_length
 Data_Records{i} = other_data(starter:ender,:);
 starter = ender+1;
 ender = ender+record_length;
 end
 
#parse records


#get epochs
epoch_data = other_data(1:8:end);


epochs = [];
non_epochs = [];
inc = 1;



for i = 1:1: length(epoch_data)


#Deal with non epoch
get_other_data = Data_Records{i};
extract = get_other_data(2:end);


data = epoch_data{i};
epoch = data(1:22);
seperated_from_epoch = data(23:end);

non_epochs{i} = [seperated_from_epoch;extract];

#Deal with epoch data
cutter = strsplit (epoch,' ');


if strcmp(cutter{1},'')
  epochs{i} =cutter(1,2:7);
  else
  epochs{i} =cutter(1,1:6);
end



end



# Congrats You made it! here are the important fucntions to fuck with

epoch_value = getCellVal_Epoch (1,2,1,epochs)
%arguments  = (index containing entry, row of entry,column of row)
% always have the column at 1 due to the splitting (trust)
%use the row argument to get ur desired number fam
%epoch values consist of the follow data
%{
this is the raw entry
 7 07  1  1  2  0  0.0 4.590023308992D-04-1.023181539495D-11 0.000000000000D+00
    1.510000000000D+02-3.781250000000D+00 5.430940506186D-09-1.182670363585D+00
    9.126961231232D-08 1.082050264813D-02 6.478279829025D-06 5.152069171906D+03
    9.360000000000D+04-6.519258022308D-08 1.596552926244D+00 2.253800630569D-07
    9.345747755564D-01 2.425312500000D+02-1.702567086982D+00-8.411421798052D-09
   -3.078699668770D-10 1.000000000000D+00 1.408000000000D+03 0.000000000000D+00
    2.800000000000D+00 0.000000000000D+00-2.328306436539D-09 6.630000000000D+02
    8.641800000000D+04 4.000000000000D+00

 This is an epoch entry
     7 07  1  1  2  0  0.0
%}


non_epoch_value = getCellVal_None_Epoch (1,1,1,non_epochs)
%arguments  = (index containing entry, row of entry,column of row)
%non epoch values consist of the follow data
%{
this is the raw entry
 7 07  1  1  2  0  0.0 4.590023308992D-04-1.023181539495D-11 0.000000000000D+00
    1.510000000000D+02-3.781250000000D+00 5.430940506186D-09-1.182670363585D+00
    9.126961231232D-08 1.082050264813D-02 6.478279829025D-06 5.152069171906D+03
    9.360000000000D+04-6.519258022308D-08 1.596552926244D+00 2.253800630569D-07
    9.345747755564D-01 2.425312500000D+02-1.702567086982D+00-8.411421798052D-09
   -3.078699668770D-10 1.000000000000D+00 1.408000000000D+03 0.000000000000D+00
    2.800000000000D+00 0.000000000000D+00-2.328306436539D-09 6.630000000000D+02
    8.641800000000D+04 4.000000000000D+00
    
 This is the non epoch
 
 4.590023308992D-04-1.023181539495D-11 0.000000000000D+00
    1.510000000000D+02-3.781250000000D+00 5.430940506186D-09-1.182670363585D+00
    9.126961231232D-08 1.082050264813D-02 6.478279829025D-06 5.152069171906D+03
    9.360000000000D+04-6.519258022308D-08 1.596552926244D+00 2.253800630569D-07
    9.345747755564D-01 2.425312500000D+02-1.702567086982D+00-8.411421798052D-09
   -3.078699668770D-10 1.000000000000D+00 1.408000000000D+03 0.000000000000D+00
    2.800000000000D+00 0.000000000000D+00-2.328306436539D-09 6.630000000000D+02
    8.641800000000D+04 4.000000000000D+00   

%}

 #22


 

 


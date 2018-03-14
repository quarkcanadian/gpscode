#GPS Navigation RINEX 2.11 Format

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
non_epochs{i} = extract;


#Deal with epoch data
cutter = strsplit (epoch_data{i},' ');

if strcmp(cutter(1,1),'')
dummey = cutter(1,2:8);
split_this = dummey{1,7};
splited = strsplit (split_this,'-');
disp(splited)
epochs{i} =[cutter(1,2:7),splited{1}];

if length(splited)>1

end


disp('empty')
else
dummey = cutter(1,1:7)
split_this = dummey{1,7};
splited = strsplit (split_this,'-');
disp(splited)
epochs{i} =[cutter(1,1:6),splited{1}];



disp('not empty')
end


end


 #parse header
 
 

 
 

 


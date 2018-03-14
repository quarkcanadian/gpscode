clc;
data = fileread('test1.txt');
[lines] = strsplit (data,'\n')';

cut = -1
%record_length = 21;

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


#find the first epoch and extract the number of observations
first_line = strsplit (other_data{1},' ')
record_len_str = strsplit (first_line{1,9},'G');
record_length = 2*str2double(record_len_str{1})+1


 starter = 1;
 ender = record_length;
 for i = 1:1:length(other_data)/record_length
 Data_Records{i} = other_data(starter:ender,:);
 starter = ender+1;
 ender = ender+record_length;
 end
 

 Tops = other_data(1:record_length:end,1);
 tops_data = {};
 
 for i = 1:1:length(Tops)
   spliter = strsplit (Tops{i},' ');
   fullVal = spliter(~cellfun('isempty', spliter));
   tops_data{i} = fullVal;
   end
 

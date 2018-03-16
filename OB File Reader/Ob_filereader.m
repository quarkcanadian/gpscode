clc;
data = fileread('test.txt');
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
 epochs = {};
 
 for i = 1:1:length(Tops)
   spliter = strsplit (Tops{i},' ');
   fullVal = spliter(~cellfun('isempty', spliter));
   epochs{i} = fullVal;
   end
   
   
 for i = 1:1:length(Data_Records)
   dummey = Data_Records{i};
   obs{i} = dummey(2:end);
 end
 
#epoch_value represents all the top rows
#obs_value represents the non epoch values
 
 
#method can be used with epoch as long as  col=1
#use the row argument to go through the epoch values
%use the ind argument to go to different epochs
epoch_value = getCellVal (1,2,1,epochs)

%{
raw observation example
 07  1  1  0  0 30.0000000  0 10G16G21G29G18G26G10G24G 6G15G 7
  22578267.422    22578266.780    22578264.492    -8991956.318 5  -7006714.301 4
        35.700          29.500
  20690852.679    20690852.133    20690848.942   -22470324.232 7 -17509335.626 7
        46.400          44.500
  22701320.456    22701320.629    22701319.111    -9021869.452 4  -7030020.367 4
        29.500          27.900
  22434105.534    22434104.826    22434102.344   -12783984.120 6  -9961537.202 4
        37.600          29.200
  22683493.443    22683493.221    22683491.972    -8952249.058 4  -6975772.452 4
        29.900          25.900
  23465154.230    23465153.542    23465152.063    -5336932.207 4  -4158633.220 3
        27.400          21.100
  24832265.267    24832265.129    24832265.503     2088774.056 2   1627620.202
        15.100           3.000
  20868360.224    20868359.948    20868358.438   -19714726.615 7 -15362117.087 6
        44.700          40.000
  21657360.762    21657360.042    21657359.005   -15366702.392 6 -11974047.519 6
        41.900          36.100
  20422836.319    20422835.522    20422834.429   -22426072.926 7 -17474853.770 7
        46.700          45.800
        
 resulting epoch entry
 07  1  1  0  0 30.0000000  0 10G16G21G29G18G26G10G24G 6G15G 7 
 
 Then use the row and col args to extract the double of one of these value
 row = 2, col = 1 would give u 1
%}


# first value = index of obeservation 
# second value = row wanted
#third value column wanted
# cell array to parse
obs_value = getCellVal (1,2,2,obs)

%{
raw observation example
 07  1  1  0  0 30.0000000  0 10G16G21G29G18G26G10G24G 6G15G 7
  22578267.422    22578266.780    22578264.492    -8991956.318 5  -7006714.301 4
        35.700          29.500
  20690852.679    20690852.133    20690848.942   -22470324.232 7 -17509335.626 7
        46.400          44.500
  22701320.456    22701320.629    22701319.111    -9021869.452 4  -7030020.367 4
        29.500          27.900
  22434105.534    22434104.826    22434102.344   -12783984.120 6  -9961537.202 4
        37.600          29.200
  22683493.443    22683493.221    22683491.972    -8952249.058 4  -6975772.452 4
        29.900          25.900
  23465154.230    23465153.542    23465152.063    -5336932.207 4  -4158633.220 3
        27.400          21.100
  24832265.267    24832265.129    24832265.503     2088774.056 2   1627620.202
        15.100           3.000
  20868360.224    20868359.948    20868358.438   -19714726.615 7 -15362117.087 6
        44.700          40.000
  21657360.762    21657360.042    21657359.005   -15366702.392 6 -11974047.519 6
        41.900          36.100
  20422836.319    20422835.522    20422834.429   -22426072.926 7 -17474853.770 7
        46.700          45.800
        
 resulting obs entry
   22578267.422    22578266.780    22578264.492    -8991956.318 5  -7006714.301 4
        35.700          29.500
  20690852.679    20690852.133    20690848.942   -22470324.232 7 -17509335.626 7
        46.400          44.500
  22701320.456    22701320.629    22701319.111    -9021869.452 4  -7030020.367 4
        29.500          27.900
  22434105.534    22434104.826    22434102.344   -12783984.120 6  -9961537.202 4
        37.600          29.200
  22683493.443    22683493.221    22683491.972    -8952249.058 4  -6975772.452 4
        29.900          25.900
  23465154.230    23465153.542    23465152.063    -5336932.207 4  -4158633.220 3
        27.400          21.100
  24832265.267    24832265.129    24832265.503     2088774.056 2   1627620.202
        15.100           3.000
  20868360.224    20868359.948    20868358.438   -19714726.615 7 -15362117.087 6
        44.700          40.000
  21657360.762    21657360.042    21657359.005   -15366702.392 6 -11974047.519 6
        41.900          36.100
  20422836.319    20422835.522    20422834.429   -22426072.926 7 -17474853.770 7
        46.700          45.800
        
 Then use the row and col args to extract the double of one of these value
 row = 2, col = 1 would give u 35.700 
%}

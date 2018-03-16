## Copyright (C) 2018 jamie
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} getObsCell (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: jamie <jamie@LAPTOP-HN619NKA>
## Created: 2018-03-15

function [output] = getCellVal_None_Epoch (ind,row,col,non_epochs)

 output = -1;
 ind_get = non_epochs{ind};
 disp(ind_get)
 row_get = ind_get{row};
 split_it = strsplit(row_get,'D');
 
 whole_numbers = [];
  inc = 1;
 for i = 1:length(split_it)-1
   dummey = split_it{i};
   #if its the first row added from segmenting the epochs
   if row == 1 && i ==1
   whole_numbers(inc) = str2double(dummey(1:end));
   
   else
    whole_numbers(inc) = str2double(dummey(4:end));
   end
   inc = inc+1;
 end
 
 expon = [];
 inc = 1;
 for j = 2:length(split_it)
   dummey = split_it{j};
  expon(inc) = 10^str2double(dummey(1:3));
  inc = inc+1;
 end
 
 outputs = whole_numbers.*expon
 output = outputs(col);
 

endfunction

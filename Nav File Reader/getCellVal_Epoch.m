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

function [output] = getCellVal_Epoch (ind,row,col,obs)

 output = -1;
 obs_ind = obs{ind};
 disp(obs_ind);
 obs_row = obs_ind{row};
 obs_cols_split = strsplit (obs_row,' ');
 
 
 if strcmp(obs_cols_split{1},'')
 col = col +1;
 end
 
 output = str2double(obs_cols_split{col});

endfunction

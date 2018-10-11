function output = getLegData(leg, input) 
%used for joint state
%you can see a row-wise matrix as a vector...

if strcmp(leg, 'LF') 
    output = input(1:3);
elseif strcmp(leg, 'RF') 
    output = input(4:6); 
elseif strcmp(leg, 'LH') 
    output = input(7:9);
elseif strcmp(leg, 'RH') 
    output = input(10:12);

end
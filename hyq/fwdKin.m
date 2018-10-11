
function  [x, q] = fwdKin(h, q, leg, q_leg)
%fwd kinematics
 
if nargin < 4 % checks, if the number of input-parameters is less than 2

    if strcmp(leg, 'LF') 
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_LF_foot(1:3,4); 

    elseif strcmp(leg, 'RF') 
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_RF_foot(1:3,4); 
    
    elseif strcmp(leg, 'LH') 
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_LH_foot(1:3,4); 

    elseif strcmp(leg, 'RH') 
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_RH_foot(1:3,4); 
    end
   
else 
    %this updates the joint state for that leg
    if strcmp(leg, 'LF') 
        q(1:3) = q_leg; 
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_LF_foot(1:3,4); 

    elseif strcmp(leg, 'RF') 
        q(4:6) = q_leg;
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_RF_foot(1:3,4); 

    elseif strcmp(leg, 'LH') 
        q(7:9) = q_leg;
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_LH_foot(1:3,4); 
    
    elseif strcmp(leg, 'RH') 
        q(10:12) = q_leg;
        h = updateHomogeneousTransforms(h, q);
        x = h.fr_trunk_Xh_RH_foot(1:3,4); 
    end
    
end



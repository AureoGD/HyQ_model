function jacs = initJacobians()

jacs.fr_trunk_J_LF_foot = zeros(6,3);
jacs.fr_trunk_J_LF_foot(1,1) = - 1.0;

jacs.fr_trunk_J_RF_foot = zeros(6,3);
jacs.fr_trunk_J_RF_foot(1,1) = 1.0;

jacs.fr_trunk_J_LH_foot = zeros(6,3);
jacs.fr_trunk_J_LH_foot(1,1) = - 1.0;

jacs.fr_trunk_J_RH_foot = zeros(6,3);
jacs.fr_trunk_J_RH_foot(1,1) = 1.0;


function out = updateJacobians(jacs, q, params)

s__q_LF_HAA = sin( q(1));
s__q_LF_HFE = sin( q(2));
s__q_LF_KFE = sin( q(3));
s__q_RF_HAA = sin( q(4));
s__q_RF_HFE = sin( q(5));
s__q_RF_KFE = sin( q(6));
s__q_LH_HAA = sin( q(7));
s__q_LH_HFE = sin( q(8));
s__q_LH_KFE = sin( q(9));
s__q_RH_HAA = sin( q(10));
s__q_RH_HFE = sin( q(11));
s__q_RH_KFE = sin( q(12));
c__q_LF_HAA = cos( q(1));
c__q_LF_HFE = cos( q(2));
c__q_LF_KFE = cos( q(3));
c__q_RF_HAA = cos( q(4));
c__q_RF_HFE = cos( q(5));
c__q_RF_KFE = cos( q(6));
c__q_LH_HAA = cos( q(7));
c__q_LH_HFE = cos( q(8));
c__q_LH_KFE = cos( q(9));
c__q_RH_HAA = cos( q(10));
c__q_RH_HFE = cos( q(11));
c__q_RH_KFE = cos( q(12));

jacs.fr_trunk_J_LF_foot(2,2) =  c__q_LF_HAA;
jacs.fr_trunk_J_LF_foot(2,3) =  c__q_LF_HAA;
jacs.fr_trunk_J_LF_foot(3,2) = - s__q_LF_HAA;
jacs.fr_trunk_J_LF_foot(3,3) = - s__q_LF_HAA;
jacs.fr_trunk_J_LF_foot(4,2) = ( 0.33 *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  c__q_LF_HFE);
jacs.fr_trunk_J_LF_foot(4,3) = ( 0.33 *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  c__q_LF_HFE *  c__q_LF_KFE);
jacs.fr_trunk_J_LF_foot(5,1) = ( 0.33 *  c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);
jacs.fr_trunk_J_LF_foot(5,2) = ( 0.33 *  s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( 0.33 *  s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE) + ( 0.35 *  s__q_LF_HAA *  s__q_LF_HFE);
jacs.fr_trunk_J_LF_foot(5,3) = ( 0.33 *  s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( 0.33 *  s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
jacs.fr_trunk_J_LF_foot(6,1) = (- 0.33 *  s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) + ( 0.33 *  s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) + ( 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) + ( 0.08 *  s__q_LF_HAA);
jacs.fr_trunk_J_LF_foot(6,2) = ( 0.33 *  c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( 0.33 *  c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE) + ( 0.35 *  c__q_LF_HAA *  s__q_LF_HFE);
jacs.fr_trunk_J_LF_foot(6,3) = ( 0.33 *  c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( 0.33 *  c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);





jacs.fr_trunk_J_RF_foot(2,2) =  c__q_RF_HAA;
jacs.fr_trunk_J_RF_foot(2,3) =  c__q_RF_HAA;
jacs.fr_trunk_J_RF_foot(3,2) =  s__q_RF_HAA;
jacs.fr_trunk_J_RF_foot(3,3) =  s__q_RF_HAA;
jacs.fr_trunk_J_RF_foot(4,2) = ( 0.33 *  s__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  c__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  c__q_RF_HFE);
jacs.fr_trunk_J_RF_foot(4,3) = ( 0.33 *  s__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  c__q_RF_HFE *  c__q_RF_KFE);
jacs.fr_trunk_J_RF_foot(5,1) = (- 0.33 *  c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) + ( 0.33 *  c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  c__q_RF_HAA);
jacs.fr_trunk_J_RF_foot(5,2) = (- 0.33 *  s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  s__q_RF_HAA *  s__q_RF_HFE);
jacs.fr_trunk_J_RF_foot(5,3) = (- 0.33 *  s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
jacs.fr_trunk_J_RF_foot(6,1) = (- 0.33 *  s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) + ( 0.33 *  s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA);
jacs.fr_trunk_J_RF_foot(6,2) = ( 0.33 *  c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( 0.33 *  c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  c__q_RF_HAA *  s__q_RF_HFE);
jacs.fr_trunk_J_RF_foot(6,3) = ( 0.33 *  c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( 0.33 *  c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);





jacs.fr_trunk_J_LH_foot(2,2) =  c__q_LH_HAA;
jacs.fr_trunk_J_LH_foot(2,3) =  c__q_LH_HAA;
jacs.fr_trunk_J_LH_foot(3,2) = - s__q_LH_HAA;
jacs.fr_trunk_J_LH_foot(3,3) = - s__q_LH_HAA;
jacs.fr_trunk_J_LH_foot(4,2) = ( 0.33 *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  c__q_LH_HFE);
jacs.fr_trunk_J_LH_foot(4,3) = ( 0.33 *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  c__q_LH_HFE *  c__q_LH_KFE);
jacs.fr_trunk_J_LH_foot(5,1) = ( 0.33 *  c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);
jacs.fr_trunk_J_LH_foot(5,2) = ( 0.33 *  s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( 0.33 *  s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE) + ( 0.35 *  s__q_LH_HAA *  s__q_LH_HFE);
jacs.fr_trunk_J_LH_foot(5,3) = ( 0.33 *  s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( 0.33 *  s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
jacs.fr_trunk_J_LH_foot(6,1) = (- 0.33 *  s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) + ( 0.33 *  s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) + ( 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) + ( 0.08 *  s__q_LH_HAA);
jacs.fr_trunk_J_LH_foot(6,2) = ( 0.33 *  c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( 0.33 *  c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE) + ( 0.35 *  c__q_LH_HAA *  s__q_LH_HFE);
jacs.fr_trunk_J_LH_foot(6,3) = ( 0.33 *  c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( 0.33 *  c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);





jacs.fr_trunk_J_RH_foot(2,2) =  c__q_RH_HAA;
jacs.fr_trunk_J_RH_foot(2,3) =  c__q_RH_HAA;
jacs.fr_trunk_J_RH_foot(3,2) =  s__q_RH_HAA;
jacs.fr_trunk_J_RH_foot(3,3) =  s__q_RH_HAA;
jacs.fr_trunk_J_RH_foot(4,2) = ( 0.33 *  s__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  c__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  c__q_RH_HFE);
jacs.fr_trunk_J_RH_foot(4,3) = ( 0.33 *  s__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  c__q_RH_HFE *  c__q_RH_KFE);
jacs.fr_trunk_J_RH_foot(5,1) = (- 0.33 *  c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) + ( 0.33 *  c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  c__q_RH_HAA);
jacs.fr_trunk_J_RH_foot(5,2) = (- 0.33 *  s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  s__q_RH_HAA *  s__q_RH_HFE);
jacs.fr_trunk_J_RH_foot(5,3) = (- 0.33 *  s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
jacs.fr_trunk_J_RH_foot(6,1) = (- 0.33 *  s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) + ( 0.33 *  s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA);
jacs.fr_trunk_J_RH_foot(6,2) = ( 0.33 *  c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( 0.33 *  c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  c__q_RH_HAA *  s__q_RH_HFE);
jacs.fr_trunk_J_RH_foot(6,3) = ( 0.33 *  c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( 0.33 *  c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);






out = jacs;

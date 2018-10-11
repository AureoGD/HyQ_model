function out = updateHomogeneousTransforms(tr, q, params)

s__q_LF_HAA = sin( q(1));
s__q_RF_HAA = sin( q(4));
s__q_LH_HAA = sin( q(7));
s__q_RH_HAA = sin( q(10));
s__q_LF_HFE = sin( q(2));
s__q_RF_HFE = sin( q(5));
s__q_LH_HFE = sin( q(8));
s__q_RH_HFE = sin( q(11));
s__q_LF_KFE = sin( q(3));
s__q_RF_KFE = sin( q(6));
s__q_LH_KFE = sin( q(9));
s__q_RH_KFE = sin( q(12));
c__q_LF_HAA = cos( q(1));
c__q_RF_HAA = cos( q(4));
c__q_LH_HAA = cos( q(7));
c__q_RH_HAA = cos( q(10));
c__q_LF_HFE = cos( q(2));
c__q_RF_HFE = cos( q(5));
c__q_LH_HFE = cos( q(8));
c__q_RH_HFE = cos( q(11));
c__q_LF_KFE = cos( q(3));
c__q_RF_KFE = cos( q(6));
c__q_LH_KFE = cos( q(9));
c__q_RH_KFE = cos( q(12));


tr.fr_trunk_Xh_LF_hipassemblyCOM(2,1) = - s__q_LF_HAA;
tr.fr_trunk_Xh_LF_hipassemblyCOM(2,2) = - c__q_LF_HAA;
tr.fr_trunk_Xh_LF_hipassemblyCOM(2,4) =  0.207 - ( 0.04263 *  s__q_LF_HAA);
tr.fr_trunk_Xh_LF_hipassemblyCOM(3,1) = - c__q_LF_HAA;
tr.fr_trunk_Xh_LF_hipassemblyCOM(3,2) =  s__q_LF_HAA;
tr.fr_trunk_Xh_LF_hipassemblyCOM(3,4) = - 0.04263 *  c__q_LF_HAA;



tr.fr_trunk_Xh_RF_hipassemblyCOM(2,1) =  s__q_RF_HAA;
tr.fr_trunk_Xh_RF_hipassemblyCOM(2,2) =  c__q_RF_HAA;
tr.fr_trunk_Xh_RF_hipassemblyCOM(2,4) = ( 0.04263 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_RF_hipassemblyCOM(3,1) = - c__q_RF_HAA;
tr.fr_trunk_Xh_RF_hipassemblyCOM(3,2) =  s__q_RF_HAA;
tr.fr_trunk_Xh_RF_hipassemblyCOM(3,4) = - 0.04263 *  c__q_RF_HAA;



tr.fr_trunk_Xh_LH_hipassemblyCOM(2,1) = - s__q_LH_HAA;
tr.fr_trunk_Xh_LH_hipassemblyCOM(2,2) = - c__q_LH_HAA;
tr.fr_trunk_Xh_LH_hipassemblyCOM(2,4) =  0.207 - ( 0.04263 *  s__q_LH_HAA);
tr.fr_trunk_Xh_LH_hipassemblyCOM(3,1) = - c__q_LH_HAA;
tr.fr_trunk_Xh_LH_hipassemblyCOM(3,2) =  s__q_LH_HAA;
tr.fr_trunk_Xh_LH_hipassemblyCOM(3,4) = - 0.04263 *  c__q_LH_HAA;



tr.fr_trunk_Xh_RH_hipassemblyCOM(2,1) =  s__q_RH_HAA;
tr.fr_trunk_Xh_RH_hipassemblyCOM(2,2) =  c__q_RH_HAA;
tr.fr_trunk_Xh_RH_hipassemblyCOM(2,4) = ( 0.04263 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_RH_hipassemblyCOM(3,1) = - c__q_RH_HAA;
tr.fr_trunk_Xh_RH_hipassemblyCOM(3,2) =  s__q_RH_HAA;
tr.fr_trunk_Xh_RH_hipassemblyCOM(3,4) = - 0.04263 *  c__q_RH_HAA;



tr.fr_trunk_Xh_LF_upperlegCOM(1,1) = - s__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(1,2) = - c__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(1,4) = (- 0.1507 *  s__q_LF_HFE) + ( 0.02625 *  c__q_LF_HFE) +  0.3735;
tr.fr_trunk_Xh_LF_upperlegCOM(2,1) = - s__q_LF_HAA *  c__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(2,2) =  s__q_LF_HAA *  s__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(2,3) =  c__q_LF_HAA;
tr.fr_trunk_Xh_LF_upperlegCOM(2,4) = (- 0.02625 *  s__q_LF_HAA *  s__q_LF_HFE) - ( 0.1507 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
tr.fr_trunk_Xh_LF_upperlegCOM(3,1) = - c__q_LF_HAA *  c__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(3,2) =  c__q_LF_HAA *  s__q_LF_HFE;
tr.fr_trunk_Xh_LF_upperlegCOM(3,3) = - s__q_LF_HAA;
tr.fr_trunk_Xh_LF_upperlegCOM(3,4) = (- 0.02625 *  c__q_LF_HAA *  s__q_LF_HFE) - ( 0.1507 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



tr.fr_trunk_Xh_RF_upperlegCOM(1,1) = - s__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(1,2) = - c__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(1,4) = (- 0.1507 *  s__q_RF_HFE) + ( 0.02625 *  c__q_RF_HFE) +  0.3735;
tr.fr_trunk_Xh_RF_upperlegCOM(2,1) =  s__q_RF_HAA *  c__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(2,2) = - s__q_RF_HAA *  s__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(2,3) =  c__q_RF_HAA;
tr.fr_trunk_Xh_RF_upperlegCOM(2,4) = ( 0.02625 *  s__q_RF_HAA *  s__q_RF_HFE) + ( 0.1507 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_RF_upperlegCOM(3,1) = - c__q_RF_HAA *  c__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(3,2) =  c__q_RF_HAA *  s__q_RF_HFE;
tr.fr_trunk_Xh_RF_upperlegCOM(3,3) =  s__q_RF_HAA;
tr.fr_trunk_Xh_RF_upperlegCOM(3,4) = (- 0.02625 *  c__q_RF_HAA *  s__q_RF_HFE) - ( 0.1507 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



tr.fr_trunk_Xh_LH_upperlegCOM(1,1) = - s__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(1,2) = - c__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(1,4) = (- 0.1507 *  s__q_LH_HFE) - ( 0.02625 *  c__q_LH_HFE) -  0.3735;
tr.fr_trunk_Xh_LH_upperlegCOM(2,1) = - s__q_LH_HAA *  c__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(2,2) =  s__q_LH_HAA *  s__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(2,3) =  c__q_LH_HAA;
tr.fr_trunk_Xh_LH_upperlegCOM(2,4) = ( 0.02625 *  s__q_LH_HAA *  s__q_LH_HFE) - ( 0.1507 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
tr.fr_trunk_Xh_LH_upperlegCOM(3,1) = - c__q_LH_HAA *  c__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(3,2) =  c__q_LH_HAA *  s__q_LH_HFE;
tr.fr_trunk_Xh_LH_upperlegCOM(3,3) = - s__q_LH_HAA;
tr.fr_trunk_Xh_LH_upperlegCOM(3,4) = ( 0.02625 *  c__q_LH_HAA *  s__q_LH_HFE) - ( 0.1507 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



tr.fr_trunk_Xh_RH_upperlegCOM(1,1) = - s__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(1,2) = - c__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(1,4) = (- 0.1507 *  s__q_RH_HFE) - ( 0.02625 *  c__q_RH_HFE) -  0.3735;
tr.fr_trunk_Xh_RH_upperlegCOM(2,1) =  s__q_RH_HAA *  c__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(2,2) = - s__q_RH_HAA *  s__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(2,3) =  c__q_RH_HAA;
tr.fr_trunk_Xh_RH_upperlegCOM(2,4) = (- 0.02625 *  s__q_RH_HAA *  s__q_RH_HFE) + ( 0.1507 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_RH_upperlegCOM(3,1) = - c__q_RH_HAA *  c__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(3,2) =  c__q_RH_HAA *  s__q_RH_HFE;
tr.fr_trunk_Xh_RH_upperlegCOM(3,3) =  s__q_RH_HAA;
tr.fr_trunk_Xh_RH_upperlegCOM(3,4) = ( 0.02625 *  c__q_RH_HAA *  s__q_RH_HFE) - ( 0.1507 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



tr.fr_trunk_Xh_LF_lowerlegCOM(1,1) = (- c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(1,2) = ( s__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(1,4) = (- 0.1254 *  c__q_LF_HFE *  s__q_LF_KFE) - ( 0.1254 *  s__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HFE) +  0.3735;
tr.fr_trunk_Xh_LF_lowerlegCOM(2,1) = ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(2,2) = ( s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(2,3) =  c__q_LF_HAA;
tr.fr_trunk_Xh_LF_lowerlegCOM(2,4) = ( 0.1254 *  s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.1254 *  s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
tr.fr_trunk_Xh_LF_lowerlegCOM(3,1) = ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(3,2) = ( c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_lowerlegCOM(3,3) = - s__q_LF_HAA;
tr.fr_trunk_Xh_LF_lowerlegCOM(3,4) = ( 0.1254 *  c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.1254 *  c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



tr.fr_trunk_Xh_RF_lowerlegCOM(1,1) = (- c__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(1,2) = ( s__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(1,4) = (- 0.1254 *  c__q_RF_HFE *  s__q_RF_KFE) - ( 0.1254 *  s__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  s__q_RF_HFE) +  0.3735;
tr.fr_trunk_Xh_RF_lowerlegCOM(2,1) = ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(2,2) = (- s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(2,3) =  c__q_RF_HAA;
tr.fr_trunk_Xh_RF_lowerlegCOM(2,4) = (- 0.1254 *  s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) + ( 0.1254 *  s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_RF_lowerlegCOM(3,1) = ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(3,2) = ( c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_lowerlegCOM(3,3) =  s__q_RF_HAA;
tr.fr_trunk_Xh_RF_lowerlegCOM(3,4) = ( 0.1254 *  c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( 0.1254 *  c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



tr.fr_trunk_Xh_LH_lowerlegCOM(1,1) = (- c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(1,2) = ( s__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(1,4) = (- 0.1254 *  c__q_LH_HFE *  s__q_LH_KFE) - ( 0.1254 *  s__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HFE) -  0.3735;
tr.fr_trunk_Xh_LH_lowerlegCOM(2,1) = ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(2,2) = ( s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(2,3) =  c__q_LH_HAA;
tr.fr_trunk_Xh_LH_lowerlegCOM(2,4) = ( 0.1254 *  s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.1254 *  s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
tr.fr_trunk_Xh_LH_lowerlegCOM(3,1) = ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(3,2) = ( c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_lowerlegCOM(3,3) = - s__q_LH_HAA;
tr.fr_trunk_Xh_LH_lowerlegCOM(3,4) = ( 0.1254 *  c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.1254 *  c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



tr.fr_trunk_Xh_RH_lowerlegCOM(1,1) = (- c__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(1,2) = ( s__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(1,4) = (- 0.1254 *  c__q_RH_HFE *  s__q_RH_KFE) - ( 0.1254 *  s__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  s__q_RH_HFE) -  0.3735;
tr.fr_trunk_Xh_RH_lowerlegCOM(2,1) = ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(2,2) = (- s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(2,3) =  c__q_RH_HAA;
tr.fr_trunk_Xh_RH_lowerlegCOM(2,4) = (- 0.1254 *  s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) + ( 0.1254 *  s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_RH_lowerlegCOM(3,1) = ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(3,2) = ( c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_lowerlegCOM(3,3) =  s__q_RH_HAA;
tr.fr_trunk_Xh_RH_lowerlegCOM(3,4) = ( 0.1254 *  c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( 0.1254 *  c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



tr.fr_trunk_Xh_LF_foot(1,1) = ( c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HFE *  s__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(1,3) = ( c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(1,4) = (- 0.33 *  c__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  s__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HFE) +  0.3735;
tr.fr_trunk_Xh_LF_foot(2,1) = (- s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(2,2) =  c__q_LF_HAA;
tr.fr_trunk_Xh_LF_foot(2,3) = ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(2,4) = ( 0.33 *  s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
tr.fr_trunk_Xh_LF_foot(3,1) = (- c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(3,2) = - s__q_LF_HAA;
tr.fr_trunk_Xh_LF_foot(3,3) = ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
tr.fr_trunk_Xh_LF_foot(3,4) = ( 0.33 *  c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.33 *  c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



tr.fr_trunk_Xh_RF_foot(1,1) = ( c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HFE *  s__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(1,3) = ( c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(1,4) = (- 0.33 *  c__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  s__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  s__q_RF_HFE) +  0.3735;
tr.fr_trunk_Xh_RF_foot(2,1) = ( s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(2,2) =  c__q_RF_HAA;
tr.fr_trunk_Xh_RF_foot(2,3) = ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(2,4) = (- 0.33 *  s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) + ( 0.33 *  s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_RF_foot(3,1) = (- c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(3,2) =  s__q_RF_HAA;
tr.fr_trunk_Xh_RF_foot(3,3) = ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
tr.fr_trunk_Xh_RF_foot(3,4) = ( 0.33 *  c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( 0.33 *  c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



tr.fr_trunk_Xh_LH_foot(1,1) = ( c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HFE *  s__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(1,3) = ( c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(1,4) = (- 0.33 *  c__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  s__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HFE) -  0.3735;
tr.fr_trunk_Xh_LH_foot(2,1) = (- s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(2,2) =  c__q_LH_HAA;
tr.fr_trunk_Xh_LH_foot(2,3) = ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(2,4) = ( 0.33 *  s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
tr.fr_trunk_Xh_LH_foot(3,1) = (- c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(3,2) = - s__q_LH_HAA;
tr.fr_trunk_Xh_LH_foot(3,3) = ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
tr.fr_trunk_Xh_LH_foot(3,4) = ( 0.33 *  c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.33 *  c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



tr.fr_trunk_Xh_RH_foot(1,1) = ( c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HFE *  s__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(1,3) = ( c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(1,4) = (- 0.33 *  c__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  s__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  s__q_RH_HFE) -  0.3735;
tr.fr_trunk_Xh_RH_foot(2,1) = ( s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(2,2) =  c__q_RH_HAA;
tr.fr_trunk_Xh_RH_foot(2,3) = ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(2,4) = (- 0.33 *  s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) + ( 0.33 *  s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_RH_foot(3,1) = (- c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(3,2) =  s__q_RH_HAA;
tr.fr_trunk_Xh_RH_foot(3,3) = ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
tr.fr_trunk_Xh_RH_foot(3,4) = ( 0.33 *  c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( 0.33 *  c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



tr.fr_LF_lowerleg_Xh_fr_trunk(1,1) = (- c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(1,2) = ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(1,3) = ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(1,4) = (((( 0.08 - ( 0.207 *  s__q_LF_HAA)) *  s__q_LF_HFE) + ( 0.3735 *  c__q_LF_HFE)) *  s__q_LF_KFE) + ((( 0.3735 *  s__q_LF_HFE) + ((( 0.207 *  s__q_LF_HAA) -  0.08) *  c__q_LF_HFE) -  0.35) *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(2,1) = ( s__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(2,2) = ( s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(2,3) = ( c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) + ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(2,4) = (((- 0.3735 *  s__q_LF_HFE) + (( 0.08 - ( 0.207 *  s__q_LF_HAA)) *  c__q_LF_HFE) +  0.35) *  s__q_LF_KFE) + (((( 0.08 - ( 0.207 *  s__q_LF_HAA)) *  s__q_LF_HFE) + ( 0.3735 *  c__q_LF_HFE)) *  c__q_LF_KFE);
tr.fr_LF_lowerleg_Xh_fr_trunk(3,2) =  c__q_LF_HAA;
tr.fr_LF_lowerleg_Xh_fr_trunk(3,3) = - s__q_LF_HAA;
tr.fr_LF_lowerleg_Xh_fr_trunk(3,4) = - 0.207 *  c__q_LF_HAA;



tr.fr_RF_lowerleg_Xh_fr_trunk(1,1) = (- c__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(1,2) = ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(1,3) = ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(1,4) = (((( 0.08 - ( 0.207 *  s__q_RF_HAA)) *  s__q_RF_HFE) + ( 0.3735 *  c__q_RF_HFE)) *  s__q_RF_KFE) + ((( 0.3735 *  s__q_RF_HFE) + ((( 0.207 *  s__q_RF_HAA) -  0.08) *  c__q_RF_HFE) -  0.35) *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(2,1) = ( s__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HFE *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(2,2) = (- s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(2,3) = ( c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(2,4) = (((- 0.3735 *  s__q_RF_HFE) + (( 0.08 - ( 0.207 *  s__q_RF_HAA)) *  c__q_RF_HFE) +  0.35) *  s__q_RF_KFE) + (((( 0.08 - ( 0.207 *  s__q_RF_HAA)) *  s__q_RF_HFE) + ( 0.3735 *  c__q_RF_HFE)) *  c__q_RF_KFE);
tr.fr_RF_lowerleg_Xh_fr_trunk(3,2) =  c__q_RF_HAA;
tr.fr_RF_lowerleg_Xh_fr_trunk(3,3) =  s__q_RF_HAA;
tr.fr_RF_lowerleg_Xh_fr_trunk(3,4) =  0.207 *  c__q_RF_HAA;



tr.fr_LH_lowerleg_Xh_fr_trunk(1,1) = (- c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(1,2) = ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(1,3) = ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(1,4) = (((( 0.08 - ( 0.207 *  s__q_LH_HAA)) *  s__q_LH_HFE) - ( 0.3735 *  c__q_LH_HFE)) *  s__q_LH_KFE) + (((- 0.3735 *  s__q_LH_HFE) + ((( 0.207 *  s__q_LH_HAA) -  0.08) *  c__q_LH_HFE) -  0.35) *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(2,1) = ( s__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(2,2) = ( s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(2,3) = ( c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) + ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(2,4) = ((( 0.3735 *  s__q_LH_HFE) + (( 0.08 - ( 0.207 *  s__q_LH_HAA)) *  c__q_LH_HFE) +  0.35) *  s__q_LH_KFE) + (((( 0.08 - ( 0.207 *  s__q_LH_HAA)) *  s__q_LH_HFE) - ( 0.3735 *  c__q_LH_HFE)) *  c__q_LH_KFE);
tr.fr_LH_lowerleg_Xh_fr_trunk(3,2) =  c__q_LH_HAA;
tr.fr_LH_lowerleg_Xh_fr_trunk(3,3) = - s__q_LH_HAA;
tr.fr_LH_lowerleg_Xh_fr_trunk(3,4) = - 0.207 *  c__q_LH_HAA;



tr.fr_RH_lowerleg_Xh_fr_trunk(1,1) = (- c__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(1,2) = ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(1,3) = ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(1,4) = (((( 0.08 - ( 0.207 *  s__q_RH_HAA)) *  s__q_RH_HFE) - ( 0.3735 *  c__q_RH_HFE)) *  s__q_RH_KFE) + (((- 0.3735 *  s__q_RH_HFE) + ((( 0.207 *  s__q_RH_HAA) -  0.08) *  c__q_RH_HFE) -  0.35) *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(2,1) = ( s__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HFE *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(2,2) = (- s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(2,3) = ( c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(2,4) = ((( 0.3735 *  s__q_RH_HFE) + (( 0.08 - ( 0.207 *  s__q_RH_HAA)) *  c__q_RH_HFE) +  0.35) *  s__q_RH_KFE) + (((( 0.08 - ( 0.207 *  s__q_RH_HAA)) *  s__q_RH_HFE) - ( 0.3735 *  c__q_RH_HFE)) *  c__q_RH_KFE);
tr.fr_RH_lowerleg_Xh_fr_trunk(3,2) =  c__q_RH_HAA;
tr.fr_RH_lowerleg_Xh_fr_trunk(3,3) =  s__q_RH_HAA;
tr.fr_RH_lowerleg_Xh_fr_trunk(3,4) =  0.207 *  c__q_RH_HAA;



tr.LF_foot_Xh_fr_trunk(1,1) = ( c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HFE *  s__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(1,2) = (- s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(1,3) = (- c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(1,4) = ((( 0.3735 *  s__q_LF_HFE) + ((( 0.207 *  s__q_LF_HAA) -  0.08) *  c__q_LF_HFE) -  0.35) *  s__q_LF_KFE) + ((((( 0.207 *  s__q_LF_HAA) -  0.08) *  s__q_LF_HFE) - ( 0.3735 *  c__q_LF_HFE)) *  c__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(2,2) =  c__q_LF_HAA;
tr.LF_foot_Xh_fr_trunk(2,3) = - s__q_LF_HAA;
tr.LF_foot_Xh_fr_trunk(2,4) = - 0.207 *  c__q_LF_HAA;
tr.LF_foot_Xh_fr_trunk(3,1) = ( c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HFE *  c__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(3,2) = ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(3,3) = ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
tr.LF_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_LF_HAA) -  0.08) *  s__q_LF_HFE) - ( 0.3735 *  c__q_LF_HFE)) *  s__q_LF_KFE) + (((- 0.3735 *  s__q_LF_HFE) + (( 0.08 - ( 0.207 *  s__q_LF_HAA)) *  c__q_LF_HFE) +  0.35) *  c__q_LF_KFE) +  0.33;



tr.RF_foot_Xh_fr_trunk(1,1) = ( c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HFE *  s__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(1,2) = ( s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(1,3) = (- c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(1,4) = ((( 0.3735 *  s__q_RF_HFE) + ((( 0.207 *  s__q_RF_HAA) -  0.08) *  c__q_RF_HFE) -  0.35) *  s__q_RF_KFE) + ((((( 0.207 *  s__q_RF_HAA) -  0.08) *  s__q_RF_HFE) - ( 0.3735 *  c__q_RF_HFE)) *  c__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(2,2) =  c__q_RF_HAA;
tr.RF_foot_Xh_fr_trunk(2,3) =  s__q_RF_HAA;
tr.RF_foot_Xh_fr_trunk(2,4) =  0.207 *  c__q_RF_HAA;
tr.RF_foot_Xh_fr_trunk(3,1) = ( c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HFE *  c__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(3,2) = ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(3,3) = ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
tr.RF_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_RF_HAA) -  0.08) *  s__q_RF_HFE) - ( 0.3735 *  c__q_RF_HFE)) *  s__q_RF_KFE) + (((- 0.3735 *  s__q_RF_HFE) + (( 0.08 - ( 0.207 *  s__q_RF_HAA)) *  c__q_RF_HFE) +  0.35) *  c__q_RF_KFE) +  0.33;



tr.LH_foot_Xh_fr_trunk(1,1) = ( c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HFE *  s__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(1,2) = (- s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(1,3) = (- c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(1,4) = (((- 0.3735 *  s__q_LH_HFE) + ((( 0.207 *  s__q_LH_HAA) -  0.08) *  c__q_LH_HFE) -  0.35) *  s__q_LH_KFE) + ((((( 0.207 *  s__q_LH_HAA) -  0.08) *  s__q_LH_HFE) + ( 0.3735 *  c__q_LH_HFE)) *  c__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(2,2) =  c__q_LH_HAA;
tr.LH_foot_Xh_fr_trunk(2,3) = - s__q_LH_HAA;
tr.LH_foot_Xh_fr_trunk(2,4) = - 0.207 *  c__q_LH_HAA;
tr.LH_foot_Xh_fr_trunk(3,1) = ( c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HFE *  c__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(3,2) = ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(3,3) = ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
tr.LH_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_LH_HAA) -  0.08) *  s__q_LH_HFE) + ( 0.3735 *  c__q_LH_HFE)) *  s__q_LH_KFE) + ((( 0.3735 *  s__q_LH_HFE) + (( 0.08 - ( 0.207 *  s__q_LH_HAA)) *  c__q_LH_HFE) +  0.35) *  c__q_LH_KFE) +  0.33;



tr.RH_foot_Xh_fr_trunk(1,1) = ( c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HFE *  s__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(1,2) = ( s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(1,3) = (- c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(1,4) = (((- 0.3735 *  s__q_RH_HFE) + ((( 0.207 *  s__q_RH_HAA) -  0.08) *  c__q_RH_HFE) -  0.35) *  s__q_RH_KFE) + ((((( 0.207 *  s__q_RH_HAA) -  0.08) *  s__q_RH_HFE) + ( 0.3735 *  c__q_RH_HFE)) *  c__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(2,2) =  c__q_RH_HAA;
tr.RH_foot_Xh_fr_trunk(2,3) =  s__q_RH_HAA;
tr.RH_foot_Xh_fr_trunk(2,4) =  0.207 *  c__q_RH_HAA;
tr.RH_foot_Xh_fr_trunk(3,1) = ( c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HFE *  c__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(3,2) = ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(3,3) = ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
tr.RH_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_RH_HAA) -  0.08) *  s__q_RH_HFE) + ( 0.3735 *  c__q_RH_HFE)) *  s__q_RH_KFE) + ((( 0.3735 *  s__q_RH_HFE) + (( 0.08 - ( 0.207 *  s__q_RH_HAA)) *  c__q_RH_HFE) +  0.35) *  c__q_RH_KFE) +  0.33;



tr.fr_trunk_Xh_fr_LF_HFE(2,1) = - s__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_HFE(2,3) =  c__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_HFE(2,4) =  0.207 - ( 0.08 *  s__q_LF_HAA);
tr.fr_trunk_Xh_fr_LF_HFE(3,1) = - c__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_HFE(3,3) = - s__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_HFE(3,4) = - 0.08 *  c__q_LF_HAA;



tr.fr_trunk_Xh_fr_LF_KFE(1,1) = - s__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(1,2) = - c__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(1,4) =  0.3735 - ( 0.35 *  s__q_LF_HFE);
tr.fr_trunk_Xh_fr_LF_KFE(2,1) = - s__q_LF_HAA *  c__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(2,2) =  s__q_LF_HAA *  s__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(2,3) =  c__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_KFE(2,4) = (- 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
tr.fr_trunk_Xh_fr_LF_KFE(3,1) = - c__q_LF_HAA *  c__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(3,2) =  c__q_LF_HAA *  s__q_LF_HFE;
tr.fr_trunk_Xh_fr_LF_KFE(3,3) = - s__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_KFE(3,4) = (- 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



tr.fr_trunk_Xh_fr_RF_HFE(2,1) =  s__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_HFE(2,3) =  c__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_HFE(2,4) = ( 0.08 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_fr_RF_HFE(3,1) = - c__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_HFE(3,3) =  s__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_HFE(3,4) = - 0.08 *  c__q_RF_HAA;



tr.fr_trunk_Xh_fr_RF_KFE(1,1) = - s__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(1,2) = - c__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(1,4) =  0.3735 - ( 0.35 *  s__q_RF_HFE);
tr.fr_trunk_Xh_fr_RF_KFE(2,1) =  s__q_RF_HAA *  c__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(2,2) = - s__q_RF_HAA *  s__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(2,3) =  c__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_KFE(2,4) = ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
tr.fr_trunk_Xh_fr_RF_KFE(3,1) = - c__q_RF_HAA *  c__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(3,2) =  c__q_RF_HAA *  s__q_RF_HFE;
tr.fr_trunk_Xh_fr_RF_KFE(3,3) =  s__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_KFE(3,4) = (- 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



tr.fr_trunk_Xh_fr_LH_HFE(2,1) = - s__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_HFE(2,3) =  c__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_HFE(2,4) =  0.207 - ( 0.08 *  s__q_LH_HAA);
tr.fr_trunk_Xh_fr_LH_HFE(3,1) = - c__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_HFE(3,3) = - s__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_HFE(3,4) = - 0.08 *  c__q_LH_HAA;



tr.fr_trunk_Xh_fr_LH_KFE(1,1) = - s__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(1,2) = - c__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(1,4) = (- 0.35 *  s__q_LH_HFE) -  0.3735;
tr.fr_trunk_Xh_fr_LH_KFE(2,1) = - s__q_LH_HAA *  c__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(2,2) =  s__q_LH_HAA *  s__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(2,3) =  c__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_KFE(2,4) = (- 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
tr.fr_trunk_Xh_fr_LH_KFE(3,1) = - c__q_LH_HAA *  c__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(3,2) =  c__q_LH_HAA *  s__q_LH_HFE;
tr.fr_trunk_Xh_fr_LH_KFE(3,3) = - s__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_KFE(3,4) = (- 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



tr.fr_trunk_Xh_fr_RH_HFE(2,1) =  s__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_HFE(2,3) =  c__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_HFE(2,4) = ( 0.08 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_fr_RH_HFE(3,1) = - c__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_HFE(3,3) =  s__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_HFE(3,4) = - 0.08 *  c__q_RH_HAA;



tr.fr_trunk_Xh_fr_RH_KFE(1,1) = - s__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(1,2) = - c__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(1,4) = (- 0.35 *  s__q_RH_HFE) -  0.3735;
tr.fr_trunk_Xh_fr_RH_KFE(2,1) =  s__q_RH_HAA *  c__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(2,2) = - s__q_RH_HAA *  s__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(2,3) =  c__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_KFE(2,4) = ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
tr.fr_trunk_Xh_fr_RH_KFE(3,1) = - c__q_RH_HAA *  c__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(3,2) =  c__q_RH_HAA *  s__q_RH_HFE;
tr.fr_trunk_Xh_fr_RH_KFE(3,3) =  s__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_KFE(3,4) = (- 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



tr.fr_LF_hipassembly_Xh_fr_trunk(1,2) = - s__q_LF_HAA;
tr.fr_LF_hipassembly_Xh_fr_trunk(1,3) = - c__q_LF_HAA;
tr.fr_LF_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_LF_HAA;
tr.fr_LF_hipassembly_Xh_fr_trunk(2,2) = - c__q_LF_HAA;
tr.fr_LF_hipassembly_Xh_fr_trunk(2,3) =  s__q_LF_HAA;
tr.fr_LF_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_LF_HAA;



tr.fr_trunk_Xh_fr_LF_hipassembly(2,1) = - s__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_hipassembly(2,2) = - c__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_hipassembly(3,1) = - c__q_LF_HAA;
tr.fr_trunk_Xh_fr_LF_hipassembly(3,2) =  s__q_LF_HAA;



tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,1) =  c__q_LF_HFE;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,3) =  s__q_LF_HFE;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,4) = - 0.08 *  c__q_LF_HFE;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,1) = - s__q_LF_HFE;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,3) =  c__q_LF_HFE;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,4) =  0.08 *  s__q_LF_HFE;



tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(1,1) =  c__q_LF_HFE;
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(1,2) = - s__q_LF_HFE;
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(3,1) =  s__q_LF_HFE;
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(3,2) =  c__q_LF_HFE;



tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,1) =  c__q_LF_KFE;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,2) =  s__q_LF_KFE;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,4) = - 0.35 *  c__q_LF_KFE;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,1) = - s__q_LF_KFE;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,2) =  c__q_LF_KFE;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,4) =  0.35 *  s__q_LF_KFE;



tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(1,1) =  c__q_LF_KFE;
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(1,2) = - s__q_LF_KFE;
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(2,1) =  s__q_LF_KFE;
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(2,2) =  c__q_LF_KFE;



tr.fr_RF_hipassembly_Xh_fr_trunk(1,2) =  s__q_RF_HAA;
tr.fr_RF_hipassembly_Xh_fr_trunk(1,3) = - c__q_RF_HAA;
tr.fr_RF_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_RF_HAA;
tr.fr_RF_hipassembly_Xh_fr_trunk(2,2) =  c__q_RF_HAA;
tr.fr_RF_hipassembly_Xh_fr_trunk(2,3) =  s__q_RF_HAA;
tr.fr_RF_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_RF_HAA;



tr.fr_trunk_Xh_fr_RF_hipassembly(2,1) =  s__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_hipassembly(2,2) =  c__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_hipassembly(3,1) = - c__q_RF_HAA;
tr.fr_trunk_Xh_fr_RF_hipassembly(3,2) =  s__q_RF_HAA;



tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,1) =  c__q_RF_HFE;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,3) = - s__q_RF_HFE;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,4) = - 0.08 *  c__q_RF_HFE;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,1) = - s__q_RF_HFE;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,3) = - c__q_RF_HFE;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,4) =  0.08 *  s__q_RF_HFE;



tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(1,1) =  c__q_RF_HFE;
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(1,2) = - s__q_RF_HFE;
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(3,1) = - s__q_RF_HFE;
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(3,2) = - c__q_RF_HFE;



tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,1) =  c__q_RF_KFE;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,2) =  s__q_RF_KFE;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,4) = - 0.35 *  c__q_RF_KFE;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,1) = - s__q_RF_KFE;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,2) =  c__q_RF_KFE;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,4) =  0.35 *  s__q_RF_KFE;



tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(1,1) =  c__q_RF_KFE;
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(1,2) = - s__q_RF_KFE;
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(2,1) =  s__q_RF_KFE;
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(2,2) =  c__q_RF_KFE;



tr.fr_LH_hipassembly_Xh_fr_trunk(1,2) = - s__q_LH_HAA;
tr.fr_LH_hipassembly_Xh_fr_trunk(1,3) = - c__q_LH_HAA;
tr.fr_LH_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_LH_HAA;
tr.fr_LH_hipassembly_Xh_fr_trunk(2,2) = - c__q_LH_HAA;
tr.fr_LH_hipassembly_Xh_fr_trunk(2,3) =  s__q_LH_HAA;
tr.fr_LH_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_LH_HAA;



tr.fr_trunk_Xh_fr_LH_hipassembly(2,1) = - s__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_hipassembly(2,2) = - c__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_hipassembly(3,1) = - c__q_LH_HAA;
tr.fr_trunk_Xh_fr_LH_hipassembly(3,2) =  s__q_LH_HAA;



tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,1) =  c__q_LH_HFE;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,3) =  s__q_LH_HFE;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,4) = - 0.08 *  c__q_LH_HFE;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,1) = - s__q_LH_HFE;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,3) =  c__q_LH_HFE;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,4) =  0.08 *  s__q_LH_HFE;



tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(1,1) =  c__q_LH_HFE;
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(1,2) = - s__q_LH_HFE;
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(3,1) =  s__q_LH_HFE;
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(3,2) =  c__q_LH_HFE;



tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,1) =  c__q_LH_KFE;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,2) =  s__q_LH_KFE;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,4) = - 0.35 *  c__q_LH_KFE;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,1) = - s__q_LH_KFE;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,2) =  c__q_LH_KFE;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,4) =  0.35 *  s__q_LH_KFE;



tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(1,1) =  c__q_LH_KFE;
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(1,2) = - s__q_LH_KFE;
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(2,1) =  s__q_LH_KFE;
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(2,2) =  c__q_LH_KFE;



tr.fr_RH_hipassembly_Xh_fr_trunk(1,2) =  s__q_RH_HAA;
tr.fr_RH_hipassembly_Xh_fr_trunk(1,3) = - c__q_RH_HAA;
tr.fr_RH_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_RH_HAA;
tr.fr_RH_hipassembly_Xh_fr_trunk(2,2) =  c__q_RH_HAA;
tr.fr_RH_hipassembly_Xh_fr_trunk(2,3) =  s__q_RH_HAA;
tr.fr_RH_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_RH_HAA;



tr.fr_trunk_Xh_fr_RH_hipassembly(2,1) =  s__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_hipassembly(2,2) =  c__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_hipassembly(3,1) = - c__q_RH_HAA;
tr.fr_trunk_Xh_fr_RH_hipassembly(3,2) =  s__q_RH_HAA;



tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,1) =  c__q_RH_HFE;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,3) = - s__q_RH_HFE;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,4) = - 0.08 *  c__q_RH_HFE;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,1) = - s__q_RH_HFE;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,3) = - c__q_RH_HFE;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,4) =  0.08 *  s__q_RH_HFE;



tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(1,1) =  c__q_RH_HFE;
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(1,2) = - s__q_RH_HFE;
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(3,1) = - s__q_RH_HFE;
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(3,2) = - c__q_RH_HFE;



tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,1) =  c__q_RH_KFE;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,2) =  s__q_RH_KFE;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,4) = - 0.35 *  c__q_RH_KFE;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,1) = - s__q_RH_KFE;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,2) =  c__q_RH_KFE;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,4) =  0.35 *  s__q_RH_KFE;



tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(1,1) =  c__q_RH_KFE;
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(1,2) = - s__q_RH_KFE;
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(2,1) =  s__q_RH_KFE;
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(2,2) =  c__q_RH_KFE;





out = tr;
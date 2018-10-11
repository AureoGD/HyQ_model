s__q_LF_HFE = sin( q(2));
s__q_LF_KFE = sin( q(3));
s__q_LF_HAA = sin( q(1));
s__q_RF_HFE = sin( q(5));
s__q_RF_KFE = sin( q(6));
s__q_RF_HAA = sin( q(4));
s__q_LH_HFE = sin( q(8));
s__q_LH_KFE = sin( q(9));
s__q_LH_HAA = sin( q(7));
s__q_RH_HFE = sin( q(11));
s__q_RH_KFE = sin( q(12));
s__q_RH_HAA = sin( q(10));
c__q_LF_HFE = cos( q(2));
c__q_LF_KFE = cos( q(3));
c__q_LF_HAA = cos( q(1));
c__q_RF_HFE = cos( q(5));
c__q_RF_KFE = cos( q(6));
c__q_RF_HAA = cos( q(4));
c__q_LH_HFE = cos( q(8));
c__q_LH_KFE = cos( q(9));
c__q_LH_HAA = cos( q(7));
c__q_RH_HFE = cos( q(11));
c__q_RH_KFE = cos( q(12));
c__q_RH_HAA = cos( q(10));


LF_foot_Xh_fr_trunk(1,1) = ( c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HFE *  s__q_LF_KFE);
LF_foot_Xh_fr_trunk(1,2) = (- s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
LF_foot_Xh_fr_trunk(1,3) = (- c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
LF_foot_Xh_fr_trunk(1,4) = ((( 0.3735 *  s__q_LF_HFE) + ((( 0.207 *  s__q_LF_HAA) -  0.08) *  c__q_LF_HFE) -  0.35) *  s__q_LF_KFE) + ((((( 0.207 *  s__q_LF_HAA) -  0.08) *  s__q_LF_HFE) - ( 0.3735 *  c__q_LF_HFE)) *  c__q_LF_KFE);
LF_foot_Xh_fr_trunk(2,2) =  c__q_LF_HAA;
LF_foot_Xh_fr_trunk(2,3) = - s__q_LF_HAA;
LF_foot_Xh_fr_trunk(2,4) = - 0.207 *  c__q_LF_HAA;
LF_foot_Xh_fr_trunk(3,1) = ( c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HFE *  c__q_LF_KFE);
LF_foot_Xh_fr_trunk(3,2) = ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
LF_foot_Xh_fr_trunk(3,3) = ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
LF_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_LF_HAA) -  0.08) *  s__q_LF_HFE) - ( 0.3735 *  c__q_LF_HFE)) *  s__q_LF_KFE) + (((- 0.3735 *  s__q_LF_HFE) + (( 0.08 - ( 0.207 *  s__q_LF_HAA)) *  c__q_LF_HFE) +  0.35) *  c__q_LF_KFE) +  0.341;



RF_foot_Xh_fr_trunk(1,1) = ( c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HFE *  s__q_RF_KFE);
RF_foot_Xh_fr_trunk(1,2) = ( s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
RF_foot_Xh_fr_trunk(1,3) = (- c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
RF_foot_Xh_fr_trunk(1,4) = ((( 0.3735 *  s__q_RF_HFE) + ((( 0.207 *  s__q_RF_HAA) -  0.08) *  c__q_RF_HFE) -  0.35) *  s__q_RF_KFE) + ((((( 0.207 *  s__q_RF_HAA) -  0.08) *  s__q_RF_HFE) - ( 0.3735 *  c__q_RF_HFE)) *  c__q_RF_KFE);
RF_foot_Xh_fr_trunk(2,2) =  c__q_RF_HAA;
RF_foot_Xh_fr_trunk(2,3) =  s__q_RF_HAA;
RF_foot_Xh_fr_trunk(2,4) =  0.207 *  c__q_RF_HAA;
RF_foot_Xh_fr_trunk(3,1) = ( c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HFE *  c__q_RF_KFE);
RF_foot_Xh_fr_trunk(3,2) = ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
RF_foot_Xh_fr_trunk(3,3) = ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
RF_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_RF_HAA) -  0.08) *  s__q_RF_HFE) - ( 0.3735 *  c__q_RF_HFE)) *  s__q_RF_KFE) + (((- 0.3735 *  s__q_RF_HFE) + (( 0.08 - ( 0.207 *  s__q_RF_HAA)) *  c__q_RF_HFE) +  0.35) *  c__q_RF_KFE) +  0.341;



LH_foot_Xh_fr_trunk(1,1) = ( c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HFE *  s__q_LH_KFE);
LH_foot_Xh_fr_trunk(1,2) = (- s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
LH_foot_Xh_fr_trunk(1,3) = (- c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
LH_foot_Xh_fr_trunk(1,4) = (((- 0.3735 *  s__q_LH_HFE) + ((( 0.207 *  s__q_LH_HAA) -  0.08) *  c__q_LH_HFE) -  0.35) *  s__q_LH_KFE) + ((((( 0.207 *  s__q_LH_HAA) -  0.08) *  s__q_LH_HFE) + ( 0.3735 *  c__q_LH_HFE)) *  c__q_LH_KFE);
LH_foot_Xh_fr_trunk(2,2) =  c__q_LH_HAA;
LH_foot_Xh_fr_trunk(2,3) = - s__q_LH_HAA;
LH_foot_Xh_fr_trunk(2,4) = - 0.207 *  c__q_LH_HAA;
LH_foot_Xh_fr_trunk(3,1) = ( c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HFE *  c__q_LH_KFE);
LH_foot_Xh_fr_trunk(3,2) = ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
LH_foot_Xh_fr_trunk(3,3) = ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
LH_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_LH_HAA) -  0.08) *  s__q_LH_HFE) + ( 0.3735 *  c__q_LH_HFE)) *  s__q_LH_KFE) + ((( 0.3735 *  s__q_LH_HFE) + (( 0.08 - ( 0.207 *  s__q_LH_HAA)) *  c__q_LH_HFE) +  0.35) *  c__q_LH_KFE) +  0.341;



RH_foot_Xh_fr_trunk(1,1) = ( c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HFE *  s__q_RH_KFE);
RH_foot_Xh_fr_trunk(1,2) = ( s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
RH_foot_Xh_fr_trunk(1,3) = (- c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
RH_foot_Xh_fr_trunk(1,4) = (((- 0.3735 *  s__q_RH_HFE) + ((( 0.207 *  s__q_RH_HAA) -  0.08) *  c__q_RH_HFE) -  0.35) *  s__q_RH_KFE) + ((((( 0.207 *  s__q_RH_HAA) -  0.08) *  s__q_RH_HFE) + ( 0.3735 *  c__q_RH_HFE)) *  c__q_RH_KFE);
RH_foot_Xh_fr_trunk(2,2) =  c__q_RH_HAA;
RH_foot_Xh_fr_trunk(2,3) =  s__q_RH_HAA;
RH_foot_Xh_fr_trunk(2,4) =  0.207 *  c__q_RH_HAA;
RH_foot_Xh_fr_trunk(3,1) = ( c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HFE *  c__q_RH_KFE);
RH_foot_Xh_fr_trunk(3,2) = ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
RH_foot_Xh_fr_trunk(3,3) = ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
RH_foot_Xh_fr_trunk(3,4) = ((((( 0.207 *  s__q_RH_HAA) -  0.08) *  s__q_RH_HFE) + ( 0.3735 *  c__q_RH_HFE)) *  s__q_RH_KFE) + ((( 0.3735 *  s__q_RH_HFE) + (( 0.08 - ( 0.207 *  s__q_RH_HAA)) *  c__q_RH_HFE) +  0.35) *  c__q_RH_KFE) +  0.341;



fr_trunk_Xh_LF_foot(1,1) = ( c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HFE *  s__q_LF_KFE);
fr_trunk_Xh_LF_foot(1,3) = ( c__q_LF_HFE *  s__q_LF_KFE) + ( s__q_LF_HFE *  c__q_LF_KFE);
fr_trunk_Xh_LF_foot(1,4) = (- 0.341 *  c__q_LF_HFE *  s__q_LF_KFE) - ( 0.341 *  s__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HFE) +  0.3735;
fr_trunk_Xh_LF_foot(2,1) = (- s__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
fr_trunk_Xh_LF_foot(2,2) =  c__q_LF_HAA;
fr_trunk_Xh_LF_foot(2,3) = ( s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
fr_trunk_Xh_LF_foot(2,4) = ( 0.341 *  s__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.341 *  s__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
fr_trunk_Xh_LF_foot(3,1) = (- c__q_LF_HAA *  c__q_LF_HFE *  s__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  c__q_LF_KFE);
fr_trunk_Xh_LF_foot(3,2) = - s__q_LF_HAA;
fr_trunk_Xh_LF_foot(3,3) = ( c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE);
fr_trunk_Xh_LF_foot(3,4) = ( 0.341 *  c__q_LF_HAA *  s__q_LF_HFE *  s__q_LF_KFE) - ( 0.341 *  c__q_LF_HAA *  c__q_LF_HFE *  c__q_LF_KFE) - ( 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



fr_trunk_Xh_fr_LF_HFE(2,1) = - s__q_LF_HAA;
fr_trunk_Xh_fr_LF_HFE(2,3) =  c__q_LF_HAA;
fr_trunk_Xh_fr_LF_HFE(2,4) =  0.207 - ( 0.08 *  s__q_LF_HAA);
fr_trunk_Xh_fr_LF_HFE(3,1) = - c__q_LF_HAA;
fr_trunk_Xh_fr_LF_HFE(3,3) = - s__q_LF_HAA;
fr_trunk_Xh_fr_LF_HFE(3,4) = - 0.08 *  c__q_LF_HAA;



fr_trunk_Xh_fr_LF_KFE(1,1) = - s__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(1,2) = - c__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(1,4) =  0.3735 - ( 0.35 *  s__q_LF_HFE);
fr_trunk_Xh_fr_LF_KFE(2,1) = - s__q_LF_HAA *  c__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(2,2) =  s__q_LF_HAA *  s__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(2,3) =  c__q_LF_HAA;
fr_trunk_Xh_fr_LF_KFE(2,4) = (- 0.35 *  s__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  s__q_LF_HAA) +  0.207;
fr_trunk_Xh_fr_LF_KFE(3,1) = - c__q_LF_HAA *  c__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(3,2) =  c__q_LF_HAA *  s__q_LF_HFE;
fr_trunk_Xh_fr_LF_KFE(3,3) = - s__q_LF_HAA;
fr_trunk_Xh_fr_LF_KFE(3,4) = (- 0.35 *  c__q_LF_HAA *  c__q_LF_HFE) - ( 0.08 *  c__q_LF_HAA);



fr_trunk_Xh_RF_foot(1,1) = ( c__q_RF_HFE *  c__q_RF_KFE) - ( s__q_RF_HFE *  s__q_RF_KFE);
fr_trunk_Xh_RF_foot(1,3) = ( c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HFE *  c__q_RF_KFE);
fr_trunk_Xh_RF_foot(1,4) = (- 0.341 *  c__q_RF_HFE *  s__q_RF_KFE) - ( 0.341 *  s__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  s__q_RF_HFE) +  0.3735;
fr_trunk_Xh_RF_foot(2,1) = ( s__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) + ( s__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
fr_trunk_Xh_RF_foot(2,2) =  c__q_RF_HAA;
fr_trunk_Xh_RF_foot(2,3) = ( s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE);
fr_trunk_Xh_RF_foot(2,4) = (- 0.341 *  s__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) + ( 0.341 *  s__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) + ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
fr_trunk_Xh_RF_foot(3,1) = (- c__q_RF_HAA *  c__q_RF_HFE *  s__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  c__q_RF_KFE);
fr_trunk_Xh_RF_foot(3,2) =  s__q_RF_HAA;
fr_trunk_Xh_RF_foot(3,3) = ( c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE);
fr_trunk_Xh_RF_foot(3,4) = ( 0.341 *  c__q_RF_HAA *  s__q_RF_HFE *  s__q_RF_KFE) - ( 0.341 *  c__q_RF_HAA *  c__q_RF_HFE *  c__q_RF_KFE) - ( 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



fr_trunk_Xh_fr_RF_HFE(2,1) =  s__q_RF_HAA;
fr_trunk_Xh_fr_RF_HFE(2,3) =  c__q_RF_HAA;
fr_trunk_Xh_fr_RF_HFE(2,4) = ( 0.08 *  s__q_RF_HAA) -  0.207;
fr_trunk_Xh_fr_RF_HFE(3,1) = - c__q_RF_HAA;
fr_trunk_Xh_fr_RF_HFE(3,3) =  s__q_RF_HAA;
fr_trunk_Xh_fr_RF_HFE(3,4) = - 0.08 *  c__q_RF_HAA;



fr_trunk_Xh_fr_RF_KFE(1,1) = - s__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(1,2) = - c__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(1,4) =  0.3735 - ( 0.35 *  s__q_RF_HFE);
fr_trunk_Xh_fr_RF_KFE(2,1) =  s__q_RF_HAA *  c__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(2,2) = - s__q_RF_HAA *  s__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(2,3) =  c__q_RF_HAA;
fr_trunk_Xh_fr_RF_KFE(2,4) = ( 0.35 *  s__q_RF_HAA *  c__q_RF_HFE) + ( 0.08 *  s__q_RF_HAA) -  0.207;
fr_trunk_Xh_fr_RF_KFE(3,1) = - c__q_RF_HAA *  c__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(3,2) =  c__q_RF_HAA *  s__q_RF_HFE;
fr_trunk_Xh_fr_RF_KFE(3,3) =  s__q_RF_HAA;
fr_trunk_Xh_fr_RF_KFE(3,4) = (- 0.35 *  c__q_RF_HAA *  c__q_RF_HFE) - ( 0.08 *  c__q_RF_HAA);



fr_trunk_Xh_LH_foot(1,1) = ( c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HFE *  s__q_LH_KFE);
fr_trunk_Xh_LH_foot(1,3) = ( c__q_LH_HFE *  s__q_LH_KFE) + ( s__q_LH_HFE *  c__q_LH_KFE);
fr_trunk_Xh_LH_foot(1,4) = (- 0.341 *  c__q_LH_HFE *  s__q_LH_KFE) - ( 0.341 *  s__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HFE) -  0.3735;
fr_trunk_Xh_LH_foot(2,1) = (- s__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
fr_trunk_Xh_LH_foot(2,2) =  c__q_LH_HAA;
fr_trunk_Xh_LH_foot(2,3) = ( s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
fr_trunk_Xh_LH_foot(2,4) = ( 0.341 *  s__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.341 *  s__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
fr_trunk_Xh_LH_foot(3,1) = (- c__q_LH_HAA *  c__q_LH_HFE *  s__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  c__q_LH_KFE);
fr_trunk_Xh_LH_foot(3,2) = - s__q_LH_HAA;
fr_trunk_Xh_LH_foot(3,3) = ( c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE);
fr_trunk_Xh_LH_foot(3,4) = ( 0.341 *  c__q_LH_HAA *  s__q_LH_HFE *  s__q_LH_KFE) - ( 0.341 *  c__q_LH_HAA *  c__q_LH_HFE *  c__q_LH_KFE) - ( 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



fr_trunk_Xh_fr_LH_HFE(2,1) = - s__q_LH_HAA;
fr_trunk_Xh_fr_LH_HFE(2,3) =  c__q_LH_HAA;
fr_trunk_Xh_fr_LH_HFE(2,4) =  0.207 - ( 0.08 *  s__q_LH_HAA);
fr_trunk_Xh_fr_LH_HFE(3,1) = - c__q_LH_HAA;
fr_trunk_Xh_fr_LH_HFE(3,3) = - s__q_LH_HAA;
fr_trunk_Xh_fr_LH_HFE(3,4) = - 0.08 *  c__q_LH_HAA;



fr_trunk_Xh_fr_LH_KFE(1,1) = - s__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(1,2) = - c__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(1,4) = (- 0.35 *  s__q_LH_HFE) -  0.3735;
fr_trunk_Xh_fr_LH_KFE(2,1) = - s__q_LH_HAA *  c__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(2,2) =  s__q_LH_HAA *  s__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(2,3) =  c__q_LH_HAA;
fr_trunk_Xh_fr_LH_KFE(2,4) = (- 0.35 *  s__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  s__q_LH_HAA) +  0.207;
fr_trunk_Xh_fr_LH_KFE(3,1) = - c__q_LH_HAA *  c__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(3,2) =  c__q_LH_HAA *  s__q_LH_HFE;
fr_trunk_Xh_fr_LH_KFE(3,3) = - s__q_LH_HAA;
fr_trunk_Xh_fr_LH_KFE(3,4) = (- 0.35 *  c__q_LH_HAA *  c__q_LH_HFE) - ( 0.08 *  c__q_LH_HAA);



fr_trunk_Xh_RH_foot(1,1) = ( c__q_RH_HFE *  c__q_RH_KFE) - ( s__q_RH_HFE *  s__q_RH_KFE);
fr_trunk_Xh_RH_foot(1,3) = ( c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HFE *  c__q_RH_KFE);
fr_trunk_Xh_RH_foot(1,4) = (- 0.341 *  c__q_RH_HFE *  s__q_RH_KFE) - ( 0.341 *  s__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  s__q_RH_HFE) -  0.3735;
fr_trunk_Xh_RH_foot(2,1) = ( s__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) + ( s__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
fr_trunk_Xh_RH_foot(2,2) =  c__q_RH_HAA;
fr_trunk_Xh_RH_foot(2,3) = ( s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE);
fr_trunk_Xh_RH_foot(2,4) = (- 0.341 *  s__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) + ( 0.341 *  s__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) + ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
fr_trunk_Xh_RH_foot(3,1) = (- c__q_RH_HAA *  c__q_RH_HFE *  s__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  c__q_RH_KFE);
fr_trunk_Xh_RH_foot(3,2) =  s__q_RH_HAA;
fr_trunk_Xh_RH_foot(3,3) = ( c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE);
fr_trunk_Xh_RH_foot(3,4) = ( 0.341 *  c__q_RH_HAA *  s__q_RH_HFE *  s__q_RH_KFE) - ( 0.341 *  c__q_RH_HAA *  c__q_RH_HFE *  c__q_RH_KFE) - ( 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



fr_trunk_Xh_fr_RH_HFE(2,1) =  s__q_RH_HAA;
fr_trunk_Xh_fr_RH_HFE(2,3) =  c__q_RH_HAA;
fr_trunk_Xh_fr_RH_HFE(2,4) = ( 0.08 *  s__q_RH_HAA) -  0.207;
fr_trunk_Xh_fr_RH_HFE(3,1) = - c__q_RH_HAA;
fr_trunk_Xh_fr_RH_HFE(3,3) =  s__q_RH_HAA;
fr_trunk_Xh_fr_RH_HFE(3,4) = - 0.08 *  c__q_RH_HAA;



fr_trunk_Xh_fr_RH_KFE(1,1) = - s__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(1,2) = - c__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(1,4) = (- 0.35 *  s__q_RH_HFE) -  0.3735;
fr_trunk_Xh_fr_RH_KFE(2,1) =  s__q_RH_HAA *  c__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(2,2) = - s__q_RH_HAA *  s__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(2,3) =  c__q_RH_HAA;
fr_trunk_Xh_fr_RH_KFE(2,4) = ( 0.35 *  s__q_RH_HAA *  c__q_RH_HFE) + ( 0.08 *  s__q_RH_HAA) -  0.207;
fr_trunk_Xh_fr_RH_KFE(3,1) = - c__q_RH_HAA *  c__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(3,2) =  c__q_RH_HAA *  s__q_RH_HFE;
fr_trunk_Xh_fr_RH_KFE(3,3) =  s__q_RH_HAA;
fr_trunk_Xh_fr_RH_KFE(3,4) = (- 0.35 *  c__q_RH_HAA *  c__q_RH_HFE) - ( 0.08 *  c__q_RH_HAA);



fr_LF_hipassembly_Xh_fr_trunk(1,2) = - s__q_LF_HAA;
fr_LF_hipassembly_Xh_fr_trunk(1,3) = - c__q_LF_HAA;
fr_LF_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_LF_HAA;
fr_LF_hipassembly_Xh_fr_trunk(2,2) = - c__q_LF_HAA;
fr_LF_hipassembly_Xh_fr_trunk(2,3) =  s__q_LF_HAA;
fr_LF_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_LF_HAA;



fr_trunk_Xh_fr_LF_hipassembly(2,1) = - s__q_LF_HAA;
fr_trunk_Xh_fr_LF_hipassembly(2,2) = - c__q_LF_HAA;
fr_trunk_Xh_fr_LF_hipassembly(3,1) = - c__q_LF_HAA;
fr_trunk_Xh_fr_LF_hipassembly(3,2) =  s__q_LF_HAA;



fr_LF_upperleg_Xh_fr_LF_hipassembly(1,1) =  c__q_LF_HFE;
fr_LF_upperleg_Xh_fr_LF_hipassembly(1,3) =  s__q_LF_HFE;
fr_LF_upperleg_Xh_fr_LF_hipassembly(1,4) = - 0.08 *  c__q_LF_HFE;
fr_LF_upperleg_Xh_fr_LF_hipassembly(2,1) = - s__q_LF_HFE;
fr_LF_upperleg_Xh_fr_LF_hipassembly(2,3) =  c__q_LF_HFE;
fr_LF_upperleg_Xh_fr_LF_hipassembly(2,4) =  0.08 *  s__q_LF_HFE;



fr_LF_hipassembly_Xh_fr_LF_upperleg(1,1) =  c__q_LF_HFE;
fr_LF_hipassembly_Xh_fr_LF_upperleg(1,2) = - s__q_LF_HFE;
fr_LF_hipassembly_Xh_fr_LF_upperleg(3,1) =  s__q_LF_HFE;
fr_LF_hipassembly_Xh_fr_LF_upperleg(3,2) =  c__q_LF_HFE;



fr_LF_lowerleg_Xh_fr_LF_upperleg(1,1) =  c__q_LF_KFE;
fr_LF_lowerleg_Xh_fr_LF_upperleg(1,2) =  s__q_LF_KFE;
fr_LF_lowerleg_Xh_fr_LF_upperleg(1,4) = - 0.35 *  c__q_LF_KFE;
fr_LF_lowerleg_Xh_fr_LF_upperleg(2,1) = - s__q_LF_KFE;
fr_LF_lowerleg_Xh_fr_LF_upperleg(2,2) =  c__q_LF_KFE;
fr_LF_lowerleg_Xh_fr_LF_upperleg(2,4) =  0.35 *  s__q_LF_KFE;



fr_LF_upperleg_Xh_fr_LF_lowerleg(1,1) =  c__q_LF_KFE;
fr_LF_upperleg_Xh_fr_LF_lowerleg(1,2) = - s__q_LF_KFE;
fr_LF_upperleg_Xh_fr_LF_lowerleg(2,1) =  s__q_LF_KFE;
fr_LF_upperleg_Xh_fr_LF_lowerleg(2,2) =  c__q_LF_KFE;



fr_RF_hipassembly_Xh_fr_trunk(1,2) =  s__q_RF_HAA;
fr_RF_hipassembly_Xh_fr_trunk(1,3) = - c__q_RF_HAA;
fr_RF_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_RF_HAA;
fr_RF_hipassembly_Xh_fr_trunk(2,2) =  c__q_RF_HAA;
fr_RF_hipassembly_Xh_fr_trunk(2,3) =  s__q_RF_HAA;
fr_RF_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_RF_HAA;



fr_trunk_Xh_fr_RF_hipassembly(2,1) =  s__q_RF_HAA;
fr_trunk_Xh_fr_RF_hipassembly(2,2) =  c__q_RF_HAA;
fr_trunk_Xh_fr_RF_hipassembly(3,1) = - c__q_RF_HAA;
fr_trunk_Xh_fr_RF_hipassembly(3,2) =  s__q_RF_HAA;



fr_RF_upperleg_Xh_fr_RF_hipassembly(1,1) =  c__q_RF_HFE;
fr_RF_upperleg_Xh_fr_RF_hipassembly(1,3) = - s__q_RF_HFE;
fr_RF_upperleg_Xh_fr_RF_hipassembly(1,4) = - 0.08 *  c__q_RF_HFE;
fr_RF_upperleg_Xh_fr_RF_hipassembly(2,1) = - s__q_RF_HFE;
fr_RF_upperleg_Xh_fr_RF_hipassembly(2,3) = - c__q_RF_HFE;
fr_RF_upperleg_Xh_fr_RF_hipassembly(2,4) =  0.08 *  s__q_RF_HFE;



fr_RF_hipassembly_Xh_fr_RF_upperleg(1,1) =  c__q_RF_HFE;
fr_RF_hipassembly_Xh_fr_RF_upperleg(1,2) = - s__q_RF_HFE;
fr_RF_hipassembly_Xh_fr_RF_upperleg(3,1) = - s__q_RF_HFE;
fr_RF_hipassembly_Xh_fr_RF_upperleg(3,2) = - c__q_RF_HFE;



fr_RF_lowerleg_Xh_fr_RF_upperleg(1,1) =  c__q_RF_KFE;
fr_RF_lowerleg_Xh_fr_RF_upperleg(1,2) =  s__q_RF_KFE;
fr_RF_lowerleg_Xh_fr_RF_upperleg(1,4) = - 0.35 *  c__q_RF_KFE;
fr_RF_lowerleg_Xh_fr_RF_upperleg(2,1) = - s__q_RF_KFE;
fr_RF_lowerleg_Xh_fr_RF_upperleg(2,2) =  c__q_RF_KFE;
fr_RF_lowerleg_Xh_fr_RF_upperleg(2,4) =  0.35 *  s__q_RF_KFE;



fr_RF_upperleg_Xh_fr_RF_lowerleg(1,1) =  c__q_RF_KFE;
fr_RF_upperleg_Xh_fr_RF_lowerleg(1,2) = - s__q_RF_KFE;
fr_RF_upperleg_Xh_fr_RF_lowerleg(2,1) =  s__q_RF_KFE;
fr_RF_upperleg_Xh_fr_RF_lowerleg(2,2) =  c__q_RF_KFE;



fr_LH_hipassembly_Xh_fr_trunk(1,2) = - s__q_LH_HAA;
fr_LH_hipassembly_Xh_fr_trunk(1,3) = - c__q_LH_HAA;
fr_LH_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_LH_HAA;
fr_LH_hipassembly_Xh_fr_trunk(2,2) = - c__q_LH_HAA;
fr_LH_hipassembly_Xh_fr_trunk(2,3) =  s__q_LH_HAA;
fr_LH_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_LH_HAA;



fr_trunk_Xh_fr_LH_hipassembly(2,1) = - s__q_LH_HAA;
fr_trunk_Xh_fr_LH_hipassembly(2,2) = - c__q_LH_HAA;
fr_trunk_Xh_fr_LH_hipassembly(3,1) = - c__q_LH_HAA;
fr_trunk_Xh_fr_LH_hipassembly(3,2) =  s__q_LH_HAA;



fr_LH_upperleg_Xh_fr_LH_hipassembly(1,1) =  c__q_LH_HFE;
fr_LH_upperleg_Xh_fr_LH_hipassembly(1,3) =  s__q_LH_HFE;
fr_LH_upperleg_Xh_fr_LH_hipassembly(1,4) = - 0.08 *  c__q_LH_HFE;
fr_LH_upperleg_Xh_fr_LH_hipassembly(2,1) = - s__q_LH_HFE;
fr_LH_upperleg_Xh_fr_LH_hipassembly(2,3) =  c__q_LH_HFE;
fr_LH_upperleg_Xh_fr_LH_hipassembly(2,4) =  0.08 *  s__q_LH_HFE;



fr_LH_hipassembly_Xh_fr_LH_upperleg(1,1) =  c__q_LH_HFE;
fr_LH_hipassembly_Xh_fr_LH_upperleg(1,2) = - s__q_LH_HFE;
fr_LH_hipassembly_Xh_fr_LH_upperleg(3,1) =  s__q_LH_HFE;
fr_LH_hipassembly_Xh_fr_LH_upperleg(3,2) =  c__q_LH_HFE;



fr_LH_lowerleg_Xh_fr_LH_upperleg(1,1) =  c__q_LH_KFE;
fr_LH_lowerleg_Xh_fr_LH_upperleg(1,2) =  s__q_LH_KFE;
fr_LH_lowerleg_Xh_fr_LH_upperleg(1,4) = - 0.35 *  c__q_LH_KFE;
fr_LH_lowerleg_Xh_fr_LH_upperleg(2,1) = - s__q_LH_KFE;
fr_LH_lowerleg_Xh_fr_LH_upperleg(2,2) =  c__q_LH_KFE;
fr_LH_lowerleg_Xh_fr_LH_upperleg(2,4) =  0.35 *  s__q_LH_KFE;



fr_LH_upperleg_Xh_fr_LH_lowerleg(1,1) =  c__q_LH_KFE;
fr_LH_upperleg_Xh_fr_LH_lowerleg(1,2) = - s__q_LH_KFE;
fr_LH_upperleg_Xh_fr_LH_lowerleg(2,1) =  s__q_LH_KFE;
fr_LH_upperleg_Xh_fr_LH_lowerleg(2,2) =  c__q_LH_KFE;



fr_RH_hipassembly_Xh_fr_trunk(1,2) =  s__q_RH_HAA;
fr_RH_hipassembly_Xh_fr_trunk(1,3) = - c__q_RH_HAA;
fr_RH_hipassembly_Xh_fr_trunk(1,4) =  0.207 *  s__q_RH_HAA;
fr_RH_hipassembly_Xh_fr_trunk(2,2) =  c__q_RH_HAA;
fr_RH_hipassembly_Xh_fr_trunk(2,3) =  s__q_RH_HAA;
fr_RH_hipassembly_Xh_fr_trunk(2,4) =  0.207 *  c__q_RH_HAA;



fr_trunk_Xh_fr_RH_hipassembly(2,1) =  s__q_RH_HAA;
fr_trunk_Xh_fr_RH_hipassembly(2,2) =  c__q_RH_HAA;
fr_trunk_Xh_fr_RH_hipassembly(3,1) = - c__q_RH_HAA;
fr_trunk_Xh_fr_RH_hipassembly(3,2) =  s__q_RH_HAA;



fr_RH_upperleg_Xh_fr_RH_hipassembly(1,1) =  c__q_RH_HFE;
fr_RH_upperleg_Xh_fr_RH_hipassembly(1,3) = - s__q_RH_HFE;
fr_RH_upperleg_Xh_fr_RH_hipassembly(1,4) = - 0.08 *  c__q_RH_HFE;
fr_RH_upperleg_Xh_fr_RH_hipassembly(2,1) = - s__q_RH_HFE;
fr_RH_upperleg_Xh_fr_RH_hipassembly(2,3) = - c__q_RH_HFE;
fr_RH_upperleg_Xh_fr_RH_hipassembly(2,4) =  0.08 *  s__q_RH_HFE;



fr_RH_hipassembly_Xh_fr_RH_upperleg(1,1) =  c__q_RH_HFE;
fr_RH_hipassembly_Xh_fr_RH_upperleg(1,2) = - s__q_RH_HFE;
fr_RH_hipassembly_Xh_fr_RH_upperleg(3,1) = - s__q_RH_HFE;
fr_RH_hipassembly_Xh_fr_RH_upperleg(3,2) = - c__q_RH_HFE;



fr_RH_lowerleg_Xh_fr_RH_upperleg(1,1) =  c__q_RH_KFE;
fr_RH_lowerleg_Xh_fr_RH_upperleg(1,2) =  s__q_RH_KFE;
fr_RH_lowerleg_Xh_fr_RH_upperleg(1,4) = - 0.35 *  c__q_RH_KFE;
fr_RH_lowerleg_Xh_fr_RH_upperleg(2,1) = - s__q_RH_KFE;
fr_RH_lowerleg_Xh_fr_RH_upperleg(2,2) =  c__q_RH_KFE;
fr_RH_lowerleg_Xh_fr_RH_upperleg(2,4) =  0.35 *  s__q_RH_KFE;



fr_RH_upperleg_Xh_fr_RH_lowerleg(1,1) =  c__q_RH_KFE;
fr_RH_upperleg_Xh_fr_RH_lowerleg(1,2) = - s__q_RH_KFE;
fr_RH_upperleg_Xh_fr_RH_lowerleg(2,1) =  s__q_RH_KFE;
fr_RH_upperleg_Xh_fr_RH_lowerleg(2,2) =  c__q_RH_KFE;




function tr = initHomogeneousTransforms()

tr.fr_LF_lowerleg_Xh_LF_foot = zeros(4, 4);
tr.fr_LF_lowerleg_Xh_LF_foot(1,3) = - 1.0;
tr.fr_LF_lowerleg_Xh_LF_foot(1,4) = 0.33;
tr.fr_LF_lowerleg_Xh_LF_foot(2,1) = - 1;
tr.fr_LF_lowerleg_Xh_LF_foot(3,2) = 1;
tr.fr_LF_lowerleg_Xh_LF_foot(4,4) = 1;

tr.fr_RF_lowerleg_Xh_RF_foot = zeros(4, 4);
tr.fr_RF_lowerleg_Xh_RF_foot(1,3) = - 1.0;
tr.fr_RF_lowerleg_Xh_RF_foot(1,4) = 0.33;
tr.fr_RF_lowerleg_Xh_RF_foot(2,1) = - 1;
tr.fr_RF_lowerleg_Xh_RF_foot(3,2) = 1;
tr.fr_RF_lowerleg_Xh_RF_foot(4,4) = 1;

tr.fr_LH_lowerleg_Xh_LH_foot = zeros(4, 4);
tr.fr_LH_lowerleg_Xh_LH_foot(1,3) = - 1.0;
tr.fr_LH_lowerleg_Xh_LH_foot(1,4) = 0.33;
tr.fr_LH_lowerleg_Xh_LH_foot(2,1) = - 1;
tr.fr_LH_lowerleg_Xh_LH_foot(3,2) = 1;
tr.fr_LH_lowerleg_Xh_LH_foot(4,4) = 1;

tr.fr_RH_lowerleg_Xh_RH_foot = zeros(4, 4);
tr.fr_RH_lowerleg_Xh_RH_foot(1,3) = - 1.0;
tr.fr_RH_lowerleg_Xh_RH_foot(1,4) = 0.33;
tr.fr_RH_lowerleg_Xh_RH_foot(2,1) = - 1;
tr.fr_RH_lowerleg_Xh_RH_foot(3,2) = 1;
tr.fr_RH_lowerleg_Xh_RH_foot(4,4) = 1;

tr.fr_trunk_Xh_LF_hipassemblyCOM = zeros(4, 4);
tr.fr_trunk_Xh_LF_hipassemblyCOM(1,3) = - 1.0;
tr.fr_trunk_Xh_LF_hipassemblyCOM(1,4) = 0.2041;
tr.fr_trunk_Xh_LF_hipassemblyCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RF_hipassemblyCOM = zeros(4, 4);
tr.fr_trunk_Xh_RF_hipassemblyCOM(1,3) = 1.0;
tr.fr_trunk_Xh_RF_hipassemblyCOM(1,4) = 0.2041;
tr.fr_trunk_Xh_RF_hipassemblyCOM(4,4) = 1.0;

tr.fr_trunk_Xh_LH_hipassemblyCOM = zeros(4, 4);
tr.fr_trunk_Xh_LH_hipassemblyCOM(1,3) = - 1.0;
tr.fr_trunk_Xh_LH_hipassemblyCOM(1,4) = - 0.2041;
tr.fr_trunk_Xh_LH_hipassemblyCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RH_hipassemblyCOM = zeros(4, 4);
tr.fr_trunk_Xh_RH_hipassemblyCOM(1,3) = 1.0;
tr.fr_trunk_Xh_RH_hipassemblyCOM(1,4) = - 0.2041;
tr.fr_trunk_Xh_RH_hipassemblyCOM(4,4) = 1.0;

tr.fr_trunk_Xh_LF_upperlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_LF_upperlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RF_upperlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_RF_upperlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_LH_upperlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_LH_upperlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RH_upperlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_RH_upperlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_LF_lowerlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_LF_lowerlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RF_lowerlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_RF_lowerlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_LH_lowerlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_LH_lowerlegCOM(4,4) = 1.0;

tr.fr_trunk_Xh_RH_lowerlegCOM = zeros(4, 4);
tr.fr_trunk_Xh_RH_lowerlegCOM(4,4) = 1.0;

tr.LF_foot_Xh_fr_LF_lowerleg = zeros(4, 4);
tr.LF_foot_Xh_fr_LF_lowerleg(1,2) = - 1;
tr.LF_foot_Xh_fr_LF_lowerleg(2,3) = 1;
tr.LF_foot_Xh_fr_LF_lowerleg(3,1) = - 1;
tr.LF_foot_Xh_fr_LF_lowerleg(3,4) = 0.33;
tr.LF_foot_Xh_fr_LF_lowerleg(4,4) = 1.0;

tr.RF_foot_Xh_fr_RF_lowerleg = zeros(4, 4);
tr.RF_foot_Xh_fr_RF_lowerleg(1,2) = - 1;
tr.RF_foot_Xh_fr_RF_lowerleg(2,3) = 1;
tr.RF_foot_Xh_fr_RF_lowerleg(3,1) = - 1;
tr.RF_foot_Xh_fr_RF_lowerleg(3,4) = 0.33;
tr.RF_foot_Xh_fr_RF_lowerleg(4,4) = 1.0;

tr.LH_foot_Xh_fr_LH_lowerleg = zeros(4, 4);
tr.LH_foot_Xh_fr_LH_lowerleg(1,2) = - 1;
tr.LH_foot_Xh_fr_LH_lowerleg(2,3) = 1;
tr.LH_foot_Xh_fr_LH_lowerleg(3,1) = - 1;
tr.LH_foot_Xh_fr_LH_lowerleg(3,4) = 0.33;
tr.LH_foot_Xh_fr_LH_lowerleg(4,4) = 1.0;

tr.RH_foot_Xh_fr_RH_lowerleg = zeros(4, 4);
tr.RH_foot_Xh_fr_RH_lowerleg(1,2) = - 1;
tr.RH_foot_Xh_fr_RH_lowerleg(2,3) = 1;
tr.RH_foot_Xh_fr_RH_lowerleg(3,1) = - 1;
tr.RH_foot_Xh_fr_RH_lowerleg(3,4) = 0.33;
tr.RH_foot_Xh_fr_RH_lowerleg(4,4) = 1.0;

tr.fr_trunk_Xh_LF_foot = zeros(4, 4);
tr.fr_trunk_Xh_LF_foot(4,4) = 1.0;

tr.fr_trunk_Xh_RF_foot = zeros(4, 4);
tr.fr_trunk_Xh_RF_foot(4,4) = 1.0;

tr.fr_trunk_Xh_LH_foot = zeros(4, 4);
tr.fr_trunk_Xh_LH_foot(4,4) = 1.0;

tr.fr_trunk_Xh_RH_foot = zeros(4, 4);
tr.fr_trunk_Xh_RH_foot(4,4) = 1.0;

tr.fr_LF_lowerleg_Xh_fr_trunk = zeros(4, 4);
tr.fr_LF_lowerleg_Xh_fr_trunk(4,4) = 1.0;

tr.fr_RF_lowerleg_Xh_fr_trunk = zeros(4, 4);
tr.fr_RF_lowerleg_Xh_fr_trunk(4,4) = 1.0;

tr.fr_LH_lowerleg_Xh_fr_trunk = zeros(4, 4);
tr.fr_LH_lowerleg_Xh_fr_trunk(4,4) = 1.0;

tr.fr_RH_lowerleg_Xh_fr_trunk = zeros(4, 4);
tr.fr_RH_lowerleg_Xh_fr_trunk(4,4) = 1.0;

tr.LF_foot_Xh_fr_trunk = zeros(4, 4);
tr.LF_foot_Xh_fr_trunk(4,4) = 1.0;

tr.RF_foot_Xh_fr_trunk = zeros(4, 4);
tr.RF_foot_Xh_fr_trunk(4,4) = 1.0;

tr.LH_foot_Xh_fr_trunk = zeros(4, 4);
tr.LH_foot_Xh_fr_trunk(4,4) = 1.0;

tr.RH_foot_Xh_fr_trunk = zeros(4, 4);
tr.RH_foot_Xh_fr_trunk(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LF_HAA = zeros(4, 4);
tr.fr_trunk_Xh_fr_LF_HAA(1,3) = - 1.0;
tr.fr_trunk_Xh_fr_LF_HAA(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_LF_HAA(2,2) = - 1.0;
tr.fr_trunk_Xh_fr_LF_HAA(2,4) = 0.207;
tr.fr_trunk_Xh_fr_LF_HAA(3,1) = - 1.0;
tr.fr_trunk_Xh_fr_LF_HAA(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LF_HFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_LF_HFE(1,2) = - 1.0;
tr.fr_trunk_Xh_fr_LF_HFE(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_LF_HFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LF_KFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_LF_KFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RF_HAA = zeros(4, 4);
tr.fr_trunk_Xh_fr_RF_HAA(1,3) = 1.0;
tr.fr_trunk_Xh_fr_RF_HAA(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_RF_HAA(2,2) = 1.0;
tr.fr_trunk_Xh_fr_RF_HAA(2,4) = - 0.207;
tr.fr_trunk_Xh_fr_RF_HAA(3,1) = - 1.0;
tr.fr_trunk_Xh_fr_RF_HAA(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RF_HFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_RF_HFE(1,2) = - 1.0;
tr.fr_trunk_Xh_fr_RF_HFE(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_RF_HFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RF_KFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_RF_KFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LH_HAA = zeros(4, 4);
tr.fr_trunk_Xh_fr_LH_HAA(1,3) = - 1.0;
tr.fr_trunk_Xh_fr_LH_HAA(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_LH_HAA(2,2) = - 1.0;
tr.fr_trunk_Xh_fr_LH_HAA(2,4) = 0.207;
tr.fr_trunk_Xh_fr_LH_HAA(3,1) = - 1.0;
tr.fr_trunk_Xh_fr_LH_HAA(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LH_HFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_LH_HFE(1,2) = - 1.0;
tr.fr_trunk_Xh_fr_LH_HFE(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_LH_HFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LH_KFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_LH_KFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RH_HAA = zeros(4, 4);
tr.fr_trunk_Xh_fr_RH_HAA(1,3) = 1.0;
tr.fr_trunk_Xh_fr_RH_HAA(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_RH_HAA(2,2) = 1.0;
tr.fr_trunk_Xh_fr_RH_HAA(2,4) = - 0.207;
tr.fr_trunk_Xh_fr_RH_HAA(3,1) = - 1.0;
tr.fr_trunk_Xh_fr_RH_HAA(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RH_HFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_RH_HFE(1,2) = - 1.0;
tr.fr_trunk_Xh_fr_RH_HFE(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_RH_HFE(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RH_KFE = zeros(4, 4);
tr.fr_trunk_Xh_fr_RH_KFE(4,4) = 1.0;

tr.fr_LF_hipassembly_Xh_fr_trunk = zeros(4, 4);
tr.fr_LF_hipassembly_Xh_fr_trunk(3,1) = - 1.0;
tr.fr_LF_hipassembly_Xh_fr_trunk(3,4) = 0.3735;
tr.fr_LF_hipassembly_Xh_fr_trunk(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LF_hipassembly = zeros(4, 4);
tr.fr_trunk_Xh_fr_LF_hipassembly(1,3) = - 1.0;
tr.fr_trunk_Xh_fr_LF_hipassembly(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_LF_hipassembly(2,4) = 0.207;
tr.fr_trunk_Xh_fr_LF_hipassembly(4,4) = 1.0;

tr.fr_LF_upperleg_Xh_fr_LF_hipassembly = zeros(4, 4);
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(3,2) = - 1;
tr.fr_LF_upperleg_Xh_fr_LF_hipassembly(4,4) = 1.0;

tr.fr_LF_hipassembly_Xh_fr_LF_upperleg = zeros(4, 4);
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(1,4) = 0.08;
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(2,3) = - 1;
tr.fr_LF_hipassembly_Xh_fr_LF_upperleg(4,4) = 1;

tr.fr_LF_lowerleg_Xh_fr_LF_upperleg = zeros(4, 4);
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(3,3) = 1;
tr.fr_LF_lowerleg_Xh_fr_LF_upperleg(4,4) = 1.0;

tr.fr_LF_upperleg_Xh_fr_LF_lowerleg = zeros(4, 4);
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(1,4) = 0.35;
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(3,3) = 1;
tr.fr_LF_upperleg_Xh_fr_LF_lowerleg(4,4) = 1;

tr.fr_RF_hipassembly_Xh_fr_trunk = zeros(4, 4);
tr.fr_RF_hipassembly_Xh_fr_trunk(3,1) = 1.0;
tr.fr_RF_hipassembly_Xh_fr_trunk(3,4) = - 0.3735;
tr.fr_RF_hipassembly_Xh_fr_trunk(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RF_hipassembly = zeros(4, 4);
tr.fr_trunk_Xh_fr_RF_hipassembly(1,3) = 1.0;
tr.fr_trunk_Xh_fr_RF_hipassembly(1,4) = 0.3735;
tr.fr_trunk_Xh_fr_RF_hipassembly(2,4) = - 0.207;
tr.fr_trunk_Xh_fr_RF_hipassembly(4,4) = 1.0;

tr.fr_RF_upperleg_Xh_fr_RF_hipassembly = zeros(4, 4);
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(3,2) = 1;
tr.fr_RF_upperleg_Xh_fr_RF_hipassembly(4,4) = 1.0;

tr.fr_RF_hipassembly_Xh_fr_RF_upperleg = zeros(4, 4);
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(1,4) = 0.08;
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(2,3) = 1;
tr.fr_RF_hipassembly_Xh_fr_RF_upperleg(4,4) = 1;

tr.fr_RF_lowerleg_Xh_fr_RF_upperleg = zeros(4, 4);
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(3,3) = 1;
tr.fr_RF_lowerleg_Xh_fr_RF_upperleg(4,4) = 1.0;

tr.fr_RF_upperleg_Xh_fr_RF_lowerleg = zeros(4, 4);
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(1,4) = 0.35;
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(3,3) = 1;
tr.fr_RF_upperleg_Xh_fr_RF_lowerleg(4,4) = 1;

tr.fr_LH_hipassembly_Xh_fr_trunk = zeros(4, 4);
tr.fr_LH_hipassembly_Xh_fr_trunk(3,1) = - 1.0;
tr.fr_LH_hipassembly_Xh_fr_trunk(3,4) = - 0.3735;
tr.fr_LH_hipassembly_Xh_fr_trunk(4,4) = 1.0;

tr.fr_trunk_Xh_fr_LH_hipassembly = zeros(4, 4);
tr.fr_trunk_Xh_fr_LH_hipassembly(1,3) = - 1.0;
tr.fr_trunk_Xh_fr_LH_hipassembly(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_LH_hipassembly(2,4) = 0.207;
tr.fr_trunk_Xh_fr_LH_hipassembly(4,4) = 1.0;

tr.fr_LH_upperleg_Xh_fr_LH_hipassembly = zeros(4, 4);
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(3,2) = - 1;
tr.fr_LH_upperleg_Xh_fr_LH_hipassembly(4,4) = 1.0;

tr.fr_LH_hipassembly_Xh_fr_LH_upperleg = zeros(4, 4);
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(1,4) = 0.08;
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(2,3) = - 1;
tr.fr_LH_hipassembly_Xh_fr_LH_upperleg(4,4) = 1;

tr.fr_LH_lowerleg_Xh_fr_LH_upperleg = zeros(4, 4);
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(3,3) = 1;
tr.fr_LH_lowerleg_Xh_fr_LH_upperleg(4,4) = 1.0;

tr.fr_LH_upperleg_Xh_fr_LH_lowerleg = zeros(4, 4);
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(1,4) = 0.35;
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(3,3) = 1;
tr.fr_LH_upperleg_Xh_fr_LH_lowerleg(4,4) = 1;

tr.fr_RH_hipassembly_Xh_fr_trunk = zeros(4, 4);
tr.fr_RH_hipassembly_Xh_fr_trunk(3,1) = 1.0;
tr.fr_RH_hipassembly_Xh_fr_trunk(3,4) = 0.3735;
tr.fr_RH_hipassembly_Xh_fr_trunk(4,4) = 1.0;

tr.fr_trunk_Xh_fr_RH_hipassembly = zeros(4, 4);
tr.fr_trunk_Xh_fr_RH_hipassembly(1,3) = 1.0;
tr.fr_trunk_Xh_fr_RH_hipassembly(1,4) = - 0.3735;
tr.fr_trunk_Xh_fr_RH_hipassembly(2,4) = - 0.207;
tr.fr_trunk_Xh_fr_RH_hipassembly(4,4) = 1.0;

tr.fr_RH_upperleg_Xh_fr_RH_hipassembly = zeros(4, 4);
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(3,2) = 1;
tr.fr_RH_upperleg_Xh_fr_RH_hipassembly(4,4) = 1.0;

tr.fr_RH_hipassembly_Xh_fr_RH_upperleg = zeros(4, 4);
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(1,4) = 0.08;
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(2,3) = 1;
tr.fr_RH_hipassembly_Xh_fr_RH_upperleg(4,4) = 1;

tr.fr_RH_lowerleg_Xh_fr_RH_upperleg = zeros(4, 4);
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(3,3) = 1;
tr.fr_RH_lowerleg_Xh_fr_RH_upperleg(4,4) = 1.0;

tr.fr_RH_upperleg_Xh_fr_RH_lowerleg = zeros(4, 4);
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(1,4) = 0.35;
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(3,3) = 1;
tr.fr_RH_upperleg_Xh_fr_RH_lowerleg(4,4) = 1;


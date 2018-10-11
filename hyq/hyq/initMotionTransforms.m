function tr = initMotionTransforms()

tr.fr_LF_lowerleg_XM_LF_foot = zeros(6, 6);
tr.fr_LF_lowerleg_XM_LF_foot(1,3) = - 1;
tr.fr_LF_lowerleg_XM_LF_foot(2,1) = - 1;
tr.fr_LF_lowerleg_XM_LF_foot(3,2) = 1;
tr.fr_LF_lowerleg_XM_LF_foot(4,6) = - 1;
tr.fr_LF_lowerleg_XM_LF_foot(5,2) = - 0.33;
tr.fr_LF_lowerleg_XM_LF_foot(5,4) = - 1.0;
tr.fr_LF_lowerleg_XM_LF_foot(6,1) = - 0.33;
tr.fr_LF_lowerleg_XM_LF_foot(6,5) = 1.0;

tr.fr_RF_lowerleg_XM_RF_foot = zeros(6, 6);
tr.fr_RF_lowerleg_XM_RF_foot(1,3) = - 1;
tr.fr_RF_lowerleg_XM_RF_foot(2,1) = - 1;
tr.fr_RF_lowerleg_XM_RF_foot(3,2) = 1;
tr.fr_RF_lowerleg_XM_RF_foot(4,6) = - 1;
tr.fr_RF_lowerleg_XM_RF_foot(5,2) = - 0.33;
tr.fr_RF_lowerleg_XM_RF_foot(5,4) = - 1.0;
tr.fr_RF_lowerleg_XM_RF_foot(6,1) = - 0.33;
tr.fr_RF_lowerleg_XM_RF_foot(6,5) = 1.0;

tr.fr_LH_lowerleg_XM_LH_foot = zeros(6, 6);
tr.fr_LH_lowerleg_XM_LH_foot(1,3) = - 1;
tr.fr_LH_lowerleg_XM_LH_foot(2,1) = - 1;
tr.fr_LH_lowerleg_XM_LH_foot(3,2) = 1;
tr.fr_LH_lowerleg_XM_LH_foot(4,6) = - 1;
tr.fr_LH_lowerleg_XM_LH_foot(5,2) = - 0.33;
tr.fr_LH_lowerleg_XM_LH_foot(5,4) = - 1.0;
tr.fr_LH_lowerleg_XM_LH_foot(6,1) = - 0.33;
tr.fr_LH_lowerleg_XM_LH_foot(6,5) = 1.0;

tr.fr_RH_lowerleg_XM_RH_foot = zeros(6, 6);
tr.fr_RH_lowerleg_XM_RH_foot(1,3) = - 1;
tr.fr_RH_lowerleg_XM_RH_foot(2,1) = - 1;
tr.fr_RH_lowerleg_XM_RH_foot(3,2) = 1;
tr.fr_RH_lowerleg_XM_RH_foot(4,6) = - 1;
tr.fr_RH_lowerleg_XM_RH_foot(5,2) = - 0.33;
tr.fr_RH_lowerleg_XM_RH_foot(5,4) = - 1.0;
tr.fr_RH_lowerleg_XM_RH_foot(6,1) = - 0.33;
tr.fr_RH_lowerleg_XM_RH_foot(6,5) = 1.0;

tr.fr_trunk_XM_LF_hipassemblyCOM = zeros(6, 6);
tr.fr_trunk_XM_LF_hipassemblyCOM(1,3) = - 1.0;
tr.fr_trunk_XM_LF_hipassemblyCOM(4,6) = - 1.0;

tr.fr_trunk_XM_RF_hipassemblyCOM = zeros(6, 6);
tr.fr_trunk_XM_RF_hipassemblyCOM(1,3) = 1.0;
tr.fr_trunk_XM_RF_hipassemblyCOM(4,6) = 1.0;

tr.fr_trunk_XM_LH_hipassemblyCOM = zeros(6, 6);
tr.fr_trunk_XM_LH_hipassemblyCOM(1,3) = - 1.0;
tr.fr_trunk_XM_LH_hipassemblyCOM(4,6) = - 1.0;

tr.fr_trunk_XM_RH_hipassemblyCOM = zeros(6, 6);
tr.fr_trunk_XM_RH_hipassemblyCOM(1,3) = 1.0;
tr.fr_trunk_XM_RH_hipassemblyCOM(4,6) = 1.0;

tr.fr_trunk_XM_LF_upperlegCOM = zeros(6, 6);

tr.fr_trunk_XM_RF_upperlegCOM = zeros(6, 6);

tr.fr_trunk_XM_LH_upperlegCOM = zeros(6, 6);

tr.fr_trunk_XM_RH_upperlegCOM = zeros(6, 6);

tr.fr_trunk_XM_LF_lowerlegCOM = zeros(6, 6);

tr.fr_trunk_XM_RF_lowerlegCOM = zeros(6, 6);

tr.fr_trunk_XM_LH_lowerlegCOM = zeros(6, 6);

tr.fr_trunk_XM_RH_lowerlegCOM = zeros(6, 6);

tr.LF_foot_XM_fr_LF_lowerleg = zeros(6, 6);
tr.LF_foot_XM_fr_LF_lowerleg(1,2) = - 1.0;
tr.LF_foot_XM_fr_LF_lowerleg(2,3) = 1.0;
tr.LF_foot_XM_fr_LF_lowerleg(3,1) = - 1;
tr.LF_foot_XM_fr_LF_lowerleg(4,3) = - 0.33;
tr.LF_foot_XM_fr_LF_lowerleg(4,5) = - 1;
tr.LF_foot_XM_fr_LF_lowerleg(5,2) = - 0.33;
tr.LF_foot_XM_fr_LF_lowerleg(5,6) = 1;
tr.LF_foot_XM_fr_LF_lowerleg(6,4) = - 1;

tr.RF_foot_XM_fr_RF_lowerleg = zeros(6, 6);
tr.RF_foot_XM_fr_RF_lowerleg(1,2) = - 1.0;
tr.RF_foot_XM_fr_RF_lowerleg(2,3) = 1.0;
tr.RF_foot_XM_fr_RF_lowerleg(3,1) = - 1;
tr.RF_foot_XM_fr_RF_lowerleg(4,3) = - 0.33;
tr.RF_foot_XM_fr_RF_lowerleg(4,5) = - 1;
tr.RF_foot_XM_fr_RF_lowerleg(5,2) = - 0.33;
tr.RF_foot_XM_fr_RF_lowerleg(5,6) = 1;
tr.RF_foot_XM_fr_RF_lowerleg(6,4) = - 1;

tr.LH_foot_XM_fr_LH_lowerleg = zeros(6, 6);
tr.LH_foot_XM_fr_LH_lowerleg(1,2) = - 1.0;
tr.LH_foot_XM_fr_LH_lowerleg(2,3) = 1.0;
tr.LH_foot_XM_fr_LH_lowerleg(3,1) = - 1;
tr.LH_foot_XM_fr_LH_lowerleg(4,3) = - 0.33;
tr.LH_foot_XM_fr_LH_lowerleg(4,5) = - 1;
tr.LH_foot_XM_fr_LH_lowerleg(5,2) = - 0.33;
tr.LH_foot_XM_fr_LH_lowerleg(5,6) = 1;
tr.LH_foot_XM_fr_LH_lowerleg(6,4) = - 1;

tr.RH_foot_XM_fr_RH_lowerleg = zeros(6, 6);
tr.RH_foot_XM_fr_RH_lowerleg(1,2) = - 1.0;
tr.RH_foot_XM_fr_RH_lowerleg(2,3) = 1.0;
tr.RH_foot_XM_fr_RH_lowerleg(3,1) = - 1;
tr.RH_foot_XM_fr_RH_lowerleg(4,3) = - 0.33;
tr.RH_foot_XM_fr_RH_lowerleg(4,5) = - 1;
tr.RH_foot_XM_fr_RH_lowerleg(5,2) = - 0.33;
tr.RH_foot_XM_fr_RH_lowerleg(5,6) = 1;
tr.RH_foot_XM_fr_RH_lowerleg(6,4) = - 1;

tr.fr_trunk_XM_LF_foot = zeros(6, 6);

tr.fr_trunk_XM_RF_foot = zeros(6, 6);

tr.fr_trunk_XM_LH_foot = zeros(6, 6);

tr.fr_trunk_XM_RH_foot = zeros(6, 6);

tr.fr_LF_lowerleg_XM_fr_trunk = zeros(6, 6);

tr.fr_RF_lowerleg_XM_fr_trunk = zeros(6, 6);

tr.fr_LH_lowerleg_XM_fr_trunk = zeros(6, 6);

tr.fr_RH_lowerleg_XM_fr_trunk = zeros(6, 6);

tr.LF_foot_XM_fr_trunk = zeros(6, 6);

tr.RF_foot_XM_fr_trunk = zeros(6, 6);

tr.LH_foot_XM_fr_trunk = zeros(6, 6);

tr.RH_foot_XM_fr_trunk = zeros(6, 6);

tr.fr_trunk_XM_fr_LF_HAA = zeros(6, 6);
tr.fr_trunk_XM_fr_LF_HAA(1,3) = - 1.0;
tr.fr_trunk_XM_fr_LF_HAA(2,2) = - 1.0;
tr.fr_trunk_XM_fr_LF_HAA(3,1) = - 1.0;
tr.fr_trunk_XM_fr_LF_HAA(4,1) = - 0.207;
tr.fr_trunk_XM_fr_LF_HAA(4,6) = - 1.0;
tr.fr_trunk_XM_fr_LF_HAA(5,1) = 0.3735;
tr.fr_trunk_XM_fr_LF_HAA(5,5) = - 1.0;
tr.fr_trunk_XM_fr_LF_HAA(6,2) = - 0.3735;
tr.fr_trunk_XM_fr_LF_HAA(6,3) = 0.207;
tr.fr_trunk_XM_fr_LF_HAA(6,4) = - 1.0;

tr.fr_trunk_XM_fr_LF_HFE = zeros(6, 6);
tr.fr_trunk_XM_fr_LF_HFE(1,2) = - 1.0;
tr.fr_trunk_XM_fr_LF_HFE(4,5) = - 1.0;

tr.fr_trunk_XM_fr_LF_KFE = zeros(6, 6);

tr.fr_trunk_XM_fr_RF_HAA = zeros(6, 6);
tr.fr_trunk_XM_fr_RF_HAA(1,3) = 1.0;
tr.fr_trunk_XM_fr_RF_HAA(2,2) = 1.0;
tr.fr_trunk_XM_fr_RF_HAA(3,1) = - 1.0;
tr.fr_trunk_XM_fr_RF_HAA(4,1) = 0.207;
tr.fr_trunk_XM_fr_RF_HAA(4,6) = 1.0;
tr.fr_trunk_XM_fr_RF_HAA(5,1) = 0.3735;
tr.fr_trunk_XM_fr_RF_HAA(5,5) = 1.0;
tr.fr_trunk_XM_fr_RF_HAA(6,2) = 0.3735;
tr.fr_trunk_XM_fr_RF_HAA(6,3) = 0.207;
tr.fr_trunk_XM_fr_RF_HAA(6,4) = - 1.0;

tr.fr_trunk_XM_fr_RF_HFE = zeros(6, 6);
tr.fr_trunk_XM_fr_RF_HFE(1,2) = - 1.0;
tr.fr_trunk_XM_fr_RF_HFE(4,5) = - 1.0;

tr.fr_trunk_XM_fr_RF_KFE = zeros(6, 6);

tr.fr_trunk_XM_fr_LH_HAA = zeros(6, 6);
tr.fr_trunk_XM_fr_LH_HAA(1,3) = - 1.0;
tr.fr_trunk_XM_fr_LH_HAA(2,2) = - 1.0;
tr.fr_trunk_XM_fr_LH_HAA(3,1) = - 1.0;
tr.fr_trunk_XM_fr_LH_HAA(4,1) = - 0.207;
tr.fr_trunk_XM_fr_LH_HAA(4,6) = - 1.0;
tr.fr_trunk_XM_fr_LH_HAA(5,1) = - 0.3735;
tr.fr_trunk_XM_fr_LH_HAA(5,5) = - 1.0;
tr.fr_trunk_XM_fr_LH_HAA(6,2) = 0.3735;
tr.fr_trunk_XM_fr_LH_HAA(6,3) = 0.207;
tr.fr_trunk_XM_fr_LH_HAA(6,4) = - 1.0;

tr.fr_trunk_XM_fr_LH_HFE = zeros(6, 6);
tr.fr_trunk_XM_fr_LH_HFE(1,2) = - 1.0;
tr.fr_trunk_XM_fr_LH_HFE(4,5) = - 1.0;

tr.fr_trunk_XM_fr_LH_KFE = zeros(6, 6);

tr.fr_trunk_XM_fr_RH_HAA = zeros(6, 6);
tr.fr_trunk_XM_fr_RH_HAA(1,3) = 1.0;
tr.fr_trunk_XM_fr_RH_HAA(2,2) = 1.0;
tr.fr_trunk_XM_fr_RH_HAA(3,1) = - 1.0;
tr.fr_trunk_XM_fr_RH_HAA(4,1) = 0.207;
tr.fr_trunk_XM_fr_RH_HAA(4,6) = 1.0;
tr.fr_trunk_XM_fr_RH_HAA(5,1) = - 0.3735;
tr.fr_trunk_XM_fr_RH_HAA(5,5) = 1.0;
tr.fr_trunk_XM_fr_RH_HAA(6,2) = - 0.3735;
tr.fr_trunk_XM_fr_RH_HAA(6,3) = 0.207;
tr.fr_trunk_XM_fr_RH_HAA(6,4) = - 1.0;

tr.fr_trunk_XM_fr_RH_HFE = zeros(6, 6);
tr.fr_trunk_XM_fr_RH_HFE(1,2) = - 1.0;
tr.fr_trunk_XM_fr_RH_HFE(4,5) = - 1.0;

tr.fr_trunk_XM_fr_RH_KFE = zeros(6, 6);

tr.fr_LF_hipassembly_XM_fr_trunk = zeros(6, 6);
tr.fr_LF_hipassembly_XM_fr_trunk(3,1) = - 1.0;
tr.fr_LF_hipassembly_XM_fr_trunk(6,3) = 0.207;
tr.fr_LF_hipassembly_XM_fr_trunk(6,4) = - 1.0;

tr.fr_trunk_XM_fr_LF_hipassembly = zeros(6, 6);
tr.fr_trunk_XM_fr_LF_hipassembly(1,3) = - 1.0;
tr.fr_trunk_XM_fr_LF_hipassembly(4,6) = - 1.0;
tr.fr_trunk_XM_fr_LF_hipassembly(6,3) = 0.207;

tr.fr_LF_upperleg_XM_fr_LF_hipassembly = zeros(6, 6);
tr.fr_LF_upperleg_XM_fr_LF_hipassembly(3,2) = - 1.0;
tr.fr_LF_upperleg_XM_fr_LF_hipassembly(6,3) = - 0.08;
tr.fr_LF_upperleg_XM_fr_LF_hipassembly(6,5) = - 1;

tr.fr_LF_hipassembly_XM_fr_LF_upperleg = zeros(6, 6);
tr.fr_LF_hipassembly_XM_fr_LF_upperleg(2,3) = - 1;
tr.fr_LF_hipassembly_XM_fr_LF_upperleg(5,6) = - 1.0;
tr.fr_LF_hipassembly_XM_fr_LF_upperleg(6,3) = - 0.08;

tr.fr_LF_lowerleg_XM_fr_LF_upperleg = zeros(6, 6);
tr.fr_LF_lowerleg_XM_fr_LF_upperleg(3,3) = 1.0;
tr.fr_LF_lowerleg_XM_fr_LF_upperleg(6,2) = - 0.35;
tr.fr_LF_lowerleg_XM_fr_LF_upperleg(6,6) = 1;

tr.fr_LF_upperleg_XM_fr_LF_lowerleg = zeros(6, 6);
tr.fr_LF_upperleg_XM_fr_LF_lowerleg(3,3) = 1;
tr.fr_LF_upperleg_XM_fr_LF_lowerleg(5,3) = - 0.35;
tr.fr_LF_upperleg_XM_fr_LF_lowerleg(6,6) = 1.0;

tr.fr_RF_hipassembly_XM_fr_trunk = zeros(6, 6);
tr.fr_RF_hipassembly_XM_fr_trunk(3,1) = 1.0;
tr.fr_RF_hipassembly_XM_fr_trunk(6,3) = 0.207;
tr.fr_RF_hipassembly_XM_fr_trunk(6,4) = 1.0;

tr.fr_trunk_XM_fr_RF_hipassembly = zeros(6, 6);
tr.fr_trunk_XM_fr_RF_hipassembly(1,3) = 1.0;
tr.fr_trunk_XM_fr_RF_hipassembly(4,6) = 1.0;
tr.fr_trunk_XM_fr_RF_hipassembly(6,3) = 0.207;

tr.fr_RF_upperleg_XM_fr_RF_hipassembly = zeros(6, 6);
tr.fr_RF_upperleg_XM_fr_RF_hipassembly(3,2) = 1.0;
tr.fr_RF_upperleg_XM_fr_RF_hipassembly(6,3) = 0.08;
tr.fr_RF_upperleg_XM_fr_RF_hipassembly(6,5) = 1;

tr.fr_RF_hipassembly_XM_fr_RF_upperleg = zeros(6, 6);
tr.fr_RF_hipassembly_XM_fr_RF_upperleg(2,3) = 1;
tr.fr_RF_hipassembly_XM_fr_RF_upperleg(5,6) = 1.0;
tr.fr_RF_hipassembly_XM_fr_RF_upperleg(6,3) = 0.08;

tr.fr_RF_lowerleg_XM_fr_RF_upperleg = zeros(6, 6);
tr.fr_RF_lowerleg_XM_fr_RF_upperleg(3,3) = 1.0;
tr.fr_RF_lowerleg_XM_fr_RF_upperleg(6,2) = - 0.35;
tr.fr_RF_lowerleg_XM_fr_RF_upperleg(6,6) = 1;

tr.fr_RF_upperleg_XM_fr_RF_lowerleg = zeros(6, 6);
tr.fr_RF_upperleg_XM_fr_RF_lowerleg(3,3) = 1;
tr.fr_RF_upperleg_XM_fr_RF_lowerleg(5,3) = - 0.35;
tr.fr_RF_upperleg_XM_fr_RF_lowerleg(6,6) = 1.0;

tr.fr_LH_hipassembly_XM_fr_trunk = zeros(6, 6);
tr.fr_LH_hipassembly_XM_fr_trunk(3,1) = - 1.0;
tr.fr_LH_hipassembly_XM_fr_trunk(6,3) = 0.207;
tr.fr_LH_hipassembly_XM_fr_trunk(6,4) = - 1.0;

tr.fr_trunk_XM_fr_LH_hipassembly = zeros(6, 6);
tr.fr_trunk_XM_fr_LH_hipassembly(1,3) = - 1.0;
tr.fr_trunk_XM_fr_LH_hipassembly(4,6) = - 1.0;
tr.fr_trunk_XM_fr_LH_hipassembly(6,3) = 0.207;

tr.fr_LH_upperleg_XM_fr_LH_hipassembly = zeros(6, 6);
tr.fr_LH_upperleg_XM_fr_LH_hipassembly(3,2) = - 1.0;
tr.fr_LH_upperleg_XM_fr_LH_hipassembly(6,3) = - 0.08;
tr.fr_LH_upperleg_XM_fr_LH_hipassembly(6,5) = - 1;

tr.fr_LH_hipassembly_XM_fr_LH_upperleg = zeros(6, 6);
tr.fr_LH_hipassembly_XM_fr_LH_upperleg(2,3) = - 1;
tr.fr_LH_hipassembly_XM_fr_LH_upperleg(5,6) = - 1.0;
tr.fr_LH_hipassembly_XM_fr_LH_upperleg(6,3) = - 0.08;

tr.fr_LH_lowerleg_XM_fr_LH_upperleg = zeros(6, 6);
tr.fr_LH_lowerleg_XM_fr_LH_upperleg(3,3) = 1.0;
tr.fr_LH_lowerleg_XM_fr_LH_upperleg(6,2) = - 0.35;
tr.fr_LH_lowerleg_XM_fr_LH_upperleg(6,6) = 1;

tr.fr_LH_upperleg_XM_fr_LH_lowerleg = zeros(6, 6);
tr.fr_LH_upperleg_XM_fr_LH_lowerleg(3,3) = 1;
tr.fr_LH_upperleg_XM_fr_LH_lowerleg(5,3) = - 0.35;
tr.fr_LH_upperleg_XM_fr_LH_lowerleg(6,6) = 1.0;

tr.fr_RH_hipassembly_XM_fr_trunk = zeros(6, 6);
tr.fr_RH_hipassembly_XM_fr_trunk(3,1) = 1.0;
tr.fr_RH_hipassembly_XM_fr_trunk(6,3) = 0.207;
tr.fr_RH_hipassembly_XM_fr_trunk(6,4) = 1.0;

tr.fr_trunk_XM_fr_RH_hipassembly = zeros(6, 6);
tr.fr_trunk_XM_fr_RH_hipassembly(1,3) = 1.0;
tr.fr_trunk_XM_fr_RH_hipassembly(4,6) = 1.0;
tr.fr_trunk_XM_fr_RH_hipassembly(6,3) = 0.207;

tr.fr_RH_upperleg_XM_fr_RH_hipassembly = zeros(6, 6);
tr.fr_RH_upperleg_XM_fr_RH_hipassembly(3,2) = 1.0;
tr.fr_RH_upperleg_XM_fr_RH_hipassembly(6,3) = 0.08;
tr.fr_RH_upperleg_XM_fr_RH_hipassembly(6,5) = 1;

tr.fr_RH_hipassembly_XM_fr_RH_upperleg = zeros(6, 6);
tr.fr_RH_hipassembly_XM_fr_RH_upperleg(2,3) = 1;
tr.fr_RH_hipassembly_XM_fr_RH_upperleg(5,6) = 1.0;
tr.fr_RH_hipassembly_XM_fr_RH_upperleg(6,3) = 0.08;

tr.fr_RH_lowerleg_XM_fr_RH_upperleg = zeros(6, 6);
tr.fr_RH_lowerleg_XM_fr_RH_upperleg(3,3) = 1.0;
tr.fr_RH_lowerleg_XM_fr_RH_upperleg(6,2) = - 0.35;
tr.fr_RH_lowerleg_XM_fr_RH_upperleg(6,6) = 1;

tr.fr_RH_upperleg_XM_fr_RH_lowerleg = zeros(6, 6);
tr.fr_RH_upperleg_XM_fr_RH_lowerleg(3,3) = 1;
tr.fr_RH_upperleg_XM_fr_RH_lowerleg(5,3) = - 0.35;
tr.fr_RH_upperleg_XM_fr_RH_lowerleg(6,6) = 1.0;


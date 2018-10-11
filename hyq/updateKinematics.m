function h = updateKinematics(h, q)

h = updateHomogeneousTransforms(h, q);
%jac = updateJacobians(h, q);

%J.lf = jac.fr_trunk_J_LF_foot(4:6,1:3);
%J.rf = jac.fr_trunk_J_RF_foot(4:6,1:3);
%J.lh = jac.fr_trunk_J_LH_foot(4:6,1:3);
%J.rh = jac.fr_trunk_J_RH_foot(4:6,1:3);
%[feet.lf, q] = fwdKin(h, q, 'LF'); feetVel.lf = J.lf*getLegData('LF',dq);
%[feet.rf, q] = fwdKin(h, q, 'RF'); feetVel.rf = J.rf*getLegData('RF',dq);
%[feet.lh, q] = fwdKin(h, q, 'LH'); feetVel.lh = J.lh*getLegData('LH',dq);
%[feet.rh, q] = fwdKin(h, q, 'RH'); feetVel.rh = J.rh*getLegData('RH',dq);

%hips.lf = getHipPos( 'LF');
%hips.rf = getHipPos( 'RF');
%hips.lh = getHipPos( 'LH');
%hips.rh = getHipPos( 'RH');
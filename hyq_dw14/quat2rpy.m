function [rpy] = quat2rpy(q0,q1,q2,q3)
% inline RollPitchYaw quat2rpy(SL_quat q)
% {
% 	RollPitchYaw rpy;
% 	// code from http://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToEuler/
% 
% 	double q0 = q.q[_Q0_];
% 	double q1 = q.q[_Q1_];
% 	double q2 = q.q[_Q2_];
% 	double q3 = q.q[_Q3_];

% 	/* old */
	rpy.yaw   = atan2(2.0*(q0*q3 + q1*q2),1.0 - 2.0*(q2*q2 + q3*q3));
	rpy.pitch = asin(2.0*(q0*q2 - q3*q1));
	rpy.roll  = atan2(2.0*(q0*q1 + q2*q3),1.0 - 2.0*(q1*q1 + q2*q2));
% 
% 
%         // jb - 14.11
% 	/*
% 	rpy.yaw = atan2(2.0*(q0*q2 - q1*q3),1.0 - 2.0*(q2*q2 + q3*q3));
% 	rpy.pitch = asin(2.0*(q1*q2 + q3*q0));
% 	rpy.roll = atan2(2.0*(q0*q1 - q2*q3),1.0 - 2.0*(q1*q1 + q2*q2));
% % 	*/
% % 
% 	//TODO: handle singularities!!
% 	return rpy;
% }

function [task] = task_hyq_jump_cost2(n_parameter)

task.name = 'hyqjumping';

% task.perform_rollout = @perform_rollout_rearing;
task.perform_rollout = @perform_rollout_jump;

task.perform_rollout_evaluation = @perform_rollout_pointmassmotion_evaluation;

task.hyq_joint_limits = [
	-1.5708, 0.5236; % haa
	-0.8727, 1.2217; % hfe
	-2.4435, -0.3491; % kfe
	
	-1.5708, 0.5236;
	-0.8727, 1.2217;
	-2.4435, -0.3491;
	
	-1.5708, 0.5236;
	-1.2217, 0.8727;
	0.3491, 2.4435;
	
	-1.5708, 0.5236;
	-1.2217, 0.8727;
	0.3491, 2.4435; ];

task.hyq2max_joint_limits = [
    -0.6981, 0.6981; % haa
    -2.3562, 2.3562; % hfe
    -0.0436, 2.9234; % kfe
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
    -0.0436, 2.9234; 
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
    -0.0436, 2.9234; 
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
    -0.0436, 2.9234;];

task.initM = [  sum(task.hyq_joint_limits(1,:))/2 *ones(1,16),... %LF
	sum(task.hyq_joint_limits(2,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(3,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(4,:))/2*ones(1,16),... %RF
	sum(task.hyq_joint_limits(5,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(6,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(7,:))/2*ones(1,16),... %LH
	sum(task.hyq_joint_limits(8,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(9,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(10,:))/2*ones(1,16),... %RH
	sum(task.hyq_joint_limits(11,:))/2*ones(1,16),...
	sum(task.hyq_joint_limits(12,:))/2*ones(1,16)];

task.initL = [  task.hyq_joint_limits(1,1)*ones(1,16),... %LF
	task.hyq_joint_limits(2,1)*ones(1,16),...
	task.hyq_joint_limits(3,1)*ones(1,16),...
	task.hyq_joint_limits(4,1)*ones(1,16),... %RF
	task.hyq_joint_limits(5,1)*ones(1,16),...
	task.hyq_joint_limits(6,1)*ones(1,16),...
	task.hyq_joint_limits(7,1)*ones(1,16),... %LH
	task.hyq_joint_limits(8,1)*ones(1,16),...
	task.hyq_joint_limits(9,1)*ones(1,16),...
	task.hyq_joint_limits(10,1)*ones(1,16),... %RH
	task.hyq_joint_limits(11,1)*ones(1,16),...
	task.hyq_joint_limits(11,1)*ones(1,16)];

task.initH = [  task.hyq_joint_limits(1,2)*ones(1,16),... %LF
	task.hyq_joint_limits(2,2)*ones(1,16),...
	task.hyq_joint_limits(3,2)*ones(1,16),...
	task.hyq_joint_limits(4,2)*ones(1,16),... %RF
	task.hyq_joint_limits(5,2)*ones(1,16),...
	task.hyq_joint_limits(6,2)*ones(1,16),...
	task.hyq_joint_limits(7,2)*ones(1,16),... %LH
	task.hyq_joint_limits(8,2)*ones(1,16),...
	task.hyq_joint_limits(9,2)*ones(1,16),...
	task.hyq_joint_limits(10,2)*ones(1,16),... %RH
	task.hyq_joint_limits(11,2)*ones(1,16),...
	task.hyq_joint_limits(11,2)*ones(1,16)];

task.init = [  -0.2*ones(1,16),... %LF
	0.8*ones(1,16),...
	-1.6*ones(1,16),...
	0.2*ones(1,16),... %RF
	0.8*ones(1,16),...
	-1.6*ones(1,16),...
	-0.2*ones(1,16),... %LH
	-0.8*ones(1,16),...
	1.6*ones(1,16),...
	0.2*ones(1,16),... %RH
	-0.8*ones(1,16),...
	1.6*ones(1,16)];

% 	function cost = perform_rollout_rearing(task,theta)
% 		[X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout(theta);
% 		
% 		%cost_weights = [0.001 100 1 1000];
% 		%cost_weights = [0.001 100 100 1000 1000 100];
% 		cost_weights = [0.1 100 1000 100 100 1];
% 		running_cost = sum(sum(sqrt(u.^2)))/size(time,2);
% 		%       final_RPY = [0, -pi/2, 0]';
% 		final_RPY = [0, -pi/2, 0]';
% 		%      final_orientation_cost = sum(RPY(:,end) - final_RPY).^2;
% 		final_orientation_cost = (RPY(2,end) - final_RPY(2)).^2;
% 		final_angular_rate_cost = sum(((RPY(:,end) - RPY(:,end-1))/(time(end)-time(end-1))).^2);
% 		final_position_cost = (X(3,end)<0.70) * (0.7-X(3,end)^2);
% 		final_velocity_cost = sum(Xd(:,end).^2);
% 		
% 		joint_limits_cost = sum (sum( (1 - (repmat(task.hyq_joint_limits(:,1),[1,size(th,2)])<th) ) + ...
% 			(1 - (th<repmat(task.hyq_joint_limits(:,2),[1,size(th,2)])) ) ));
% 		
% 		cost = cost_weights(1) * running_cost + ...               % minimize torques
% 			cost_weights(2) * final_orientation_cost + ...  % minimize end orinentation goal
% 			cost_weights(3) * final_angular_rate_cost + ... % minimize end angular velocity
% 			cost_weights(4) * final_position_cost + ...     % minimize end position goal (only Z axis)
% 			cost_weights(5) * final_velocity_cost + ...     % minimize end velocity
% 			cost_weights(6) * joint_limits_cost;            % joint limit violations
% 	end

	function cost = perform_rollout_jump(task,theta)
		[X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout(theta);
		
		%cost_weights = [0.001 100 1 1000];
		%cost_weights = [0.001 100 100 1000 1000 100]; 
		%cost_weights = [100 200 200 300 0 100 1000 100]; cost 3
		%last%cost_weights = [10 20 20 30 0 10 100 1000]; cost 1
%         cost_weights = [0 100 100 100 100 0 0 0]; % IH last used cost 2
        cost_weights = [10 20 20 30 0 10 100 1000];
        
		running_cost = sum(sum(sqrt(u.^2)))/size(time,2);
		%       final_RPY = [0, -pi/2, 0]';
		mid_RPY = [pi, 0, 0]';
		final_RPY = [0, 0, 0]';
		%      final_orientation_cost = sum(RPY(:,end) - final_RPY).^2;
		mid_orientation_cost = sum((abs(RPY(:,floor(length(time)/2))) - mid_RPY).^2);
		mid_position_cost = (X(3,floor(length(time)/2))<0.60) * (0.6-X(3,floor(length(time)/2))^2);
		final_orientation_cost = sum((RPY(:,end) - final_RPY).^2);
		final_angular_rate_cost = sum(((RPY(:,end) - RPY(:,end-1))/(time(end)-time(end-1))).^2);
		final_position_cost = (X(3,end)<0.60) * (0.6-X(3,end)^2);
		final_velocity_cost = sum(Xd(:,end).^2);
		
		joint_limits_cost = sum (sum( (1 - (repmat(task.hyq_joint_limits(:,1),[1,size(th,2)])<th) ) + ...
			(1 - (th<repmat(task.hyq_joint_limits(:,2),[1,size(th,2)])) ) ));		
		
		cost = cost_weights(1) * running_cost + ...               % minimize torques
			cost_weights(2) * mid_orientation_cost + ...  % minimize mid orinentation goal
			cost_weights(3) * mid_position_cost + ...
			cost_weights(4) * final_orientation_cost + ...  % minimize end orinentation goal
			cost_weights(5) * final_position_cost + ...  % minimize end position goal
			cost_weights(6) * joint_limits_cost + ...       % joint limit violations
			cost_weights(7) * final_angular_rate_cost + ... % minimize end angular velocity
			cost_weights(8) * final_velocity_cost;            % final velocity cost
       
	end

	function [y, yd, ydd, time] = perform_rollout_pointmassmotion_evaluation(task,theta)
	end

end

%  hyq_do_Rollout(out.datx(end,:),1)

function [task] = task_hyq_selfRighting(n_parameter)

task.name = 'hyq2max_selfrighting';
task.perform_rollout = @perform_rollout_right;

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

%as defined in gazebo
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
 
% task.hyq2max_joint_limits(1:2:end) = tf_joints_gazebo2matlab(task.hyq2max_joint_limits(1:2:end)')';
% task.hyq2max_joint_limits(2:2:end) = tf_joints_gazebo2matlab(task.hyq2max_joint_limits(2:2:end)')';

% task.init = [  -0.2*ones(1,16),... %LF
% 	0.8*ones(1,16),...
% 	-1.6*ones(1,16),...
% 	0.2*ones(1,16),... %RF
% 	0.8*ones(1,16),...
% 	-1.6*ones(1,16),...
% 	-0.2*ones(1,16),... %LH
% 	-0.8*ones(1,16),...
% 	1.6*ones(1,16),...
% 	0.2*ones(1,16),... %RH
% 	-0.8*ones(1,16),...
% 	1.6*ones(1,16)];

%%% hyq2max   

task.go0 = [-0.075; 0.63; -1.32; -0.075; 0.63; -1.32; -0.075; -0.63; 1.32; -0.075; -0.63; 1.32;];
task.go0 = tf_joints_gazebo2matlab(task.go0);

task.init= [  task.go0(1)*ones(1,16),... %positions gp0
              task.go0(2)*ones(1,16),...
              task.go0(3)*ones(1,16),...
              task.go0(4)*ones(1,16),... %positions gp0
              task.go0(5)*ones(1,16),...
              task.go0(6)*ones(1,16),...
              task.go0(7)*ones(1,16),...
              task.go0(8)*ones(1,16),...
              task.go0(9)*ones(1,16),...
              task.go0(10)*ones(1,16),... %positions gp0
              task.go0(11)*ones(1,16),...
              task.go0(12)*ones(1,16)]; 

task.initgo0= [ 0:task.go0(1)/15:task.go0(1),... %positions gp0
                0:task.go0(2)/15:task.go0(2),... 
                0:task.go0(3)/15:task.go0(3),... 
                0:task.go0(4)/15:task.go0(4),... 
                0:task.go0(5)/15:task.go0(5),... 
                0:task.go0(6)/15:task.go0(6),... 
                0:task.go0(7)/15:task.go0(7),... 
                0:task.go0(8)/15:task.go0(8),... 
                0:task.go0(9)/15:task.go0(9),... 
                0:task.go0(10)/15:task.go0(10),... 
                0:task.go0(11)/15:task.go0(11),... 
                0:task.go0(12)/15:task.go0(12) ];           
          
          
 task.initZeros=zeros(1,12*16);

% filename='mu9_SR_data_terrain_init_06-Jul-2016_1.mat'
% task.initLegPos=storedInitialisation(filename);
% task.initLegPos=zeros(12,1);
task.initLegPos=[-0.2; 0.8; -1.6; 0.2; 0.8; -1.6; -0.2; -0.8; 1.6; 0.2; -0.8; 1.6];
% for i=1:12
%     task.initLegPos(i)= task.hyq_joint_limits(i,1) + (task.hyq_joint_limits(i,2)-task.hyq_joint_limits(i,1)).*rand(1);
% end 


%task.cost_weights = [0.1 10^4 10^2 10^3 10^3 1]; rearing
%task.cost_weights = [0.1 10^3 10 10^5 10 1];

% task.cost_weights = [0.1 10^5 10 10^7 10 1 0];
task.cost_weights = [0.1 10^3 10 10^7 10 1 100];

task.final_RPY = [0, 0, 0]';
task.final_X=[0.019, 0.00, 0.45]';
    
task.Dinit=5;
task.Kinit=5;

task.D=10;
task.K=100;
             

    function cost = perform_rollout_right(task,theta)
% 		[X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right(theta, task, 0);

        [X,Xd,Q,RPY, ...
            th,thd,u,des_th,des_thd, ...
            LF_foot_pos,RF_foot_pos,LH_foot_pos,RH_foot_pos, ...
            time] = hyq_do_Rollout_right_back(theta, task, 0);
        
        th=tf_joints_matlab2gazebo(th);% because tf is applied on limits
%         before
        
        RPYd = diff(RPY,1,2);
        RPYd = [zeros(size(RPYd,1),1) , RPYd];

%         cost_weights = [0.1 100 1000 100 100 1]; AR works still falls
%         back in some scenarios (pi/4)
%         cost_weights = [0.1 100 1000 100 1000 1];  %works pi/3 pi/4
  
        cost_weights = task.cost_weights;
        final_RPY=task.final_RPY;
        final_X=task.final_X;
        
        running_cost = sum(sum(sqrt(u.^2)))/size(time,2);
		final_orientation_cost = sum((RPY(:,end) - final_RPY).^2);
		final_angular_rate_cost = sum(((RPY(:,end) - RPY(:,end-1))/(time(end)-time(end-1))).^2);
% 		final_position_cost = sum((X(:,end)-final_X).^2);
        final_position_cost = (X(3,end)<final_X(3)) * ((final_X(3)-X(3,end))^2);
		final_velocity_cost = sum(Xd(:,end).^2);
        
        final_legpos_cost = (RF_foot_pos(3,end))^2 +(RH_foot_pos(3,end))^2;       
		
		joint_limits_cost = sum (sum( (1 - (repmat(task.hyq_joint_limits(:,1),[1,size(th,2)])<th) ) + ...
			(1 - (th<repmat(task.hyq_joint_limits(:,2),[1,size(th,2)])) ) ));
        
		
		cost = cost_weights(1) * running_cost + ...               % minimize torques
			cost_weights(2) * final_orientation_cost + ...  % minimize end orinentation goal
			cost_weights(3) * final_angular_rate_cost + ... % minimize end angular velocity
			cost_weights(4) * final_position_cost + ...     % minimize end position goal (only Z axis)
			cost_weights(5) * final_velocity_cost + ...     % minimize end velocity
			cost_weights(6) * joint_limits_cost + ...       % joint limit violations
            cost_weights(7) * final_legpos_cost;            % enforce legs on ground
	end
 

end


function [task] = task_hyqrearingmotion(n_parameter)

task.name = 'hyqrearing';

task.perform_rollout = @perform_rollout_rearing;

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
task.hyq2max_joint_limits = [
    -0.6981, 0.6981; % haa
    -2.3562, 2.3562; % hfe
    -2.9234, -0.0436; % kfe
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
    -2.9234, -0.0436; % kfe
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
     0.0436, 2.9234; 
    
    -0.6981, 0.6981; 
    -2.3562, 2.3562; 
     0.0436, 2.9234;];

% %%% hyq
% task.init = [  -0.2*ones(1,16),... %positions go0
%                  0.8*ones(1,16),...
%                  -1.6*ones(1,16),...
%                  -0.2*ones(1,16),...
%                  -0.8*ones(1,16),...
%                  1.6*ones(1,16)]; 

%%% hyq2max   

task.go0 = [-0.075; 0.63; -1.32; -0.075; 0.63; -1.32; -0.075; -0.63; 1.32; -0.075; -0.63; 1.32;];
task.go0 = tf_joints_gazebo2matlab(task.go0);

task.init= [  task.go0(1)*ones(1,16),... %positions gp0
              task.go0(2)*ones(1,16),...
              task.go0(3)*ones(1,16),...
              task.go0(7)*ones(1,16),...
              task.go0(8)*ones(1,16),...
              task.go0(9)*ones(1,16)]; 


% task.cost_weights = [0.1 400 1000 100 1000 1];
% task.cost_weights = [0.1 2500 1000 3000 1000 1];
% task.cost_weights = [0 10^2 0 10^2 0 0];
task.cost_weights = [0.1 10^4 10^2 10^3 10^3 1];
task.final_RPY = [0, -pi/3, 0]';
task.final_X_thr=[0.0, 0.0, 1.2]';
             

    function cost = perform_rollout_rearing(task,theta)
        [X,Xd,Q,RPY,th,thd,u,time] = hyqRearingRollout(task, theta, 0);
        th=tf_joints_matlab2gazebo(th);
        
        RPYd = diff(RPY,1,2);
        RPYd = [zeros(size(RPYd,1),1) , RPYd];

%         cost_weights = [0.1 100 1000 100 100 1]; AR works still falls
%         back in some scenarios (pi/4)
%         cost_weights = [0.1 100 1000 100 1000 1];  %works pi/3 pi/4
        cost_weights = task.cost_weights;  %works pi/3 pi/4

        running_cost = sum(sum(sqrt(u.^2)))/size(time,2);
        final_RPY = task.final_RPY;
        %      final_orientation_cost = sum(RPY(:,end) - final_RPY).^2;
        final_orientation_cost = (RPY(2,end) - final_RPY(2)).^2;
        final_angular_rate_cost = sum(((RPY(:,end) - RPY(:,end-1))/(time(end)-time(end-1))).^2);
        
        final_angular_rate_cost = final_angular_rate_cost + ...
            sum(((RPY(2,end) - RPY(2,end-1))/(time(end)-time(end-1))).^2);        
%         farc2 = (RPYd(2,end)<0) * (RPYd(2,end).^2);
        
        final_X_thr = task.final_X_thr;
        final_position_cost = (X(3,end)<final_X_thr(3)) * ((final_X_thr(3)-X(3,end))^2);
        final_velocity_cost = sum(Xd(:,end).^2);        
       
        joint_limits_cost = sum (sum( (1 - (repmat(task.hyq2max_joint_limits(:,1),[1,size(th,2)])<th) ) + ...
            (1 - (th<repmat(task.hyq2max_joint_limits(:,2),[1,size(th,2)])) ) ));
        
        cost = cost_weights(1) * running_cost + ...         % minimize torques
            cost_weights(2) * final_orientation_cost + ...  % minimize end orinentation goal
            cost_weights(3) * (final_angular_rate_cost)+ ... % minimize end angular velocity
            cost_weights(4) * final_position_cost + ...     % minimize end position goal (only Z axis)
            cost_weights(5) * (final_velocity_cost) + ...     % minimize end velocity
            cost_weights(6) * joint_limits_cost;            % joint limit violations
    end

end
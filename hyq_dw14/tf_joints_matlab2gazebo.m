%% Transform angle definitions from Matlab ODE to Gazebo defined conventions
function [theta_gz] = tf_joints_matlab2gazebo(theta_m)
    theta_gz=theta_m;
    
    theta_gz(4,:) = -theta_gz(4,:); 
    theta_gz(10,:)= -theta_gz(10,:);
    
    theta_gz(2,:) = -theta_gz(2,:)+pi/2; 
    theta_gz(5,:) = -theta_gz(5,:)+pi/2; 
    
    theta_gz(3,:) = -theta_gz(3,:)-pi; 
    theta_gz(6,:) = -theta_gz(6,:)-pi; 
        
    theta_gz(8,:) = -theta_gz(8,:)-pi/2; 
    theta_gz(11,:)= -theta_gz(11,:)-pi/2; 
    
    theta_gz(9,:) = -theta_gz(9,:)+pi; 
    theta_gz(12,:)= -theta_gz(12,:)+pi; 
end


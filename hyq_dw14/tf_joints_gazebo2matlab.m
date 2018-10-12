%% Transform angle definitions from Gazebo to Matlab ODE defined conventions
function [theta_m] = tf_joints_gazebo2matlab(theta_gz)

    theta_m=theta_gz;
    %theta shoul be 12xm (DOF X length of trajectory)
    
    %HAA Front
    theta_m(4,:) = -theta_m(4,:); 
    theta_m(10,:)= -theta_m(10,:);
    
    %HFE Front
    theta_m(2,:)= -theta_m(2,:)+pi/2; 
    theta_m(5,:)= -theta_m(5,:)+pi/2; 
    
    %KFE Front
    theta_m(3,:)= -theta_m(3,:)-pi; 
    theta_m(6,:)= -theta_m(6,:)-pi; 
    
    %HFE Hind
    theta_m(8,:) = -theta_m(8,:)-pi/2; 
    theta_m(11,:)= -theta_m(11,:)-pi/2; 
    
    %KFE Hind
    theta_m(9,:) = -theta_m(9,:)+pi; 
    theta_m(12,:)= -theta_m(12,:)+pi; 
end


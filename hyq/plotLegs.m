
function  [h1, h2, h3, h4, h5] = plotLegs(h, leg)
%fwd kinematics plot robot posture
hold on 
if strcmp(leg, 'LF') 
    haa_orig = h.fr_trunk_Xh_fr_LF_HAA(1:3,4);
    hfe_orig = h.fr_trunk_Xh_fr_LF_HFE(1:3,4); 
    kfe_orig = h.fr_trunk_Xh_fr_LF_KFE(1:3,4); 
    foot_orig = h.fr_trunk_Xh_LF_foot(1:3,4); 

elseif strcmp(leg, 'RF') 
    haa_orig = h.fr_trunk_Xh_fr_RF_HAA(1:3,4); 
    hfe_orig = h.fr_trunk_Xh_fr_RF_HFE(1:3,4); 
    kfe_orig = h.fr_trunk_Xh_fr_RF_KFE(1:3,4); 
    foot_orig = h.fr_trunk_Xh_RF_foot(1:3,4); 

elseif strcmp(leg, 'LH') 
    haa_orig = h.fr_trunk_Xh_fr_LH_HAA(1:3,4); 
    hfe_orig = h.fr_trunk_Xh_fr_LH_HFE(1:3,4); 
    kfe_orig = h.fr_trunk_Xh_fr_LH_KFE(1:3,4); 
    foot_orig = h.fr_trunk_Xh_LH_foot(1:3,4); 

elseif strcmp(leg, 'RH') 
    haa_orig = h.fr_trunk_Xh_fr_RH_HAA(1:3,4);
    hfe_orig = h.fr_trunk_Xh_fr_RH_HFE(1:3,4); 
    kfe_orig = h.fr_trunk_Xh_fr_RH_KFE(1:3,4); 
    foot_orig = h.fr_trunk_Xh_RH_foot(1:3,4); 
end

x = [haa_orig(1) hfe_orig(1) NaN hfe_orig(1) kfe_orig(1) NaN kfe_orig(1) foot_orig(1)];
y = [haa_orig(2) hfe_orig(2) NaN hfe_orig(2) kfe_orig(2) NaN kfe_orig(2) foot_orig(2)];
z = [haa_orig(3) hfe_orig(3) NaN hfe_orig(3) kfe_orig(3) NaN kfe_orig(3) foot_orig(3)];
    
h1 = plot3(x,y,z,'Color', 'k','LineWidth',10);
h2 = plot3(foot_orig(1),foot_orig(2),foot_orig(3),'or');
h3 = plot3( haa_orig(1),haa_orig(2),haa_orig(3),'ro');
h4 = plot3( hfe_orig(1),hfe_orig(2),hfe_orig(3),'ro');
h5 = plot3( kfe_orig(1),kfe_orig(2),kfe_orig(3),'ro');

% axis equal
% view(3)
% view([-90,120,40]) % swap the x and y axis
 
xlim([-0.5 ,0.5])
ylim([-0.5 ,0.5])
zlim([-0.8 ,0])

xlabel('$X$')
ylabel('$Y$')
zlabel('$Z$')

end


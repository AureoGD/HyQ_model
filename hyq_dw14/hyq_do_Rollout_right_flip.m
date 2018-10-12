function [X,Xd,Q,RPY, ...
    th,thd,u,des_th,des_thd, ...
    LF_foot_pos,RF_foot_pos,LH_foot_pos,RH_foot_pos, ...
    time] = hyq_do_Rollout_right_flip(theta,task,realtime)
if ~exist('realtime','var')
    realtime = 0;
end
%theta is n_gaussian kernels * dofs → 16 x 12
%note that this is hardcoded with the policy encoding 
% also the task time is hadcoded to 3 sec
% reshape the vector of params to the "policy format"
temp_thetas = reshape(theta,16,12);

thetas = temp_thetas';

%thetas = reshape(theta,16,12);
%thetas = thetas';
% # first get the torque profiles
timestep = 0.001; %from the simulation
tf = 3; %sec
time = 0:timestep:tf;
des_th = zeros(12,size(time,2));
for i = 1:12 %for each dof
    des_th(i,:) = torquepolicy(time,thetas(i,:),tf);
    
end
des_thd = diff(des_th,1,2);
des_thd = [zeros(size(des_thd,1),1) , des_thd];
% plot(time,des_th);
% pause()
% # then set up the simulation
% Initialization
if realtime % show stdes_th
%     sim = odesim('hyq2max_terrain.xml');                         % Load configuration
    sim = odesim('hyq2max_terrain_flip.xml');                         % Load configuration
    sim.realtime();
else % show nothing
    sim = odesim('hyq2max_terrain_flip.xml','nodialog'); 
    % Load configuration
%     sim.realtime();     
end
if realtime
    pause();
end
% Slow down to realtime
% Define sensors and actuators
hyq_x = sim.sensor('robot.trunk.position.x');    % Define sensor
hyq_y = sim.sensor('robot.trunk.position.y');    % Define sensor
hyq_z = sim.sensor('robot.trunk.position.z');    % Define sensor

hyq_xd = sim.sensor('robot.trunk.velocity.x');    % Define sensor
hyq_yd = sim.sensor('robot.trunk.velocity.y');    % Define sensor
hyq_zd = sim.sensor('robot.trunk.velocity.z');    % Define sensor

hyq_q1 = sim.sensor('robot.trunk.orientation.x');    % Define sensor
hyq_q2 = sim.sensor('robot.trunk.orientation.y');    % Define sensor
hyq_q3 = sim.sensor('robot.trunk.orientation.z');    % Define sensor
hyq_q4 = sim.sensor('robot.trunk.orientation.w');    % Define sensor

%--LF variables
LF_HAA_th = sim.sensor('robot.LF_HAA.angle');    % Define sensor
LF_HFE_th = sim.sensor('robot.LF_HFE.angle');    % Define sensor
LF_KFE_th = sim.sensor('robot.LF_KFE.angle');    % Define sensor
LF_HAA_thd = sim.sensor('robot.LF_HAA.anglerate');    % Define sensor
LF_HFE_thd = sim.sensor('robot.LF_HFE.anglerate');    % Define sensor
LF_KFE_thd = sim.sensor('robot.LF_KFE.anglerate');    % Define sensor
LF_HAA_u = sim.actuator('robot.LF_HAA.torque');    % Define sensor
LF_HFE_u = sim.actuator('robot.LF_HFE.torque');    % Define sensor
LF_KFE_u = sim.actuator('robot.LF_KFE.torque');    % Define sensor

LF_shin_x = sim.sensor('robot.LF_lower_leg.position.x');    % Define sensor
LF_shin_y = sim.sensor('robot.LF_lower_leg.position.y');    % Define sensor
LF_shin_z = sim.sensor('robot.LF_lower_leg.position.z');    % Define sensor

LF_shin_q1 = sim.sensor('robot.LF_lower_leg.orientation.x');    % Define sensor
LF_shin_q2 = sim.sensor('robot.LF_lower_leg.orientation.y');    % Define sensor
LF_shin_q3 = sim.sensor('robot.LF_lower_leg.orientation.z');    % Define sensor
LF_shin_q4 = sim.sensor('robot.LF_lower_leg.orientation.w');    % Define sensor

%--RF variables
RF_HAA_th = sim.sensor('robot.RF_HAA.angle');    % Define sensor
RF_HFE_th = sim.sensor('robot.RF_HFE.angle');    % Define sensor
RF_KFE_th = sim.sensor('robot.RF_KFE.angle');    % Define sensor
RF_HAA_thd = sim.sensor('robot.RF_HAA.anglerate');    % Define sensor
RF_HFE_thd = sim.sensor('robot.RF_HFE.anglerate');    % Define sensor
RF_KFE_thd = sim.sensor('robot.RF_KFE.anglerate');    % Define sensor
RF_HAA_u = sim.actuator('robot.RF_HAA.torque');    % Define sensor
RF_HFE_u = sim.actuator('robot.RF_HFE.torque');    % Define sensor
RF_KFE_u = sim.actuator('robot.RF_KFE.torque');    % Define sensor

RF_shin_x = sim.sensor('robot.RF_lower_leg.position.x');    % Define sensor
RF_shin_y = sim.sensor('robot.RF_lower_leg.position.y');    % Define sensor
RF_shin_z = sim.sensor('robot.RF_lower_leg.position.z');    % Define sensor

RF_shin_q1 = sim.sensor('robot.RF_lower_leg.orientation.x');    % Define sensor
RF_shin_q2 = sim.sensor('robot.RF_lower_leg.orientation.y');    % Define sensor
RF_shin_q3 = sim.sensor('robot.RF_lower_leg.orientation.z');    % Define sensor
RF_shin_q4 = sim.sensor('robot.RF_lower_leg.orientation.w');    % Define sensor

%--LH variables
LH_HAA_th = sim.sensor('robot.LH_HAA.angle');    % Define sensor
LH_HFE_th = sim.sensor('robot.LH_HFE.angle');    % Define sensor
LH_KFE_th = sim.sensor('robot.LH_KFE.angle');    % Define sensor
LH_HAA_thd = sim.sensor('robot.LH_HAA.anglerate');    % Define sensor
LH_HFE_thd = sim.sensor('robot.LH_HFE.anglerate');    % Define sensor
LH_KFE_thd = sim.sensor('robot.LH_KFE.anglerate');    % Define sensor
LH_HAA_u = sim.actuator('robot.LH_HAA.torque');    % Define sensor
LH_HFE_u = sim.actuator('robot.LH_HFE.torque');    % Define sensor
LH_KFE_u = sim.actuator('robot.LH_KFE.torque');    % Define sensor

LH_shin_x = sim.sensor('robot.LH_lower_leg.position.x');    % Define sensor
LH_shin_y = sim.sensor('robot.LH_lower_leg.position.y');    % Define sensor
LH_shin_z = sim.sensor('robot.LH_lower_leg.position.z');    % Define sensor

LH_shin_q1 = sim.sensor('robot.LH_lower_leg.orientation.x');    % Define sensor
LH_shin_q2 = sim.sensor('robot.LH_lower_leg.orientation.y');    % Define sensor
LH_shin_q3 = sim.sensor('robot.LH_lower_leg.orientation.z');    % Define sensor
LH_shin_q4 = sim.sensor('robot.LH_lower_leg.orientation.w');    % Define sensor

%--RH variables
RH_HAA_th = sim.sensor('robot.RH_HAA.angle');    % Define sensor
RH_HFE_th = sim.sensor('robot.RH_HFE.angle');    % Define sensor
RH_KFE_th = sim.sensor('robot.RH_KFE.angle');    % Define sensor
RH_HAA_thd = sim.sensor('robot.RH_HAA.anglerate');    % Define sensor
RH_HFE_thd = sim.sensor('robot.RH_HFE.anglerate');    % Define sensor
RH_KFE_thd = sim.sensor('robot.RH_KFE.anglerate');    % Define sensor
RH_HAA_u = sim.actuator('robot.RH_HAA.torque');    % Define sensor
RH_HFE_u = sim.actuator('robot.RH_HFE.torque');    % Define sensor
RH_KFE_u = sim.actuator('robot.RH_KFE.torque');    % Define sensor

RH_shin_x = sim.sensor('robot.RH_lower_leg.position.x');    % Define sensor
RH_shin_y = sim.sensor('robot.RH_lower_leg.position.y');    % Define sensor
RH_shin_z = sim.sensor('robot.RH_lower_leg.position.z');    % Define sensor

RH_shin_q1 = sim.sensor('robot.RH_lower_leg.orientation.x');    % Define sensor
RH_shin_q2 = sim.sensor('robot.RH_lower_leg.orientation.y');    % Define sensor
RH_shin_q3 = sim.sensor('robot.RH_lower_leg.orientation.z');    % Define sensor
RH_shin_q4 = sim.sensor('robot.RH_lower_leg.orientation.w');    % Define sensor

actuators = sim.actuate();                        % Get actuation vector

% K = 600; D = 10; % PD gains for position control TWEAK
% K = 300; D = 10; % PD gains for position control TWEAK
K=task.K;
D=task.D;
%tf = 3; %(sec) %DEFINED PREVIOUSLY
%time = 0:sim.step():tf; % sim time = 0.005
X = zeros(3,size(time,2));  % positions (cartesian, absolute)
Xd = zeros(3,size(time,2)); % velocities (cartesian, absolute)
Q = zeros(4,size(time,2));  % quaternions (x,y,z,w)
RPY = zeros(3,size(time,2));
dofs = 12;
th = zeros(dofs,size(time,2)); % joint angles
thd = zeros(dofs,size(time,2)); % joint angles rates
u  = zeros(dofs,size(time,2)); % torques

LF_foot_pos = zeros(3,size(time,2));  % positions (cartesian, absolute)
RF_foot_pos = zeros(3,size(time,2));  % positions (cartesian, absolute)
LH_foot_pos = zeros(3,size(time,2));  % positions (cartesian, absolute)
RH_foot_pos = zeros(3,size(time,2));  % positions (cartesian, absolute)

%run a 1 sec simulation with simple PD control to setle down the staratup
%dynamics

Dinit=task.Dinit;
Kinit=task.Kinit;

%% pre-Control loop
for t = 0:sim.step():2 % one sec should be enough
    sensors = sim.sense();                        % Measure sensor values
    % actuation PD → torque
     actuators(LF_HAA_u) = Kinit*(task.initLegPos(1) - sensors(LF_HAA_th)) + Dinit*(0 - sensors(LF_HAA_thd));
     actuators(LF_HFE_u) = Kinit*(task.initLegPos(2) - sensors(LF_HFE_th)) + Dinit*(0 - sensors(LF_HFE_thd));
     actuators(LF_KFE_u) = Kinit*(task.initLegPos(3) - sensors(LF_KFE_th)) + Dinit*(0 - sensors(LF_KFE_thd));
     
    actuators(RF_HAA_u) = Kinit*(task.initLegPos(4) - sensors(RF_HAA_th)) + Dinit*(0 - sensors(RF_HAA_thd));
    actuators(RF_HFE_u) = Kinit*(task.initLegPos(5) - sensors(RF_HFE_th)) + Dinit*(0 - sensors(RF_HFE_thd));
    actuators(RF_KFE_u) = Kinit*(task.initLegPos(6) - sensors(RF_KFE_th)) + Dinit*(0 - sensors(RF_KFE_thd));

    actuators(LH_HAA_u) = Kinit*(task.initLegPos(7) - sensors(LH_HAA_th)) + Dinit*(0 - sensors(LH_HAA_thd));
    actuators(LH_HFE_u) = Kinit*(task.initLegPos(8) - sensors(LH_HFE_th)) + Dinit*(0 - sensors(LH_HFE_thd));
    actuators(LH_KFE_u) = Kinit*(task.initLegPos(9) - sensors(LH_KFE_th)) + Dinit*(0 - sensors(LH_KFE_thd));

    actuators(RH_HAA_u) = Kinit*(task.initLegPos(10) - sensors(RH_HAA_th)) + Dinit*(0 - sensors(RH_HAA_thd));
    actuators(RH_HFE_u) = Kinit*(task.initLegPos(11) - sensors(RH_HFE_th)) + Dinit*(0 - sensors(RH_HFE_thd));
    actuators(RH_KFE_u) = Kinit*(task.initLegPos(12) - sensors(RH_KFE_th)) + Dinit*(0 - sensors(RH_KFE_thd));
     
    sim.actuate(actuators);                       % Run simulation step
end
if realtime
    pause();
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Second pre control Loop
first_loop=1;
for t = 0:sim.step():2                            % Simulation loop (2s)
    sensors = sim.sense();                        % Measure sensor values

    if (first_loop)
        des_th_fall = [ sensors(LF_HAA_th); sensors(LF_HFE_th); sensors(LF_KFE_th);
                 sensors(RF_HAA_th); sensors(RF_HFE_th); sensors(RF_KFE_th);
                 sensors(LH_HAA_th); sensors(LH_HFE_th); sensors(LH_KFE_th);
                 sensors(RH_HAA_th); sensors(RH_HFE_th); sensors(RH_KFE_th) ];
        
        des_th_falld=zeros(size(des_th_fall));
        first_loop=0;
    end
             
   %##########for position
    actuators(LF_HAA_u) = K*(des_th_fall(1) - sensors(LF_HAA_th)) + D*(des_th_falld(1) - sensors(LF_HAA_thd));
    actuators(LF_HFE_u) = K*(des_th_fall(2) - sensors(LF_HFE_th)) + D*(des_th_falld(2) - sensors(LF_HFE_thd));
    actuators(LF_KFE_u) = K*(des_th_fall(3) - sensors(LF_KFE_th)) + D*(des_th_falld(3) - sensors(LF_KFE_thd));
    
    actuators(RF_HAA_u) = K*(des_th_fall(4) - sensors(RF_HAA_th)) + D*(des_th_falld(4) - sensors(RF_HAA_thd));
    actuators(RF_HFE_u) = K*(des_th_fall(5) - sensors(RF_HFE_th)) + D*(des_th_falld(5) - sensors(RF_HFE_thd));
    actuators(RF_KFE_u) = K*(des_th_fall(6) - sensors(RF_KFE_th)) + D*(des_th_falld(6) - sensors(RF_KFE_thd));

    actuators(LH_HAA_u) = K*(des_th_fall(7) - sensors(LH_HAA_th)) + D*(des_th_falld(7) - sensors(LH_HAA_thd));
    actuators(LH_HFE_u) = K*(des_th_fall(8) - sensors(LH_HFE_th)) + D*(des_th_falld(8) - sensors(LH_HFE_thd));
    actuators(LH_KFE_u) = K*(des_th_fall(9) - sensors(LH_KFE_th)) + D*(des_th_falld(9) - sensors(LH_KFE_thd));

    actuators(RH_HAA_u) = K*(des_th_fall(10) - sensors(RH_HAA_th)) + D*(des_th_falld(10) - sensors(RH_HAA_thd));
    actuators(RH_HFE_u) = K*(des_th_fall(11) - sensors(RH_HFE_th)) + D*(des_th_falld(11) - sensors(RH_HFE_thd));
    actuators(RH_KFE_u) = K*(des_th_fall(12) - sensors(RH_KFE_th)) + D*(des_th_falld(12) - sensors(RH_KFE_thd));

    sim.actuate(actuators);                       % Run simulation step
end

if realtime
    pause();
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAIN Control loop
% pause();
ti = 0; % time index
for t = 0:sim.step():tf                            % Simulation loop (6s)
    sensors = sim.sense();                        % Measure sensor values
    ti = ti + 1;
    % Book-keeping
    X(:,ti) =  [sensors(hyq_x); sensors(hyq_y); sensors(hyq_z)];
    Xd(:,ti) = [sensors(hyq_xd); sensors(hyq_yd); sensors(hyq_zd)];
    Q(:,ti) =  [sensors(hyq_q1); sensors(hyq_q2); sensors(hyq_q3); sensors(hyq_q4)];
    
    rpy = quat2rpy(Q(4,ti),Q(1,ti),Q(2,ti),Q(3,ti)); %p=[p [rpy.roll;rpy.pitch;rpy.yaw]];end
    RPY(:,ti) = [rpy.roll; rpy.pitch; rpy.yaw]; 

    th(:,ti) = [ sensors(LF_HAA_th); sensors(LF_HFE_th); sensors(LF_KFE_th);
                 sensors(RF_HAA_th); sensors(RF_HFE_th); sensors(RF_KFE_th);
                 sensors(LH_HAA_th); sensors(LH_HFE_th); sensors(LH_KFE_th);
                 sensors(RH_HAA_th); sensors(RH_HFE_th); sensors(RH_KFE_th) ];
       
    thd(:,ti) = [ sensors(LF_HAA_thd); sensors(LF_HFE_thd); sensors(LF_KFE_thd);
                  sensors(RF_HAA_thd); sensors(RF_HFE_thd); sensors(RF_KFE_thd);
                  sensors(LH_HAA_thd); sensors(LH_HFE_thd); sensors(LH_KFE_thd);
                  sensors(RH_HAA_thd); sensors(RH_HFE_thd); sensors(RH_KFE_thd) ];
              
              %<lower_leg_length>0.33</lower_leg_length>
     shin_to_foot = [0.33/2; 0; 0];
              
     temp_pos = [ sensors(LF_shin_x); sensors(LF_shin_y); sensors(LF_shin_z)];
     temp_orient = [ sensors(LF_shin_q4); sensors(LF_shin_q1); sensors(LF_shin_q2); sensors(LF_shin_q3)];
     LF_foot_pos(:,ti) = baseToWorld(shin_to_foot, temp_pos, temp_orient);
     
     temp_pos = [ sensors(RF_shin_x); sensors(RF_shin_y); sensors(RF_shin_z)];
     temp_orient = [ sensors(RF_shin_q4); sensors(RF_shin_q1); sensors(RF_shin_q2); sensors(RF_shin_q3)];
     RF_foot_pos(:,ti) = baseToWorld(shin_to_foot, temp_pos, temp_orient);

     temp_pos = [ sensors(LH_shin_x); sensors(LH_shin_y); sensors(LH_shin_z)];
     temp_orient = [ sensors(LH_shin_q4); sensors(LH_shin_q1); sensors(LH_shin_q2); sensors(LH_shin_q3)];
     LH_foot_pos(:,ti) = baseToWorld(-shin_to_foot, temp_pos, temp_orient);
     
     temp_pos = [ sensors(RH_shin_x); sensors(RH_shin_y); sensors(RH_shin_z)];
     temp_orient = [ sensors(RH_shin_q4); sensors(RH_shin_q1); sensors(RH_shin_q2); sensors(RH_shin_q3)];
     RH_foot_pos(:,ti) = baseToWorld(-shin_to_foot, temp_pos, temp_orient);
     
    % actuation PD → torque
%     actuators(LF_HAA_u) = K*(-0.2 - sensors(LF_HAA_th)) + D*(0 - sensors(LF_HAA_thd));
%     actuators(LF_HFE_u) = K*(0.8 - sensors(LF_HFE_th)) + D*(0 - sensors(LF_HFE_thd));
%     actuators(LF_KFE_u) = K*(-1.6 - sensors(LF_KFE_th)) + D*(0 - sensors(LF_KFE_thd));
%     
%     actuators(RF_HAA_u) = K*(0.2 - sensors(RF_HAA_th)) + D*(0 - sensors(RF_HAA_thd));
%     actuators(RF_HFE_u) = K*(0.8 - sensors(RF_HFE_th)) + D*(0 - sensors(RF_HFE_thd));
%     actuators(RF_KFE_u) = K*(-1.6 - sensors(RF_KFE_th)) + D*(0 - sensors(RF_KFE_thd));

%     actuators(LH_HAA_u) = K*(-0.2 - sensors(LH_HAA_th)) + D*(0 - sensors(LH_HAA_thd));
%     actuators(LH_HFE_u) = K*(-0.8 - sensors(LH_HFE_th)) + D*(0 - sensors(LH_HFE_thd));
%     actuators(LH_KFE_u) = K*(1.6 - sensors(LH_KFE_th)) + D*(0 - sensors(LH_KFE_thd));

%     actuators(RH_HAA_u) = K*(0.2 - sensors(RH_HAA_th)) + D*(0 - sensors(RH_HAA_thd));
%     actuators(RH_HFE_u) = K*(-0.8 - sensors(RH_HFE_th)) + D*(0 - sensors(RH_HFE_thd));
%     actuators(RH_KFE_u) = K*(1.6 - sensors(RH_KFE_th)) + D*(0 - sensors(RH_KFE_thd));
     

%##########for position
    actuators(LF_HAA_u) = K*(des_th(1,ti) - sensors(LF_HAA_th)) + D*(des_thd(1,ti) - sensors(LF_HAA_thd));
    actuators(LF_HFE_u) = K*(des_th(2,ti) - sensors(LF_HFE_th)) + D*(des_thd(2,ti) - sensors(LF_HFE_thd));
    actuators(LF_KFE_u) = K*(des_th(3,ti) - sensors(LF_KFE_th)) + D*(des_thd(3,ti) - sensors(LF_KFE_thd));
    
    actuators(RF_HAA_u) = K*(des_th(4,ti) - sensors(RF_HAA_th)) + D*(des_thd(4,ti) - sensors(RF_HAA_thd));
    actuators(RF_HFE_u) = K*(des_th(5,ti) - sensors(RF_HFE_th)) + D*(des_thd(5,ti) - sensors(RF_HFE_thd));
    actuators(RF_KFE_u) = K*(des_th(6,ti) - sensors(RF_KFE_th)) + D*(des_thd(6,ti) - sensors(RF_KFE_thd));

    actuators(LH_HAA_u) = K*(des_th(7,ti) - sensors(LH_HAA_th)) + D*(des_thd(7,ti) - sensors(LH_HAA_thd));
    actuators(LH_HFE_u) = K*(des_th(8,ti) - sensors(LH_HFE_th)) + D*(des_thd(8,ti) - sensors(LH_HFE_thd));
    actuators(LH_KFE_u) = K*(des_th(9,ti) - sensors(LH_KFE_th)) + D*(des_thd(9,ti) - sensors(LH_KFE_thd));

    actuators(RH_HAA_u) = K*(des_th(10,ti) - sensors(RH_HAA_th)) + D*(des_thd(10,ti) - sensors(RH_HAA_thd));
    actuators(RH_HFE_u) = K*(des_th(11,ti) - sensors(RH_HFE_th)) + D*(des_thd(11,ti) - sensors(RH_HFE_thd));
    actuators(RH_KFE_u) = K*(des_th(12,ti) - sensors(RH_KFE_th)) + D*(des_thd(12,ti) - sensors(RH_KFE_thd));

%     actuators(LF_HAA_u) = des_th(1,ti); %##########for torque
%     actuators(LF_HFE_u) = des_th(2,ti);
%     actuators(LF_KFE_u) = des_th(3,ti);
%     
%     actuators(RF_HAA_u) = des_th(4,ti);
%     actuators(RF_HFE_u) = des_th(5,ti);
%     actuators(RF_KFE_u) = des_th(6,ti);
% 
%     actuators(LH_HAA_u) = des_th(7,ti);
%     actuators(LH_HFE_u) = des_th(8,ti);
%     actuators(LH_KFE_u) = des_th(9,ti);
%     
%     actuators(RH_HAA_u) = des_th(10,ti);
%     actuators(RH_HFE_u) = des_th(11,ti);
%     actuators(RH_KFE_u) = des_th(12,ti);

    % Book-keeping continued
    u(:,ti) = [ actuators(LF_HAA_u); actuators(LF_HFE_u); actuators(LF_KFE_u); 
                actuators(RF_HAA_u); actuators(RF_HFE_u); actuators(RF_KFE_u); 
                actuators(LH_HAA_u); actuators(LH_HFE_u); actuators(LH_KFE_u); 
                actuators(RF_HAA_u); actuators(RH_HFE_u); actuators(RH_KFE_u) ]; 

  %pause(0.1);
    sim.actuate(actuators);                       % Run simulation step
end

% One more control loop to see whats happerning after the optim result
if realtime
    pause();
    for t = 0:sim.step():5 % 5 should be enought
        sensors = sim.sense();                        % Measure sensor values
        % actuation PD → torque
        actuators(LF_HAA_u) = K*(des_th(1,end) - sensors(LF_HAA_th)) + D*(0 - sensors(LF_HAA_thd));
        actuators(LF_HFE_u) = K*(des_th(2,end) - sensors(LF_HFE_th)) + D*(0 - sensors(LF_HFE_thd));
        actuators(LF_KFE_u) = K*(des_th(3,end) - sensors(LF_KFE_th)) + D*(0 - sensors(LF_KFE_thd));
        
        actuators(RF_HAA_u) = K*(des_th(4,end) - sensors(RF_HAA_th)) + D*(0 - sensors(RF_HAA_thd));
        actuators(RF_HFE_u) = K*(des_th(5,end) - sensors(RF_HFE_th)) + D*(0 - sensors(RF_HFE_thd));
        actuators(RF_KFE_u) = K*(des_th(6,end) - sensors(RF_KFE_th)) + D*(0 - sensors(RF_KFE_thd));
        
        actuators(LH_HAA_u) = K*(des_th(7,end) - sensors(LH_HAA_th)) + D*(0 - sensors(LH_HAA_thd));
        actuators(LH_HFE_u) = K*(des_th(8,end) - sensors(LH_HFE_th)) + D*(0 - sensors(LH_HFE_thd));
        actuators(LH_KFE_u) = K*(des_th(9,end) - sensors(LH_KFE_th)) + D*(0 - sensors(LH_KFE_thd));
        
        actuators(RH_HAA_u) = K*(des_th(10,end) - sensors(RH_HAA_th)) + D*(0 - sensors(RH_HAA_thd));
        actuators(RH_HFE_u) = K*(des_th(11,end) - sensors(RH_HFE_th)) + D*(0 - sensors(RH_HFE_thd));
        actuators(RH_KFE_u) = K*(des_th(12,end) - sensors(RH_KFE_th)) + D*(0 - sensors(RH_KFE_thd));
        
        sim.actuate(actuators);                       % Run simulation step
    end
end

%% Clean up
% if realtime
%     pause();
% end
sim.close()  



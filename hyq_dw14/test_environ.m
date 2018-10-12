close all
clear all
clc
tic
% --------------------  Initialization --------------------------------
% User defined input parameters (need to be edited)
%strfitnessfct = 'fsphere';  % name of objective/fitness function
%N = 50;               % number of objective variables/problem dimension
N = 12 * 16; %dofs * n_gaussians
task = task_hyq_selfRighting_tmp(N);
xmean= task.init';
task.startSol=xmean; %just for the record
sigma=0.05;
task.startSigma=sigma; %just for the record
% task.initLegPos=[-0.2; 0.8; -1.6; 0.2; 0.8; -1.6; -0.2; -0.8; 1.6; 0.2; -0.8; 1.6];
task.initLegPos=[-0.2; 0.8; -0.6; 0.2; 0.8; -1.6; -0.2; -0.8; 1.6; 0.2; -0.8; 1.6];
% for i=1:12
%     task.initLegPos(i)= task.hyq_joint_limits(i,1) + (task.hyq_joint_limits(i,2)-task.hyq_joint_limits(i,1)).*rand(1);
% end
theta=xmean;
temp_thetas = reshape(theta,16,12);
thetas = temp_thetas';

% # first get the torque profiles
timestep = 0.0025; %from the simulation
tf = 2; %sec
time = 0:timestep:tf;
% # then set up the simulation
% Initialization
sim = odesim('hyq_green_terrain.xml');                         % Load configuration
sim.realtime();

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
K = 300; D = 10; % PD gains for position control TWEAK
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
    
Dinit=10;
Kinit=100;

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
pause();

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
    if (ti==1)
        des_th=th(:,1);
        des_thd=zeros(size(des_th));
    end
    
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
     
    

%##########for position
    actuators(LF_HAA_u) = K*(des_th(1) - sensors(LF_HAA_th)) + D*(des_thd(1) - sensors(LF_HAA_thd));
    actuators(LF_HFE_u) = K*(des_th(2) - sensors(LF_HFE_th)) + D*(des_thd(2) - sensors(LF_HFE_thd));
    actuators(LF_KFE_u) = K*(des_th(3) - sensors(LF_KFE_th)) + D*(des_thd(3) - sensors(LF_KFE_thd));
    
    actuators(RF_HAA_u) = K*(des_th(4) - sensors(RF_HAA_th)) + D*(des_thd(4) - sensors(RF_HAA_thd));
    actuators(RF_HFE_u) = K*(des_th(5) - sensors(RF_HFE_th)) + D*(des_thd(5) - sensors(RF_HFE_thd));
    actuators(RF_KFE_u) = K*(des_th(6) - sensors(RF_KFE_th)) + D*(des_thd(6) - sensors(RF_KFE_thd));

    actuators(LH_HAA_u) = K*(des_th(7) - sensors(LH_HAA_th)) + D*(des_thd(7) - sensors(LH_HAA_thd));
    actuators(LH_HFE_u) = K*(des_th(8) - sensors(LH_HFE_th)) + D*(des_thd(8) - sensors(LH_HFE_thd));
    actuators(LH_KFE_u) = K*(des_th(9) - sensors(LH_KFE_th)) + D*(des_thd(9) - sensors(LH_KFE_thd));

    actuators(RH_HAA_u) = K*(des_th(10) - sensors(RH_HAA_th)) + D*(des_thd(10) - sensors(RH_HAA_thd));
    actuators(RH_HFE_u) = K*(des_th(11) - sensors(RH_HFE_th)) + D*(des_thd(11) - sensors(RH_HFE_thd));
    actuators(RH_KFE_u) = K*(des_th(12) - sensors(RH_KFE_th)) + D*(des_thd(12) - sensors(RH_KFE_thd));

    % Book-keeping continued
    u(:,ti) = [ actuators(LF_HAA_u); actuators(LF_HFE_u); actuators(LF_KFE_u); 
                actuators(RF_HAA_u); actuators(RF_HFE_u); actuators(RF_KFE_u); 
                actuators(LH_HAA_u); actuators(LH_HFE_u); actuators(LH_KFE_u); 
                actuators(RF_HAA_u); actuators(RH_HFE_u); actuators(RH_KFE_u) ]; 
    sim.actuate(actuators);                       % Run simulation step
end


sim.close();

figure()
plot(th')
hold on
grid on
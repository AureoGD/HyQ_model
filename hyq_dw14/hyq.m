%HyQ ODE simulation of the HyQ robot

%% Initialization
sim = odesim('hyq_green_test.xml');                         % Load configuration
sim.reset();
sim.realtime();                                   % Slow down to realtime

%% Define sensors and actuators
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

actuators = sim.actuate();                        % Get actuation vector

K = 600;
D = 10;
tf = 20; %(sec)
time = 0:sim.step():tf; % sim time = 0.005
X = zeros(3,size(time,2));  % positions (cartesian, absolute)
Xd = zeros(3,size(time,2)); % velocities (cartesian, absolute)
Q = zeros(4,size(time,2));  % quaternions (x,y,z,w)
RPY = zeros(3,size(time,2));
dofs = 12;
th = zeros(dofs,size(time,2)); % joint angles
thd = zeros(dofs,size(time,2)); % joint angles rates
u  = zeros(dofs,size(time,2)); % torques
%% Control loop
ti = 0; % time index
for t = 0:sim.step():tf                            % Simulation loop (6s)
    t
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
       
    % actuation PD → torque
    actuators(LF_HAA_u) = K*(-0.2 - sensors(LF_HAA_th)) + D*(0 - sensors(LF_HAA_thd));
    actuators(LF_HFE_u) = K*(0.8 - sensors(LF_HFE_th)) + D*(0 - sensors(LF_HFE_thd));
    actuators(LF_KFE_u) = K*(-1.6 - sensors(LF_KFE_th)) + D*(0 - sensors(LF_KFE_thd));
    
    actuators(RF_HAA_u) = K*(0.2 - sensors(RF_HAA_th)) + D*(0 - sensors(RF_HAA_thd));
    actuators(RF_HFE_u) = K*(0.8 - sensors(RF_HFE_th)) + D*(0 - sensors(RF_HFE_thd));
    actuators(RF_KFE_u) = K*(-1.6 - sensors(RF_KFE_th)) + D*(0 - sensors(RF_KFE_thd));

%     actuators(LH_HAA_u) = K*(-0.2 - sensors(LH_HAA_th)) + D*(0 - sensors(LH_HAA_thd));
%     actuators(LH_HFE_u) = K*(-0.8 - sensors(LH_HFE_th)) + D*(0 - sensors(LH_HFE_thd));
%     actuators(LH_KFE_u) = K*(1.6 - sensors(LH_KFE_th)) + D*(0 - sensors(LH_KFE_thd));
% 
%     actuators(RH_HAA_u) = K*(0.2 - sensors(RH_HAA_th)) + D*(0 - sensors(RH_HAA_thd));
%     actuators(RH_HFE_u) = K*(-0.8 - sensors(RH_HFE_th)) + D*(0 - sensors(RH_HFE_thd));
%     actuators(RH_KFE_u) = K*(1.6 - sensors(RH_KFE_th)) + D*(0 - sensors(RH_KFE_thd));
     
        f=1-(sin(t)/2);
%     actuators(LF_HAA_u) = K*(-0.2*f - sensors(LF_HAA_th)) + D*(0 - sensors(LF_HAA_thd));
%     actuators(LF_HFE_u) = K*(0.8*f - sensors(LF_HFE_th)) + D*(0 - sensors(LF_HFE_thd));
%     actuators(LF_KFE_u) = K*(-1.6*f - sensors(LF_KFE_th)) + D*(0 - sensors(LF_KFE_thd));
%     
%     actuators(RF_HAA_u) = K*(0.2*f - sensors(RF_HAA_th)) + D*(0 - sensors(RF_HAA_thd));
%     actuators(RF_HFE_u) = K*(0.8*f - sensors(RF_HFE_th)) + D*(0 - sensors(RF_HFE_thd));
%     actuators(RF_KFE_u) = K*(-1.6*f - sensors(RF_KFE_th)) + D*(0 - sensors(RF_KFE_thd));
% 
    actuators(LH_HAA_u) = K*(-0.2*f - sensors(LH_HAA_th)) + D*(0 - sensors(LH_HAA_thd));
    actuators(LH_HFE_u) = K*(-0.8*f - sensors(LH_HFE_th)) + D*(0 - sensors(LH_HFE_thd));
    actuators(LH_KFE_u) = K*(1.6*f - sensors(LH_KFE_th)) + D*(0 - sensors(LH_KFE_thd));

    actuators(RH_HAA_u) = K*(0.2*f - sensors(RH_HAA_th)) + D*(0 - sensors(RH_HAA_thd));
    actuators(RH_HFE_u) = K*(-0.8*f - sensors(RH_HFE_th)) + D*(0 - sensors(RH_HFE_thd));
    actuators(RH_KFE_u) = K*(1.6*f - sensors(RH_KFE_th)) + D*(0 - sensors(RH_KFE_thd));
    
    
    % Book-keeping continued
    u(:,ti) = [ actuators(LF_HAA_u); actuators(LF_HFE_u); actuators(LF_KFE_u); 
                actuators(RF_HAA_u); actuators(RF_HFE_u); actuators(RF_KFE_u); 
                actuators(LH_HAA_u); actuators(LH_HFE_u); actuators(LH_KFE_u); 
                actuators(RH_HAA_u); actuators(RH_HFE_u); actuators(RH_KFE_u) ]; 
    
    sim.actuate(actuators);                       % Run simulation step
end

%% Clean up
sim.close()                                       % Destroy simulation

p = [];
for i=1:size(Q,2)
rpy = quat2rpy(Q(4,i),Q(1,i),Q(2,i),Q(3,i)); p=[p [rpy.roll;rpy.pitch;rpy.yaw]];end
plot(time,p)


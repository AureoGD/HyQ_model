close all
clear all
clc

tic

% export LD_RUN_PATH=/home/aradulescu/OneShot/hyq_matode/matode/toolbox
% export LD_LIBRARY_P   ATH=$LD_LIBRARY_PATH:$LD_RUN_PATH

% --------------------  Initialization --------------------------------
% User defined input parameters (need to be edited)
%strfitnessfct = 'fsphere';  % name of objective/fitness function
%N = 50;               % number of objective variables/problem dimension
N = 12 * 16; %dofs * n_gaussians
task = task_hyq_selfRighting_tmp(N);
xmean= task.initgo0';
% % filename='mu9_SR_data_terrain_init_06-Jul-2016_2.mat';
% filename='mu9_SR_data_terrain_init_06-Jul-2016_1.mat';
% filename='mu6_SR_data_terrain_init_23-Aug-2016-19-16.mat';
%% mu6_SR_data_terrain_init_25-Aug-2016-12-1
%% mu6_SR_data_terrain_init_23-Aug-2016-19-16
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-16-49
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-18-25
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-12-0
%% mu6_jl_SR_data_terrain_init_30-Aug-2016-20-15

%% mu7_jl_SR_data_terrain_init_02-Sep-2016-12-8
%% mu7_jl_SR_data_terrain_init_02-Sep-2016-17-5
%% mu7_jl_SR_data_terrain_init_02-Sep-2016-19-4

%% potential %%
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-12-19
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-13-3
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-15-52
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-19-31

filename='mu7_jl_SR_data_terrain_init_01-Sep-2016-17-50.mat';
% filename = 'mu7_jl_SR_data_terrain_init_02-Sep-2016-17-5.mat';
xmean=loadPrevSol(filename);
task.startSol = xmean; %just for book-keeping
sigma = 0.03;
task.startSigma = sigma; %just for book-keeping

stopfitness = 1e-5;  % stop if fitness < stopfitness (minimization)
%stopeval = 4000;   % stop after stopeval number of function evaluations
stopeval =4000;   % stop after stopeval number of function evaluations

%% Test

% % theta=xmean;
% % tic
% % hyq_do_Rollout_right(theta,task,1);
% % toc

% Strategy parameter setting: Selection
lambda = 4+floor(3*log(N));  % population size, offspring number
mu = lambda/2;               % number of parents/points for recombination
weights = log(mu+1/2)-log(1:mu)'; % muXone array for weighted recombination
mu = floor(mu);
weights = weights/sum(weights);     % normalize recombination weights array
mueff=sum(weights)^2/sum(weights.^2); % variance-effectiveness of sum w_i x_i

% Strategy parameter setting: Adaptation
cc = (4 + mueff/N) / (N+4 + 2*mueff/N); % time constant for cumulation for C
cs = (mueff+2) / (N+mueff+5);  % t-const for cumulation for sigma control
c1 = 2 / ((N+1.3)^2+mueff);    % learning rate for rank-one update of C
cmu = min(1-c1, 2 * (mueff-2+1/mueff) / ((N+2)^2+mueff));  % and for rank-mu update
damps = 1 + 2*max(0, sqrt((mueff-1)/(N+1))-1) + cs; % damping for sigma
% usually close to 1
% Initialize dynamic (internal) strategy parameters and constants
pc = zeros(N,1); ps = zeros(N,1);   % evolution paths for C and sigma
B = eye(N,N);                       % B defines the coordinate system
D = ones(N,1);                      % diagonal D defines the scaling
C = B * diag(D.^2) * B';            % covariance matrix C
invsqrtC = B * diag(D.^-1) * B';    % C^-1/2
eigeneval = 0;                      % track update of B and D
chiN=N^0.5*(1-1/(4*N)+1/(21*N^2));  % expectation of
%   ||N(0,I)|| == norm(randn(N,1))
out.dat = []; out.datx = [];  % for plotting output

% -------------------- Generation Loop --------------------------------
counteval = 0;  % the next 40 lines contain the 20 lines of interesting code
while counteval < stopeval
    try 
        counteval
        % Generate and evaluate lambda offspring
        for k=1:lambda,
            arx(:,k) = xmean + sigma * B * (D .* randn(N,1)); % m + sig * Normal(0,C)
            %arfitness(k) = feval(strfitnessfct, arx(:,k)); % objective function call
            arfitness(k) = task.perform_rollout(task,arx(:,k)');%.*[0.0001 1 10 1 0.01]);
            counteval = counteval+1;
        end

        % Sort by fitness and compute weighted mean into xmean
        [arfitness, arindex] = sort(arfitness);  % minimization
        xold = xmean;
        xmean = arx(:,arindex(1:mu)) * weights;  % recombination, new mean value

        % Cumulation: Update evolution paths
        ps = (1-cs) * ps ...
            + sqrt(cs*(2-cs)*mueff) * invsqrtC * (xmean-xold) / sigma;
        hsig = sum(ps.^2)/(1-(1-cs)^(2*counteval/lambda))/N < 2 + 4/(N+1);
        pc = (1-cc) * pc ...
            + hsig * sqrt(cc*(2-cc)*mueff) * (xmean-xold) / sigma;

        % Adapt covariance matrix C
        artmp = (1/sigma) * (arx(:,arindex(1:mu)) - repmat(xold,1,mu));  % mu difference vectors
        C = (1-c1-cmu) * C ...                   % regard old matrix
            + c1 * (pc * pc' ...                % plus rank one update
            + (1-hsig) * cc*(2-cc) * C) ... % minor correction if hsig==0
            + cmu * artmp * diag(weights) * artmp'; % plus rank mu update

        % Adapt step size sigma
        sigma = sigma * exp((cs/damps)*(norm(ps)/chiN - 1));

        % Update B and D from C
        if counteval - eigeneval > lambda/(c1+cmu)/N/10  % to achieve O(N^2)
            eigeneval = counteval;
            C = triu(C) + triu(C,1)'; % enforce symmetry
            [B,D] = eig(C);           % eigen decomposition, B==normalized eigenvectors
            D = sqrt(diag(D));        % D contains standard deviations now
            invsqrtC = B * diag(D.^-1) * B';
        end

        % Break, if fitness is good enough or condition exceeds 1e14, better termination methods are advisable
        %     if arfitness(1) <= stopfitness || max(D) > 1e7 * min(D)
        %       break;
        %     end

        % Output
        more off;  % turn pagination off in Octave
        disp([num2str(counteval) ': ' num2str(arfitness(1)) ' ' ...
            num2str(sigma*sqrt(max(diag(C)))) ' ' ...
            num2str(max(D) / min(D))]);
        %diag(C)'
        % with long runs, the next line becomes time consuming
        out.dat = [out.dat; arfitness(1) sigma 1e5*D' ];
        out.datx = [out.datx; xmean'];
        %eig(C)
    catch
        continue
    end
end % while, end generation loop

clock_array = clock;
% save(['mu9_jump_data_' date '-' num2str(clock_array(4)) '-' num2str(clock_array(5)) '-init' num2str(inittask) '-sigma' num2str(sigmaInit) ], 'out');
filename = ['mu7_jl_SR_data_terrain_init_' date '-' num2str(clock_array(4)) '-' num2str(clock_array(5)) ];
save(filename)
toc

[X,Xd,Q,RPY,th,thd,u,des_th,des_thd, ...
   LF_foot_pos,RF_foot_pos,LH_foot_pos,RH_foot_pos, ...
   time] = hyq_do_Rollout_right_back(out.datx(end,:), task, 0);
RPYd = diff(RPY,1,2);
RPYd = [zeros(size(RPYd,1),1) , RPYd];
save(filename)

[X,Xd,Q,RPY,th,thd,u,des_th,des_thd, ...
   LF_foot_pos,RF_foot_pos,LH_foot_pos,RH_foot_pos, ...
   time] = hyq_do_Rollout_right_back(out.datx(end,:), task, 1);
% [X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right(out.datx(end,:),task,1);
% [X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right_simple(out.datx(end,:),task,1);

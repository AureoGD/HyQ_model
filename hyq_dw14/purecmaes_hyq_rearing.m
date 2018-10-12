
clear all 
close all
% --------------------  Initialization --------------------------------
% User defined input parameters (need to be edited)
%strfitnessfct = 'fsphere';  % name of objective/fitness function
tic
N = 6 * 16; %dofs * n_gaussians

task = task_hyqrearingmotion(N);
% xmean = rand(N,1);    % objective variables initial point
xmean = task.init';
% filename= 'mu9_rearTest_PD601_hyqGreen_60_data_14-Jul-2016-12-18.mat';
% filename = 'mu9_rearTest_PD601_hyqGreen_60_data_14-Jul-2016-19-1.mat'; %16% July
% xmean=loadPrevSol(filename);
task.startSol=xmean; %just for book-keeping
sigma=0.01;
task.startSigma=sigma; %just for book-keeping

%sigma = 0.00000005;          % coordinate wise standard deviation (step size)
%sigma = 0.005;  % IH #########% coordinate wise standard deviation (step size)
% sigma = 0.00005;  % IH2 #########% coordinate wise standard deviation (step size)
stopfitness = 1e-10;  % stop if fitness < stopfitness (minimization)
%stopeval = 4000;   % stop after stopeval number of function evaluations
stopeval = 3000;   % stop after stopeval number of function evaluations

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
	% Generate and evaluate lambda offspring
	parfor k=1:lambda
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
	
% 	Break, if fitness is good enough or condition exceeds 1e14, better termination methods are advisable
% 	    if arfitness(1) <= stopfitness || max(D) > 1e7 * min(D)
% 	      break;
% 	    end
	
	% Output
	more off;  % turn pagination off in Octave
	disp([num2str(counteval) ': ' num2str(arfitness(1)) ' ' ...
		num2str(sigma*sqrt(max(diag(C)))) ' ' ...
		num2str(max(D) / min(D))]);
	%diag(C)'
	% with long runs, the next line becomes time consuming
	out.dat = [out.dat; arfitness(1) sigma 1e5*D'];
	out.datx = [out.datx; xmean'];
	%eig(C)
end % while, end generation loop


clock_array = clock;
name_file= ['mu9_rearTest_PD601_hyq2max_' num2str(abs(rad2deg(task.final_RPY(2)))) '_data_' date '-' num2str(clock_array(4)) '-' num2str(clock_array(5)) ];
save(name_file);

[X,Xd,Q,RPY,th,thd,u,des_th,des_thd, ...
    LF_foot_pos,RF_foot_pos,LH_foot_pos,RH_foot_pos, ...
    time ] = hyqRearingRollout(task, out.datx(end,:),0);
RPYd = diff(RPY,1,2);
RPYd = [zeros(size(RPYd,1),1) , RPYd];

save(name_file);

[X,Xd,Q,RPY,th,thd,u,time] = hyqRearingRollout(task, out.datx(end,:),1);
% writeWholeBodyTrajectoryMsg(thetas, name_file);
% hyq joint position plotter
close all;
hyq_joint_limits = [    -1.5708, 0.5236; % haa
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

for i = 1 : size(th,1)
    figure(i) 
    plot(th(i,:)); hold on;
    aux=repmat(hyq_joint_limits(i,:)', [1,size(th(i,:),2)] );
    grid on
    plot(aux(1,:),'k-');
    plot(aux(2,:),'k-');
    axis tight
    title(['Joint ' int2str(i)]); hold off;
end


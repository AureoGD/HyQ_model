
function plotRobot(h)
    %plot robot state
    %subplot(2,1,1)
    clf
    view(3)
    hold on

    [hn(1), hn(2), hn(3), hn(4), hn(5)] = plotLegs(h, 'LF');
    [hn(6), hn(7), hn(8), hn(9), hn(10)] = plotLegs(h, 'RF');
    [hn(11), hn(12), hn(13), hn(14), hn(15)] = plotLegs(h, 'LH');
    [hn(16), hn(17), hn(18), hn(19), hn(20)] = plotLegs(h, 'RH') ;  
    axis equal
         
    %subplot(2,1,2)
    %h(13) = plot(time(i), tau(2));
    drawnow
    pause(0.01)
    %clear hn %this deletes the array
end
        
       
    
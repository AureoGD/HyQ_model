%plot_feet

plot3(LF_foot_pos(1,:),LF_foot_pos(2,:),LF_foot_pos(3,:),'b-*');hold on;
plot3(RF_foot_pos(1,:),RF_foot_pos(2,:),RF_foot_pos(3,:),'r-*');
plot3(LH_foot_pos(1,:),LH_foot_pos(2,:),LH_foot_pos(3,:),'g-*');
plot3(RH_foot_pos(1,:),RH_foot_pos(2,:),RH_foot_pos(3,:),'k-*');
axis equal; grid on;
xlabel('x');ylabel('y');zlabel('z');
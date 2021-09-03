%Code to Calculate Direct Kinematics - 2
%Evaluate the kinematic parameters
Theta=eval(robot.DH.theta);
d=eval(robot.DH.d);
a=eval(robot.DH.a);
alpha=eval(robot.DH.alpha);
%calculate homogeneous transformation matrices for every
two consecutive coordinate frames.
A01=dh(Theta(1), d(1), a(1), alpha(1))
A12=dh(Theta(2), d(2), a(2), alpha(2))

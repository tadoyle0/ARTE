%Code to Calculate Direct Kinematics - 3
A23=dh(Theta(3), d(3), a(3), alpha(3))
A34=dh(Theta(4), d(4), a(4), alpha(4))
A45=dh(Theta(5), d(5), a(5), alpha(5))
A56=dh(Theta(6), d(6), a(6), alpha(6))
%calculate the homogeneous transformation of the
tool relative to the base;
A06=A01*A12*A23*A34*A45*A56
%Draw the schematic diagram of the robot at home
position
drawrobot3d(robot,q)

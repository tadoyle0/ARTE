%Code to Calculate Direct Kinematics - 1
%Load the robot
robot = load_robot('example','stanford');
q=[-pi/2,-pi/2,0,0,0,0]'; %Home position of the robot
%Define the kinematic parameters
robot.DH.theta ='[q(1) q(2) -pi/2 q(4) q(5) q(6)]';
robot.DH.d='[0.412 0.154 q(3) 0 0 0.263]';
robot.DH.a='[0 0 0 0 0 0]';
robot.DH.alpha='[-pi/2 pi/2 0 -pi/2 pi/2 0]';

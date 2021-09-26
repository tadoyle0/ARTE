%% Code to Calculate Direct Kinematics - 1
close all;clear all;clc
init_lib
%Load the robot
robot = load_robot
q = [0  0 0   pi/2    -pi/2   0]; %Home position of the robot
%Define the kinematic parameters
robot.DH.theta= '[q(1)   q(2)-pi/2      q(3)       q(4)+pi/2      q(5)      q(6)]';   %%z from last
robot.DH.d=     '[0.3       0            0           1.7         -0.03      0.075]';
robot.DH.a=     '[0         1.5         0.13          0           0          0]';
robot.DH.alpha= '[-pi/2      0          -pi/2        pi/2        -pi/2       0]';%x from lasr 


%% Code to Calculate Direct Kinematics - 2
%Evaluate the kinematic parameters
Theta=eval(robot.DH.theta);
d=eval(robot.DH.d);
a=eval(robot.DH.a);
alpha=eval(robot.DH.alpha);
%calculate homogeneous transformation matrices for every
%two consecutive coordinate frames.
A01 = dh(Theta(1), d(1), a(1), alpha(1))
A12 = dh(Theta(2), d(2), a(2), alpha(2))
 
%% Code to Calculate Direct Kinematics - 3
A23 = dh(Theta(3), d(3), a(3), alpha(3))
A34 = dh(Theta(4), d(4), a(4), alpha(4))
A45 = dh(Theta(5), d(5), a(5), alpha(5))
A56 = dh(Theta(6), d(6), a(6), alpha(6))
%calculate the homogeneous transformation of the
%tool relative to the base;
A06 = A01*A12*A23*A34*A45*A56  %composite homogeneous trans matrix
%Draw the schematic diagram of the robot at home position
drawrobot3d(robot,q)

%%

echo off
%robot=load_robot('Team Ultra Help Desk', 'TUHD'); %Load robot
%drawrobot3d(robot, q) %Draw the robot
adjust_view(robot);
fprintf('\nNOW LOAD AUXILIAR EQUIPMENT')
robot.equipment{1}=load_robot('equipment', 'bumper_cutting'); %Load the Auxiliary

drawrobot3d(robot, q) % Draw the Auxiliary Equipment
robot.tool=load_robot('equipment/end_tools', 'parallel_gripper_0'); % Load a gripper
drawrobot3d(robot, q) % Draw the gripper
robot.tool_activated=1;
drawrobot3d(robot,q) %Draw the gripper
robot.tool=load_robot('equipment/end_tools', 'vacuum_2'); % A different tool
drawrobot3d(robot,q);
teach
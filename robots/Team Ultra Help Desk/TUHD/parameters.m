%----------------------------------------------------
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   PARAMETERS Returns a data structure containing the parameters of the
% %   Team Ultra Help Desk Robot.
% %
% %   Authors: Joe "The Waz" Waskiw, Thomas "Fusion" Doyle, Sol "Kinematic" Rainbow, Neasan "Lesgooo" Sofaea,
% %   Matthew 'the GOAT' McGregor, Henry "Hard-Working" Mitchell. 
% %   email: tad589@uowmail.edu.au
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Copyright (C) 2012, by Arturo Gil Aparicio
%
% This file is part of ARTE (A Robotics Toolbox for Education).
% 
% ARTE is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% ARTE is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with ARTE.  If not, see <http://www.gnu.org/licenses/>.
function robot = parameters()

robot.name= 'TUHD';
%home posi
robot.q =        '[0;      0;          0;          pi/2;         -pi/2;        0]';

robot.DH.theta= '[q(1)   q(2)-pi/2      q(3)       q(4)+pi/2      q(5)      q(6)]';   %%z from last
robot.DH.d=     '[0.3       0            0           1.7         -0.03      0.075]';
robot.DH.a=     '[0         1.5         0.13          0           0          0]';
robot.DH.alpha= '[-pi/2      0          -pi/2        pi/2        -pi/2       0]';%x from lasr
robot.J=[];                                                                  
                                                        

robot.inversekinematic_fn = 'inversekinematic_MH12(robot, T)'; %need to change this
robot.directkinematic_fn = 'directkinematic(robot, q)'; %assign this


%number of degrees of freedom
robot.DOF = 6;

%6 revolutes
robot.kind=['R' 'R' 'R' 'R' 'R' 'R'];

%minimum and maximum rotation angle in rad  %HAVE BEEN CHANGED TO SUIT
robot.maxangle =[deg2rad(-110) deg2rad(110); %Axis 1, minimum, maximum
                deg2rad(-20) deg2rad(80); %Axis 2, minimum, maximum
                deg2rad(-70) deg2rad(80); %Axis 3
                deg2rad(-180) deg2rad(180); %Axis 4: Unlimited (400� default)
                deg2rad(-130) deg2rad(130); %Axis 5
                deg2rad(-800) deg2rad(800)]; %Axis 6: Really Unlimited to (800� default)

%maximum absolute speed of each joint rad/s or m/s 
robot.velmax = [deg2rad(220); %Axis 1, rad/s
                deg2rad(200); %Axis 2, rad/s
                deg2rad(220); %Axis 3, rad/s
                deg2rad(410); %Axis 4, rad/s
                deg2rad(410); %Axis 5, rad/s
                deg2rad(610)];%Axis 6, rad/s
    
robot.accelmax=robot.velmax/0.1; % 0.1 is here an acceleration time
            
% end effectors maximum velocity
robot.linear_velmax = 2.5; %m/s


%base reference system
robot.T0 = eye(4);


%INITIALIZATION OF VARIABLES REQUIRED FOR THE SIMULATION
%position, velocity and acceleration
robot=init_sim_variables(robot);
robot.path = pwd;


% GRAPHICS
robot.graphical.has_graphics=1;
robot.graphical.color = [255 102 51]./255;
%for transparency
robot.graphical.draw_transparent=1;
%draw DH systems
robot.graphical.draw_axes=1;
%DH system length and Font size, standard is 1/10. Select 2/20, 3/30 for
%bigger robots
robot.graphical.axes_scale=1;
%adjust for a default view of the robot
robot.axis=[-0.75 0.9 -0.75 0.75 0 2.1]; % *****change this for a wider initial view 
%read graphics files
robot = read_graphics(robot);



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % DYNAMIC PARAMETERS
% %   WARNING! These parameters do not correspond to the actual IRB 140
% %   robot. They have been introduced to demonstrate the necessity of 
% %   simulating the robot and should be used only for educational purposes
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% robot.has_dynamics=1;
% 
% %consider friction in the computations
% robot.dynamics.friction=0;
% 
% %link masses (kg)
% robot.dynamics.masses=[8 7 5 4 2 1]; % NO HAY DATOS DE MASAS.
% 
% %COM of each link with respect to own reference system
% robot.dynamics.r_com=[0       0          0; %(rx, ry, rz) link 1
%                      -0.05	 0.006	 0.1; %(rx, ry, rz) link 2
%                     -0.0203	-0.0141	 0.070;  %(rx, ry, rz) link 3
%                      0       0.019       0;%(rx, ry, rz) link 4
%                      0       0           0;%(rx, ry, rz) link 5
%                      0       0         0.032];%(rx, ry, rz) link 6
% 
% %Inertia matrices of each link with respect to its D-H reference system.
% % Ixx	Iyy	Izz	Ixy	Iyz	Ixz, for each row
% robot.dynamics.Inertia=[0      0.35	0   	0	0	0;
%     .13     .524	.539	0	0	0;
%     .066	.086	.0125	0	0	0;
%     1.8e-3	1.3e-3	1.8e-3	0	0	0;
%     .3e-3	.4e-3	.3e-3	0	0	0;
%     .15e-3	.15e-3	.04e-3	0	0	0];
% 
% 
% 
% robot.motors=load_motors([5 5 5 4 4 4]);
% %Speed reductor at each joint
% robot.motors.G=[300 300 300 300 300 300];







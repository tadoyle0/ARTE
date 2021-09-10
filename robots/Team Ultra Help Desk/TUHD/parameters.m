% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   PARAMETERS Returns a data structure containing the parameters of the
% %   Team Ultra Help Desk Robot.
% %
% %   Authors: Joe Waskiw("The Waz"), Thomas Doyle, Sol Rainbow, Neasan Sofaea,
% %   Matthew McGregor, Henry Mitchell. 
% %   email: tad589@uowmail.edu.au
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % Copyright (C) 2021, by Thomas Doyle
% %
% % This file is part of ARTE (A Robotics Toolbox for Education).
% % 
% % ARTE is free software: you can redistribute it and/or modify
% % it under the terms of the GNU Lesser General Public License as published by
% % the Free Software Foundation, either version 3 of the License, or
% % (at your option) any later version.
% % 
% % ARTE is distributed in the hope that it will be useful,
% % but WITHOUT ANY WARRANTY; without even the implied warranty of
% % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% % GNU Lesser General Public License for more details.
% % 
% % You should have received a copy of the GNU Leser General Public License
% % along with ARTE.  If not, see <http://www.gnu.org/licenses/>.
% 
% % Nos hemos basado en el parameters.m del robot IRB140 por ser un robot muy
% % similar
% function robot = parameters()
% 
% 
% robot.name= 'TUHD';
% 
% %Path where everything is stored for this robot
% robot.path = 'robots/Team Ultra Help Desk/TUHD';
% 
% % robot.DH.theta= '[q(1)  q(2)     q(3)      q(4)      q(5)]';
% % robot.DH.d=     '[.300      .5      0       0        0 ]';
% % robot.DH.a=     '[0        .50      0       0        0 ]'           ;
% % robot.DH.alpha= '[pi/2        0      0        0        0  ]';
% % robot.J=[];
% 
% %work in progress - stuck at here                         ......
% %robot.DH.theta= '[q(1)     q(2)-pi/2         q(3)-pi/2     q(4)         q(5) ]';
% %robot.DH.d='     [0.300      0                  0           0            0  ]';
% %robot.DH.a='     [ 0         1.                 1.         .5            .5  ]';
% %robot.DH.alpha= '[-pi/2       0                 pi         pi/2        -pi/2]';
% %robot.J=[];
% %                              deleted pi/2 off q2 ..
% % robot.DH.theta= '[q(1)     q(2)-pi/2        q(3)      q(4)      q(5) ]';
% % robot.DH.d=     '[0.3      0.00          .03           0.200        .070 ]';
% % robot.DH.a=     '[0        1.5          1.470           0         0 ]';
% % robot.DH.alpha= '[-pi/2     0            pi/2           pi/2     -pi/2 ]';
% % robot.J=[];
% 
% robot.DH.theta= '[q(1)      q(2)-pi/2     q(3)        q(4)     q(5)   q(6)]';
% robot.DH.d='     [0.300      0.00         0           1.5       0      0]';
% robot.DH.a='     [0          1.5          .130           0       0     0]';
% robot.DH.alpha= '[-pi/2      0            -pi/2       pi/2     -pi/2   0]';
% robot.J=[];
% robot.inversekinematic_fn = 'inversekinematic_irb52(robot, T)';
% 
% % motoman
% % robot.DH.theta= '[q(1)    q(2)-pi/2   q(3)     q(4)        q(5) ]';
% % robot.DH.d=     '[0.300    0            0       0.5        .5 ]';
% % robot.DH.a=     '[0        1.5          1.5        0.5      .5 ]';
% % robot.DH.alpha= '[-pi/2     0           0      pi/2         -pi/2 ]';
% % robot.J=[];
% 
% %number of degrees of freedom
% robot.DOF = 5;
% 
% %rotational: 0, translational: 1
% robot.kind=['R' 'R' 'R' 'R' 'R'];
% 
% %minimum and maximum rotation angle in rad
% robot.maxangle =[-pi pi; %Axis 1, minimum, maximum
%                 deg2rad(-63) deg2rad(110); %Axis 2, minimum, maximum
%                 deg2rad(-235) deg2rad(55); %Axis 3
%                 deg2rad(-200) deg2rad(200); %Axis 4: Unlimited (400� default)
%                 deg2rad(-115) deg2rad(115)]; %Axis 5
%                 %deg2rad(-400) deg2rad(400)]; %Axis 6: Unlimited (800� default)
% 
% %maximum absolute speed of each joint rad/s or m/s
% robot.velmax = [deg2rad(180); %Axis 1, rad/s
%                 deg2rad(180); %Axis 2, rad/s
%                 deg2rad(180); %Axis 3, rad/s
%                 deg2rad(320); %Axis 4, rad/s
%                 deg2rad(400)]; %Axis 5, rad/s
%                 %deg2rad(460)];%Axis 6, rad/s
%        
% robot.accelmax=robot.velmax/0.1; % 0.1 is here an acceleration time
%             
% % end effectors maximum velocity
% robot.linear_velmax = 2.5; %m/s
% 
% %base reference system
% robot.T0 = eye(4);
% 
% %INITIALIZATION OF VARIABLES REQUIRED FOR THE SIMULATION
% %position, velocity and acceleration
% robot=init_sim_variables(robot);
% 
% % GRAPHICS
% robot.graphical.has_graphics=1;
% robot.graphical.color = [1 0.2 0]; % Color parecido al del robot
% %for transparency
% robot.graphical.draw_transparent=0;
% %draw DH systems
% robot.graphical.draw_axes=1;
% %DH system length and Font size, standard is 1/10. Select 2/20, 3/30 for
% %bigger robots
% robot.graphical.axes_scale=1;
% %adjust for a default view of the robot
% robot.axis=[-2 2 -2 2 0 2];
% %read graphics files
% robot = read_graphics(robot);
% 
% %DYNAMICS
% robot.has_dynamics=0;




%----------------------------------------------------
% NEW VERSION 2.0 USE THIS ONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PARAMETERS Returns a data structure containing the parameters of the
%   MOTOMAN MH12.
%
%   Author: Andres Garrido. Universidad Miguel Hernandez de Elche. 
%   email: andres.garrido@alu.umh.es date:   30/11/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% robot.DH.theta= '[q(1) q(2)-pi/2 q(3) q(4) q(5) q(6)]';
% robot.DH.d='[0.450 0.00 0 0.640 0 0.100]';
% robot.DH.a='[0.155 0.614 0.200 0 0 0]';
% robot.DH.alpha= '[-pi/2 0 -pi/2 pi/2 -pi/2 0]';
% robot.J=[];

robot.DH.theta= '[q(1)      q(2)-pi/2     q(3)        q(4)     q(5)   q(6)]';
robot.DH.d='     [0.300      0.00         0           1.5       0        0.2 ]';
robot.DH.a='     [0          1.5          .130           0      0        0]';
robot.DH.alpha= '[-pi/2      0            -pi/2       pi/2     -pi/2      0]';
robot.J=[];                                                                     

robot.inversekinematic_fn = 'inversekinematic_MH12(robot, T)';
robot.directkinematic_fn = 'directkinematic(robot, q)';


%number of degrees of freedom
robot.DOF = 6;

%rotational: 0, translational: 1
robot.kind=['R' 'R' 'R' 'R' 'R' 'R'];

%minimum and maximum rotation angle in rad
robot.maxangle =[deg2rad(-170) deg2rad(170); %Axis 1, minimum, maximum
                deg2rad(-90) deg2rad(155); %Axis 2, minimum, maximum
                deg2rad(-175) deg2rad(240); %Axis 3
                deg2rad(-180) deg2rad(180); %Axis 4: Unlimited (400� default)
                deg2rad(-135) deg2rad(135); %Axis 5
                deg2rad(-360) deg2rad(360)]; %Axis 6: Really Unlimited to (800� default)

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
robot.axis=[-0.75 0.9 -0.75 0.75 0 2.1];
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



%%%%%%%%% dont change below stuff:
% robot.DH.theta= '[q(1)      q(2)-pi/2     q(3)        q(4)     q(5)   q(6)]';
% robot.DH.d='     [0.300      0.00         0           1.5       0        0.2 ]';
% robot.DH.a='     [0          1.5          .130           0      0        0]';
% robot.DH.alpha= '[-pi/2      0            -pi/2       pi/2     -pi/2      0]';
% robot.J=[];                                                                     



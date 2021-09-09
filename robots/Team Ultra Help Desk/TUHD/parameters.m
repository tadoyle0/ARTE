%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PARAMETERS Returns a data structure containing the parameters of the
%   Team Ultra Help Desk Robot.
%
%   Authors: Joe Waskiw("The Waz"), Thomas Doyle, Sol Rainbow, Neasan Sofaea,
%   Matthew McGregor, Henry Mitchell. 
%   email: tad589@uowmail.edu.au
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Copyright (C) 2021, by Thomas Doyle
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

% Nos hemos basado en el parameters.m del robot IRB140 por ser un robot muy
% similar
function robot = parameters()


robot.name= 'TUHD';

%Path where everything is stored for this robot
robot.path = 'robots/Team Ultra Help Desk/TUHD';

%robot.DH.theta= '[q(1)  q(2)     q(3)      q(4)      q(5)]';
%robot.DH.d=     '[0          0      0       0        0 ]';
%robot.DH.a=     '[0            0     0      0        0 ]'           ;
%robot.DH.alpha= '[0        0       0         0         0  ]';
%robot.J=[];

%work in progress - stuck at here                         ......
%robot.DH.theta= '[q(1)     q(2)-pi/2         q(3)-pi/2     q(4)         q(5) ]';
%robot.DH.d='     [0.300      0                  0           0            0  ]';
%robot.DH.a='     [ 0         1.                 1.         .5            .5  ]';
%robot.DH.alpha= '[-pi/2       0                 pi         pi/2        -pi/2]';
%robot.J=[];

robot.DH.theta= '[q(1)     q(2)-pi/2    q(3)       q(4)      q(5) ]';
robot.DH.d=     '[0.3      0.00          .03       0.200        .070 ]';
robot.DH.a=     '[0        1.5          1.470       0         0 ]';
robot.DH.alpha= '[-pi/2     0           -pi/2       pi/2     -pi/2 ]';
robot.J=[];

%robot.inversekinematic_fn = 'inversekinematic_irb52(robot, T)';

%number of degrees of freedom
robot.DOF = 5;

%rotational: 0, translational: 1
robot.kind=['R' 'R' 'R' 'R' 'R'];

%minimum and maximum rotation angle in rad
robot.maxangle =[-pi pi; %Axis 1, minimum, maximum
                deg2rad(-63) deg2rad(110); %Axis 2, minimum, maximum
                deg2rad(-235) deg2rad(55); %Axis 3
                deg2rad(-200) deg2rad(200); %Axis 4: Unlimited (400� default)
                deg2rad(-115) deg2rad(115)]; %Axis 5
                %deg2rad(-400) deg2rad(400)]; %Axis 6: Unlimited (800� default)

%maximum absolute speed of each joint rad/s or m/s
robot.velmax = [deg2rad(180); %Axis 1, rad/s
                deg2rad(180); %Axis 2, rad/s
                deg2rad(180); %Axis 3, rad/s
                deg2rad(320); %Axis 4, rad/s
                deg2rad(400)]; %Axis 5, rad/s
                %deg2rad(460)];%Axis 6, rad/s
       
robot.accelmax=robot.velmax/0.1; % 0.1 is here an acceleration time
            
% end effectors maximum velocity
robot.linear_velmax = 2.5; %m/s

%base reference system
robot.T0 = eye(4);

%INITIALIZATION OF VARIABLES REQUIRED FOR THE SIMULATION
%position, velocity and acceleration
robot=init_sim_variables(robot);

% GRAPHICS
robot.graphical.has_graphics=1;
robot.graphical.color = [1 0.2 0]; % Color parecido al del robot
%for transparency
robot.graphical.draw_transparent=0;
%draw DH systems
robot.graphical.draw_axes=1;
%DH system length and Font size, standard is 1/10. Select 2/20, 3/30 for
%bigger robots
robot.graphical.axes_scale=1;
%adjust for a default view of the robot
robot.axis=[-2 2 -2 2 0 2];
%read graphics files
robot = read_graphics(robot);

%DYNAMICS
robot.has_dynamics=0;
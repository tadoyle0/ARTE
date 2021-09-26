init_lib %initialise library
robot = load_robot('Team Ultra Help Desk', 'TUHD') %load TUHD
robot.tool= load_robot('equipment', 'end_tools/parallel_gripper_0') %load gripper
teach % open teach panel
adjust_view(robot) %adjust view prompt 
home = [[1.7750, 0.0313, 1.9600],[0.6062, 0.3532, 0.6126, 0.3640], [0, 1, -1, 1], [9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
pickup1 = [[-0.2697, -0.8774, 0.0423],[0.0944, 0.7119, 0.6755, -0.1673], [0, 1, 0, 6], [9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
tool0 = [1,0,0,0.125,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
pickup2=[[-0.2643, 1.0291, 0.5214],[0.2419, 0.7926, -0.4974, -0.2567], [1, -1, 0, 0], [9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
MoveL(pickup1,'vmax','fine',tool0, 'wobj0');
simulation_open_tool
MoveL(pickup2,'vmax','fine',tool0, 'wobj0');
simulation_close_tool
MoveL(home,'vmax','fine',tool0, 'wobj0');
simulation_close_tool



clear all;
clf
clc;

%% Plot the environment
OperatingRobot.PlotEnvironment()
hold on
%% Plot the LinearUR3 and the gripper

% Call the LinearUR3
r = LinearUR3 (transl(0,0,0)*trotx(pi/2));
hold on 

% Take the base of end-effector 
qNow = r.model.getpos();
base = r.model.fkineUTS(qNow);


%Call the gripper with 2 fingers and plot the calculated base 
finger1 = LinearFinger(base*trotx(pi/2)); 

finger2 = LinearFinger(base*troty(pi)*trotx(-pi/2));


%% Plot the Working volume
h = OperatingRobot.PlotVolume(r,1,'red');

%% Place the bricks 
%brick{i} = [x y 0] %brick{i}arm = [x y z+0.15]
brick1 = [0.3 0 0];
brick1Arm = [0.3 0 0.15]; %z+0.15
brick1EndArm = [-0.35 0 0.15]; %-x and z+0.15

brick2 = [0.3 0.1765 0];
brick2Arm = [0.3 0.1765 0.15];
brick2EndArm = [-0.35 0.1465 0.15];

brick3 = [0.3 0.353 0];
brick3Arm = [0.3 0.353 0.15];
brick3EndArm = [-0.35 0.293 0.15];

brick4 = [0.417 0 0];
brick4Arm = [0.417 0 0.15];
brick4EndArm = [-0.35 0 0.1815];

brick5 = [0.417 0.1765 0];
brick5Arm = [0.417 0.1765 0.15];
brick5EndArm = [-0.35 0.1465 0.1815];

brick6 = [0.417 0.353 0];
brick6Arm = [0.417 0.353 0.15];
brick6EndArm = [-0.35 0.293 0.1815];

brick7 = [0.534 0 0];
brick7Arm = [0.534 0 0.15];
brick7EndArm = [-0.35 0 0.213];

brick8 = [0.534 0.1765 0];
brick8Arm = [0.534 0.1765 0.15];
brick8EndArm = [-0.35 0.1465 0.213];

brick9 = [0.534 0.353 0];
brick9Arm = [0.534 0.353 0.15];
brick9EndArm = [-0.35 0.293 0.213];

%% Plot 9 bricks
[h1, h2, h3, h4, h5, h6, h7, h8, h9] = OperatingRobot.PlotBrick(brick1, brick2, brick3, brick4, brick5, brick6, brick7, brick8, brick9);

%% A set of joints guess for ikcon to reach the 4th to 9th brick
elbowDownLong = deg2rad([0 180 -90 0 0 90 0]);

%A set of joints guess for picking the brick
elbowDown = deg2rad([0 180 -90 0 0 90 0]);

%A set of joints guess for dropping the brick
elbowDownEnd= deg2rad([0 180 60 30 0 -90 0]);

%A set of joints guess for dropping the brick 9
elbowDown9 = deg2rad([0 0 -90 0 0 90 0]);

%% Move to first brick

qTraj = OperatingRobot.CreateTraj(r, brick1Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Picking the 1st brick and move it 

qTraj = OperatingRobot.CreateTraj(r, brick1EndArm,elbowDownEnd);

%Delete the initial brick
try delete(h1); 
catch ME
end

OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick1);

%% Move to 2nd brick position after dropping 1st brick

qTraj = OperatingRobot.CreateTraj(r, brick2Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Grasp 2nd brick
qTraj = OperatingRobot.CreateTraj(r, brick2EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h2); 
catch ME
end
OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick2);

%% Move to 3rd brick position after dropping 2nd brick

qTraj = OperatingRobot.CreateTraj(r, brick3Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);


%% Grasp 3rd brick and Move it
qTraj = OperatingRobot.CreateTraj(r, brick3EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h3);
catch ME
end
OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick3);

%% Move to 4th brick position after dropping 3rd brick

qTraj = OperatingRobot.CreateTraj(r, brick4Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Grasp 4th brick and move it

qTraj = OperatingRobot.CreateTraj(r, brick4EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h4); 
catch ME
end

OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick4);
%% Move to 5th brick position after dropping 4th brick

qTraj = OperatingRobot.CreateTraj(r, brick5Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);
%% Grasp 5th brick and move it 

qTraj = OperatingRobot.CreateTraj(r, brick5EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h5); 
catch ME
end

OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick5);


%% Move to 6th brick position after dropping 5th brick

qTraj = OperatingRobot.CreateTraj(r, brick6Arm, elbowDown);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);
%% Grasp 6th brick and move it

qTraj = OperatingRobot.CreateTraj(r, brick6EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h6);
catch ME
end
OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick6);
%% Move to 7th brick position after dropping 6th brick

qTraj = OperatingRobot.CreateTraj(r, brick7Arm, elbowDownLong);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Grasp 7th brick

qTraj = OperatingRobot.CreateTraj(r, brick7EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h7); 
catch ME
end
OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick7);

%% Move to 8th brick position after dropping 7th brick

qTraj = OperatingRobot.CreateTraj(r, brick8Arm, elbowDownLong);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);
%% Grasp 8th brick
qTraj = OperatingRobot.CreateTraj(r, brick8EndArm, elbowDownEnd);

%Delete the initial brick
try delete(h8); 
catch ME
end
OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick8);

%% Move to 9th brick position after dropping 8th brick

qTraj = OperatingRobot.CreateTraj(r, brick9Arm, elbowDownLong);

OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Grasp 9th brick

qTraj = OperatingRobot.CreateTraj(r, brick9EndArm, elbowDown9);

%Delete the initial brick
try delete(h9);
catch ME
end

OperatingRobot.PlotPose(r,qTraj,5,finger1,finger2,brick9);





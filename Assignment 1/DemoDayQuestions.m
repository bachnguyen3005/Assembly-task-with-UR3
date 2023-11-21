clf;
clear all
clc


%% 1. Give an end-effector pose. Determine a joint state

t = [-0.3-0.3 0.2];

T1 = transl(t);

jointState = r.model.ikine(T)

%% 2. Move the robot to required joint state
steps = 100;

qNow = r.model.getpos();

qtraj = jtraj(qNow, jointState, steps);

for i = 1: steps

    q  = qtraj(i,:);
    r.model.animate(q);
    pause(0.01);
end

%% This will also move the gripper with the robot
qTraj = OperatingRobot.CreateTraj(r, t, elbowDownEnd);
OperatingRobot.MoveToBrick(r,qTraj,finger1,finger2);

%% Provide evidence that the joint states satisfy the given pose within +-5mm

qNow = r.model.getpos();

T2 = transl(r.model.fkineUTS(qNow))


error = abs(t'-T2)*100 %In percentage

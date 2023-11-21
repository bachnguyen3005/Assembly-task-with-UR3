function CloseFinger(f1,f2)
%Take the current position of the gripper's links
q_finger1 = [0 0];
q_finger2 = [0 0];
%Set the end position for the gripper to close
q_finger1_end = deg2rad([20 0]);
q_finger2_end = deg2rad([20 0]);
%Create the set of joints
q_finger_traj = jtraj(q_finger1,q_finger1_end,100);
q_finger_traj2 = jtraj(q_finger2,q_finger2_end,100);
%Animate that by putting into the for loop
for i = 1:size(q_finger_traj,1)
    f1.model.animate(q_finger_traj(i,:));
    f2.model.animate(q_finger_traj2(i,:));
    pause(0.01);
end

end
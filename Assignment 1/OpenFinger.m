function OpenFinger(f1,f2)
q_finger1 = f1.model.getpos();
q_finger2 = f2.model.getpos();
q_finger1_end = deg2rad([0 0]);
q_finger2_end = deg2rad([0 0]);
q_finger_traj = jtraj(q_finger1,q_finger1_end,100);
q_finger_traj2 = jtraj(q_finger1,q_finger2_end,100);
for i = 1:size(q_finger_traj,1)
    f1.model.animate(q_finger_traj(i,:));
    f2.model.animate(q_finger_traj2(i,:));
    pause(0.01);
end
end
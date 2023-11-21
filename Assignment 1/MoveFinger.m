function MoveFinger(robot,q,finger1,finger2,i)
    
    q_f1 = finger1.model.getpos();
    q_f2 = finger2.model.getpos();
    q_f1_end = deg2rad([25 0]);
    q_f2_end = deg2rad([25 0]);
    q_f1_traj = jtraj(q_f1,q_f1_end,100);
    q_f2_traj = jtraj(q_f2,q_f2_end,100);
    base = robot.model.fkineUTS(q);

    finger1.model.base=base*trotx(pi/2);
     
    finger1.model.animate(q_f1_traj(i,:)); 
   
    finger2.model.base=base*troty(pi)*trotx(-pi/2);

    finger2.model.animate(q_f2_traj(i,:));
 
end
function  MoveToBrick(r,qTraj,finger1,finger2)

for i = 1:size(qTraj,1)
    q = qTraj(i,:);
    r.model.animate(q);
    MoveFinger(r,q,finger1,finger2,i);     
    pause(0.01)   
end

end
function [qtrajec] = CreateTraj(robot,brickPosition,jointGuess)

steps = 100;

qNow = robot.model.getpos();

T = transl(brickPosition)*trotx(pi)*troty(0)*trotz(0);

qMove = wrapToPi(robot.model.ikcon(T,jointGuess));

qtrajec = jtraj(qNow,qMove,steps);

end
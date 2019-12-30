function xNew = myFindNextPos1(x,delt)
    x_dot = zeros(size(x))
    xNew = x_dot;
    A = [-2 0;0 -2]; %type 1:star
%     A = [-2 -1;2 -6]; %type 2:node
%     A = [-2 0;0 1.5];%type 1:saddle point
%     A = [0 1;-1 0];  %type 1:center
%    A = [-8 50;-50 -8];  %type 1:focus
    x_dot = A*x
    xNew = x + x_dot*delt;
    return;
end
function xNew = myFindNextPos2(A,x,delt)
    x_dot = zeros(size(x));
    xNew = x_dot;
    x_dot = A*x;
    xNew = x + x_dot*delt;
    return;
end


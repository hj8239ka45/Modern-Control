function xNew = myFindNextPos2_u(A,x,delt,B,u)
    x_dot = zeros(size(x))
    xNew = x_dot;
    ut = B*u
    x_dot = A*x+ut
    xNew = x + x_dot*delt;
    return;
end


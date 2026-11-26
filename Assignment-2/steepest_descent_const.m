%Filippos Kanlis 9829
%Steepest Descent With Constant Gamma
function [xk,n] = steepest_descent_const(f,epsilon,gamma,X)

%n: number of iterations
%X: x0,y0 pair of starting point
d = []; 
k = 1;
xk = X; 
gradient_f = gradient(f); 

while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
    d = [d -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))]
    xk_new = xk(:,k) + gamma * d(:,k);
    xk = [xk xk_new]; 
    k = k + 1;
end
n = k - 1 ;

end


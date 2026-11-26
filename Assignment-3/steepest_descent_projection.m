%Filippos Kanlis 9829
%Steepest Descent With Constant Gamma
function [xk,n] = steepest_descent_projection(f,epsilon,gamma,X,sk)

%n: number of iterations
%X: x0,y0 pair of starting point
maxloops = 110; 
k = 1;
xk = X; 
gradient_f = gradient(f); 
variables=symvar(gradient_f); %creates an array with variables x1,x2

while (norm(double(subs(gradient_f,variables,xk(:,k)'))) > epsilon && k <= maxloops)
    xk_new=xk(:,k)+gamma*(provoli(xk(:,k)-(sk*double(subs(gradient_f,variables,xk(:,k)'))))-xk(:,k));
    xk = [xk xk_new]; 
    k = k + 1;
end
n = k - 1 ;

end


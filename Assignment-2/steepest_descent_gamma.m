%Filippos Kanlis 9829
%Steepest Descent With Variable Gamma
function [xk,n] = steepest_descent_gamma(f,epsilon,~,X)

%n: number of iterations
%X: x0,y0 pair of starting point

d = [];
k = 1; 
xk = X;
gradient_f = gradient(f); 

syms gamma_value
       
while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
 d = [d -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))];
 func_min(gamma_value) = f(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));
  gamma = gold_sect(func_min,0.001,0,1);
  xk_new = xk(:,k) + gamma * d(:,k);
  xk = [xk xk_new];
  k = k + 1;
end
n = k - 1 ;
end


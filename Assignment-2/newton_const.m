%Filippos Kanlis 9829
%Newton Method With Constant Gamma
function [xk,n] = newton_const(f,epsilon,gamma,X)

%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);

while ((norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'})))) > epsilon)
            
         grad_matrix = double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
         hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
         d = [d -hess_matrix\grad_matrix];
         xk_new = xk(:,k) + gamma * d(:,k);
         xk = [xk xk_new];
         k = k + 1;
end
n = k - 1;
end


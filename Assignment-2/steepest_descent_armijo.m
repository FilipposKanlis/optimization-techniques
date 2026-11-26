%Filippos Kanlis 9829
%Steepest Descent Using Armijo Rule for Gamma
function [xk,n] = steepest_descent_armijo(f,epsilon,gamma,X)

%n: number of iterations
%X: x0,y0 pair of starting point

d = []; 
k = 1; 
xk = X;

gradient_f = gradient(f);
  mk = 0;
        a = 2*10^(-3);
        b = 1/4;
        s = gamma * b^mk;
        

while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
        d = [d -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))];
        fkp = double(f(xk(1,k),xk(2,k)));
        grad_matrix = double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
        
        while (fkp - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k)))...
                < -a * b^mk * s * d(:,k)' * grad_matrix)
            mk = mk + 1;
            gamma = s * b^mk;
        end

        xk_new = xk(:,k) + gamma * d(:,k);
        xk = [xk xk_new];
        k = k + 1;
        mk = 0;
        gamma = s * b^mk;
end     
n = k - 1;
end


%Filippos Kanlis 9829
%Levenberg-Marquardt Using Armijo Rule for Gamma

function [xk,n] = lev_marq_armijo(f,epsilon,gamma,X)

%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);


mk = 0;
a = 2*10^(-3);
b = 1/4;
s = gamma * b^mk;
        
      
while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
    
    hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
    eigen_values = eig(hess_matrix);
    if (sum(eigen_values < 0) > 0)
        uk = max(abs(eigen_values))+0.2;
    end
    A = hess_matrix + uk*eye(2);
    B = -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
    d = [d linsolve(A,B)];
    fxk = double(f(xk(1,k),xk(2,k)));
    while (fxk - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k))) < -a * b^mk * s * d(:,k)' * (-B))
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


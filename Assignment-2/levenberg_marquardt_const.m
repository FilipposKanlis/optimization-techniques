%Filippos Kanlis 9829
%Levenberg-Marquardt With Constant Gamma

function [xk,n] = levenberg_marquardt_const(f,epsilon,gamma,X)

%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);

while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
        hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
        eigen_values = eig(hess_matrix);
        if (sum(eigen_values < 0) > 0)
            uk = max(abs(eigen_values))+0.2;
        end
        A = hess_matrix + uk*eye(2);
        B = -double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
        d = [d linsolve(A,B)];
        xk_new = xk(:,k) + gamma * d(:,k);
        xk = [xk xk_new];
        k = k + 1;
end
n = k -1;
end



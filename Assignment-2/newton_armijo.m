%Filippos Kanlis 9829
%Newton Method for Armijo Rule

function [xk,n] = newton_armijo(f,epsilon,gamma,X)
%X = x0,y0 pair of starting point
%n: number of iterations

d = []; 
k = 1;
xk = X;

gradient_f = gradient(f);
hess_f = hessian(f);
max_step = 100;

mk = 0;
a = 2*10^(-3);
b = 1/4;
s = gamma * b^mk;

while (norm(double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}))) > epsilon)
            
  grad_matrix = double(subs(gradient_f,symvar(gradient_f),{xk(:,k)'}));
  hess_matrix = double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
  d = [d -hess_matrix\grad_matrix];
  fx_k = double(f(xk(1,k),xk(2,k)));
  
  while (fx_k - double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k))) < -a * b^mk * s * d(:,k)' * grad_matrix)
     mk = mk + 1;
     gamma = s * b^mk;
  end
           
  xk_new = xk(:,k) + gamma * d(:,k);
  xk = [xk xk_new];
  k = k + 1;
  if (k == max_step || f(xk(1,k),xk(2,k)) >= f(xk(1,k-1),xk(2,k-1)))
      break 
   
  end
  mk = 0;
  gamma = s * b^mk;

end      
n = k - 1;
end


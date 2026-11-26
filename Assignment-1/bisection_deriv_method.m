% Filippos Kanlis 9829
function [a,b,k,n] = bisection_deriv_method(f, a1, b1,lambda)

a = [];
b = [];
k = 1;
a(1) = a1;
b(1) = b1;
n=0;

syms x;
df = diff(cell2sym(f));

while ((1/2)^n) > (lambda/(b(1)-a(1)))
  n = n + 1;
end

while k <= n
    x_k = (a(k)+b(k))/2;
    y = subs(df, x_k);
    
    if y == 0
        return

    elseif y > 0
        a(k+1) = a(k);
        b(k+1) = x_k;

    elseif y < 0
        a(k+1) = x_k;
        b(k+1) = b(k);
 end
 
     k = k + 1;
 end

 k = k-1;
  
end
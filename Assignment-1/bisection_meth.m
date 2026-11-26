% Filippos Kanlis 9829
function [a, b, k] = bisection_meth(f,a1,b1,epsilon,lambda)
% bisection method: localization of a section width less than lambda in the range a1-b1 where function f has its minimum  
% f: function for investigation
% a1: start of range 
% b1: end of range
% k: iterations done

k = 1;
a = [];
b= [];
l = lambda;
e = epsilon;
a(k) =a1;
b(k) =b1;

while ~(b(k)-a(k)<l)
    x_1 = (a(k) + b(k))/2 - e;
    x_2 = (a(k) + b(k))/2 + e;
    if subs(f,x_1) < subs(f,x_2)
        a(k+1) = a(k);
        b(k+1) = x_2;
    else
        a(k+1) = x_1;
        b(k+1) = b(k);
    end
    k = k + 1;
end
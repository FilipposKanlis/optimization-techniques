% Filippos Kanlis 9829
function [a, b, k] = golden_sect_meth(f,a1,b1,lambda)
% : golden section method: localization of a section width less than lambda in the range a1-b1 where function f has its minimum  
% f: function for investigation
% a1 : start of range 
% b1 : end of range
% k : iterations done

k = 1;
a = [];
b = [];
l = lambda;
g = 0.618;
a(k) =a1;
b(k) =b1;
x_1 = a(1) + (1 - g)*(b(1) - a(1));
x_2 = a(1) + g * (b(1) - a(1));

while ~(b(k)-a(k)<l)
    if subs(f,x_1) > subs(f,x_2)
        a(k+1) = x_1;
        b(k+1) = b(k);
        x_1 = x_2;
        x_2 = a(k+1) + g*(b(k+1) - a(k+1));
    else
        a(k+1) = a(k);
        b(k+1) = x_2;
        x_2 = x_1;
        x_1 = a(k+1) + (1 - g)* (b(k+1) - a(k+1));
    end
    k = k + 1;
end
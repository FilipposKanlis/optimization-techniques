% Filippos Kanlis 9829
function [a, b, k, n] = fibonacci_method(f,a1,b1,epsilon,lambda)

k = 1;
a = [];
b = [];
l = lambda;
e = epsilon; 
a(1) = a1;
b(1) = b1;
DoLoop = true;

n = 0;
while fibonacci(n) < (b1 - a1)/l
        n = n + 1;
end

x_1 =  a1 + (fibonacci(n - 2)/fibonacci(n))*(b1 - a1);
x_2 =  a1 + (fibonacci(n - 1)/fibonacci(n))*(b1 - a1);

% str1 = f(x_1);
% str2 = f(x_2);
% 
% s1=subs(str1);
% s2=subs(str2);

while DoLoop
    if (subs(f,x_1) > subs(f,x_2))  % Step1a
        a(k+1) = x_1;               % step2
        b(k+1) = b(k);
        x_1temp = x_1;%x_1k
        x_1 = x_2;%x_1_k+1
        x_2 = a(k+1) + (fibonacci(n-k-1)/fibonacci(n-k))*(b(k+1)- a(k+1));%x_2_k+1

    else  % Step1b  
        a(k+1) = a(k);                  %step3
        b(k+1) = x_2;
        x_1temp = x_1;%x_1k
        x_2 = x_1; 
        x_1 = a(k+1) + (fibonacci(n-k-2)/fibonacci(n-k))*(b(k+1)-a(k+1));
    end

    if k == n-2                 % step2 cond1
        x_1 = x_1temp;          % step5 
        x_2 = x_1temp + epsilon;
        if (subs(f,x_1) > subs(f,x_2)) %step5 con1
            a(n) = x_1;
            b(n) = b(n-1);
            DoLoop = false; %-> to finish ? break?
        else                            %step5 con2
            a(n) = a(n-1);
            b(n) = x_2;
            DoLoop = false; %-> to finish ? break?
        end
    end
    k = k + 1;              % step4
end

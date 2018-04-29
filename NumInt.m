clear all; clc;
format long e
% all functions handles in a cell array
f = {@(x) exp(x.^3), @(x)exp(sin(pi*x)), @(x) exp(sin(pi*x)+cos(pi*x)), @(x) (3*x.^2)+(2*x)+1, @(x) x.^(3/2), @(x) x.^(2/3), @(x) x.^(2/3)};
% an array of lower endpoints of integration for all exercises
a = [0, 0, 0, 1, 0, 0, 1];
% an array of upper endpoints of integration for all exercises
b = [1, 2, 1/4,  3, 1, 1, 3];
% an array exact solutions:
I = [1.34190441797741,2.53213,0.899859,36,0.40,0.6,3.1442];
% a vector with all n's for each exercise:
n = 2.^(1:9);

% an array of character strings to be diplayed in the table of results
Strings=['a' 'b' 'c' 'd' 'e' 'f' 'g'];

% we will call the three methods Trapezoid, Simpson's and Midpoint in a
% nested loop. One loop goes over each single exercise ((a) to (g)); one
% for each of them goes over all the n's
for i=1:length(a)
    fprintf('Execution of part (%s) \n',Strings(i))
    fprintf('  n       Trap Rule         Error_n Trap       Ratio_n Trap     Simpson''s Rule    Error_n Simps      Ratio_n Simps\n')
    fprintf('===============================================================================================================================\n')
    for j = 1:length(n)
        Tr = Trapezoid(f{i},a(i),b(i),n(j));
        S = Simpson(f{i},a(i),b(i),n(j));
        ErrTrap(j)=abs(I(i)- Tr);
        ErrSimps(j)=abs(I(i)- S);
        if j<2
            fprintf('%3i  %15.8f    %15.8f    %15s   %15.8f   %15.8f   %15s \n', n(j),Tr,ErrTrap(j),'',S,ErrSimps(j),'')
        else
            RatioTrap(j-1)=ErrTrap(j-1)/ErrTrap(j);
            RatioSimps(j-1)=ErrSimps(j-1)/ErrSimps(j);
            fprintf('%3i  %15.8f    %15.8f    %15.8f   %15.8f   %15.8f   %15.8f  \n', n(j),Tr,ErrTrap(j),RatioTrap(j-1),S,ErrSimps(j),RatioSimps(j-1))
        end
    end
    % end of each table
 fprintf('===============================================================================================================================\n')
end
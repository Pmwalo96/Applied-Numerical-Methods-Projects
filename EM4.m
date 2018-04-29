clear all; close all;
% function handle of the RHS function for the problem
f=@(t,y)(-10.*y);
% the actual solution
y=@(t)( exp(-10.*t));
% the vector of all h's
h=2.^(0:-1:-4);

% the IC given
w0=1;

Markers = ['o' '^' 's' '>' '<']; % just different symbols to plot
Colors = ['r' 'g' 'b' 'c' 'm']; % different colors used for the different markers

% the main cycle of the call of the function and display starts here
% print the header of the table
fprintf('\nProblem 1 Implicit Euler\n')
fprintf('__________________________________________________\n\n')
fprintf('h             w_i           Error           Ratio   \n')
fprintf('__________________________________________________\n')
for j=1:length(h)

    t{j}=(0:h(j):2); % domain

    % the implicit method here:
     w{j} =ImplicitEulerForLab13(t{j}, w0,h(j));

    Error(j)=abs(y(t{j}(end)) - w{j}(end));
        % print the table

    if j==1
        fprintf('%5.4f     %7.4e      %8.4e  \n',h(j), w{j}(end) , Error(j))
    else
        Ratio(j-1)=Error(j-1)/Error(j);
        fprintf('%5.4f     %7.4e      %8.4e     %7.4f \n',h(j),w{j}(end)  ,Error(j), Ratio(j-1))
    end


    % plots of all the approximations here
    line_fewer_markers(t{j},w{j},2*j,Markers(j),'MarkerFaceColor',Colors(j),'MarkerSize',5);
    hold on
    % plotting here
    if j==length(h)
        plot(t{j},y(t{j}),'--r') % plots the real solution only the last time
        hold on
    end

end
fprintf('__________________________________________________\n')

% attributes of the figure here
title('Problem 1: Implicit Euler')
xlabel('t')
ylabel('w')
box on
legend({'$w_{h=1}$','$w_{h=1/2}$','$w_{h=1/4}$','$w_{h=1/8}$','$w_{h=1/16}$','y'},'interpreter','latex','location','northwest');


figure; % opens up a new figure

% print the header of the table
fprintf('\nProblem 1 Explicit Euler\n')
fprintf('__________________________________________________\n\n')
fprintf('h             w_i           Error           Ratio   \n')
fprintf('__________________________________________________\n')
for j=1:length(h)

    % the explicit method here:
     wE{j} = Euler(f, t{j}, w0,h(j));


    ErrorE(j)=abs(y(t{j}(end)) - wE{j}(end));
        % print the table

    if j==1
        fprintf('%5.4f     %7.4e      %8.4e  \n',h(j), wE{j}(end) , ErrorE(j))
    else
        RatioE(j-1)=ErrorE(j-1)/ErrorE(j);
        fprintf('%5.4f     %7.4e      %8.4e     %7.4f \n',h(j),wE{j}(end)  ,ErrorE(j), RatioE(j-1))
    end


    % plots of all the approximations here
    line_fewer_markers(t{j},wE{j},2*j,Markers(j),'MarkerFaceColor',Colors(j),'MarkerSize',5);
    hold on
    % plotting here
    if j==length(h)
        plot(t{j},y(t{j}),'--r') % plots the real solution only the last time
        hold on
    end

end
fprintf('__________________________________________________\n')

% attributes of the figure here
title('Problem 1: Explicit Euler')
xlabel('t')
ylabel('w')
box on
legend({'$w_{h=1}$','$w_{h=1/2}$','$w_{h=1/4}$','$w_{h=1/8}$','$w_{h=1/16}$','y'},'interpreter','latex','location','northwest');
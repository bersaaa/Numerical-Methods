clear;
V=12; % Vs=12 V
R=14.2; % R = 14.2 Ω
L=0.98; % L = 0.98 H
step_size=0.05; % ∆t = 0.05 (s),The step size value (∆t) is changed in this section.
time=0:step_size:0.6; % calculation of all time intervals
current=zeros(size(time)); % generated array for streams
current(1)=0.1; % the initial current value (A)
size_y=length(current);

func=@(time,current) (V-R*current)/L; %function to use in methods

% % % ------ Analytical solution -------
fprintf("***************\nAnalytical Solution\n***********\n");
analysis=[];
for j=1:size_y
    fa=0.84525-(0.74525/exp(14.5*time(j)));
    analysis(j)=fa;
    fprintf("%f \n",fa);
end
figure;
plot(time,analysis,"-b");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.05 s");
title("Analysis Solution");
grid on;
% --------> Euler's Method <-------------
fprintf("**************\nEuler's Method\n***********\n");
i=1;
while i<size_y
    current(i+1)=current(i)+(step_size*func(time(i),current(i)));
    fprintf("%f \n",current(i));

    i=i+1;
end
figure;
plot(time,current,"-r");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.05 s");
title("Euler's Method ");
grid on;
fprintf("***********\nEuler's Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Euler's method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error ");
legend("\DeltaT=0.05 s");
title("Euler's Method Error");
grid on;
% %-------> Modified euler's method <------------
j=1;
fprintf("**********\nModified Euler's Method\n***********\n");
while j<size_y
    current(j+1)=current(j)+(step_size*func(time(j),current(j)));
    current(j+1)=current(j)+(0.5*step_size*(func(time(j+1),current(j+1))+func(time(j),current(j))));
    fprintf("%f \n",current(j));
    j=j+1;
end
figure;
plot(time,current,"-k");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.05 s");
title("Modified Euler's Method");
grid on;
fprintf("***********\nModified Euler's Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Modified Euler's method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.05 s");
title("Modified Euler's Method Error");
grid on;
% % ---------> Midpoint method <------------
fprintf("***********\nMidpoint Method\n***********\n");
k=1;
while k<size_y
    current(k+1)=current(k)+(step_size*func((time(k)+(step_size/2)),(current(k)+(step_size/2)*func(time(k),current(k)))));
    fprintf("%f \n",current(k));
    k=k+1;
end
figure;
plot(time,current,"-g");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.05 s");
title("Midpoint Method");
grid on;
fprintf("***********\nMidpoint Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Midpoint method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.05 s");
title("Midpoint Method Error");
grid on;
% % % ------------> Runge-Kutta Method Order Four <------------
fprintf("***********\nRunge-Kutta Method Order Four \n***********\n");
l=1;
while l<size_y
    
    k1=step_size*func(time(l),current(l));
    k2=step_size*func((time(l)+(step_size/2)),(current(l)+(k1/2)));
    k3=step_size*func((time(l)+(step_size/2)),(current(l)+(k2/2)));
    k4=step_size*func(time(l+1),(current(l)+k3));
    current(l+1)=current(l)+((1/6)*(k1+2*k2+2*k3+k4));
    fprintf("%f \n",current(l));
    l=l+1;
end
figure;
plot(time,current,"-m");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.05 s");
title("Runge-Kutta Method Order Four");
grid on;
fprintf("***********\nRunge-Kutta Method Order Four Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for  Runge-Kutta Method Order Four
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.05 s");
title("Runge-Kutta Method Order Four Error");
grid on


% % % -----------------------step size=0.025 -----------
step_size=0.025; % ∆t = 0.05 (s),The step size value (∆t) is changed in this section.
time=0:step_size:0.6; % calculation of all time intervals
current=zeros(size(time)); % generated array for streams
current(1)=0.1; % the initial current value (A)
size_y=length(current);

func=@(time,current) (V-R*current)/L; %function to use in methods

% % % ------ Analytical solution -------
fprintf("***************\nAnalytical Solution\n***********\n");
analysis=[];
for j=1:size_y
    fa=0.84525-(0.74525/exp(14.5*time(j)));
    analysis(j)=fa;
    fprintf("%f \n",fa);
end
figure;
plot(time,analysis,"-b");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.025 s");
title("Analysis Solution");
grid on;
% --------> Euler's Method <-------------
fprintf("**************\nEuler's Method\n***********\n");
i=1;
while i<size_y
    current(i+1)=current(i)+(step_size*func(time(i),current(i)));
    fprintf("%f \n",current(i));

    i=i+1;
end
figure;
plot(time,current,"-r");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.025 s");
title("Euler's Method ");
grid on;
fprintf("***********\nEuler's Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Euler's method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error ");
legend("\DeltaT=0.025 s");
title("Euler's Method Error");
grid on;
% %-------> Modified euler's method <------------
j=1;
fprintf("**********\nModified Euler's Method\n***********\n");
while j<size_y
    current(j+1)=current(j)+(step_size*func(time(j),current(j)));
    current(j+1)=current(j)+(0.5*step_size*(func(time(j+1),current(j+1))+func(time(j),current(j))));
    fprintf("%f \n",current(j));
    j=j+1;
end
figure;
plot(time,current,"-k");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.025 s");
title("Modified Euler's Method");
grid on;
fprintf("***********\nModified Euler's Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Modified Euler's method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.025 s");
title("Modified Euler's Method Error");
grid on;
% % ---------> Midpoint method <------------
fprintf("***********\nMidpoint Method\n***********\n");
k=1;
while k<size_y
    current(k+1)=current(k)+(step_size*func((time(k)+(step_size/2)),(current(k)+(step_size/2)*func(time(k),current(k)))));
    fprintf("%f \n",current(k));
    k=k+1;
end
figure;
plot(time,current,"-g");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.025 s");
title("Midpoint Method");
grid on;
fprintf("***********\nMidpoint Method Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for Midpoint method
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.025 s");
title("Midpoint Method Error");
grid on;
% % % ------------> Runge-Kutta Method Order Four <------------
fprintf("***********\nRunge-Kutta Method Order Four \n***********\n");
l=1;
while l<size_y
    
    k1=step_size*func(time(l),current(l));
    k2=step_size*func((time(l)+(step_size/2)),(current(l)+(k1/2)));
    k3=step_size*func((time(l)+(step_size/2)),(current(l)+(k2/2)));
    k4=step_size*func(time(l+1),(current(l)+k3));
    current(l+1)=current(l)+((1/6)*(k1+2*k2+2*k3+k4));
    fprintf("%f \n",current(l));
    l=l+1;
end
figure;
plot(time,current,"-m");
xlabel("TIME (s)");
ylabel("The Current (A)");
legend("\DeltaT=0.025 s");
title("Runge-Kutta Method Order Four");
grid on;
fprintf("***********\nRunge-Kutta Method Order Four Error\n***********\n");
fprintf("%f \n",abs(current-analysis));
% Plot absolute error for  Runge-Kutta Method Order Four
figure;
plot(time,abs(current-analysis));
xlabel("TIME (s)");
ylabel("The Error");
legend("\DeltaT=0.025 s");
title("Runge-Kutta Method Order Four Error");
grid on


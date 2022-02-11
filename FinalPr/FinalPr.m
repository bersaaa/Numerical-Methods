clear;
clc;

Vs = 2;    % Vs = 2 V
L = 0.98 ; % L = 0.98 H
R = 14.2 ; % R = 14.2 Ω
step_size_1 = 0.025 ;  % ∆t = 25 ms = 0.025 s
step_size_2 = 0.0025 ; % ∆t = 2.5 ms = 0.0025 s
time1=0:step_size_1:0.6; % calculation of all time intervals for step size 1
time2=0:step_size_2:0.6; % calculation of all time intervals for step size 2

load fprdata.dat;
voltage = fprdata(1:end,1);
currents = fprdata(1:end,2);
% ------------ Least Squares Method -----------
voltage_1=[];
sum1=0;sum2=0;sum3=0;sum4=0;
for i=1:1:length(currents)
    sum1=sum1+voltage(i)^2;
    sum2=sum2+log(currents(i));
    sum3=sum3+(log(currents(i))*voltage(i));
    sum4=sum4+voltage(i);
end
b= exp(((sum1*sum2) - (sum3*sum4))/ ((length(voltage)*sum1)- (sum4*sum4)));       %  coefficient 1
a= (((length(currents)*sum3)-(sum4*sum2)) / ((length(voltage)*sum1)-(sum4*sum4))); %  coefficient 2

Error=[];
for j=1:length(currents)
    
    voltage_1(j)=(log(currents(j)/b))/a; % Calculated Voltage Values 
    error= (voltage(j)-voltage_1(j))*(voltage(j)-voltage_1(j)); % The error calculation between voltage and voltage_1 
    Error(j)=error;

end
fprintf("Error values for calculated voltage\n");
fprintf("%.10f\n",Error);
fprintf("Calculated Diode Voltage values  \n");
fprintf("%.10f\n",voltage_1);
% --------> For ∆t = 25 ms  <-------------

VD_1=[];V2_1=[];V1_1=[];
currents1=[];
currents1(1,1)=1*10^-10; % Initial Value
%  Initial value function
func= @(time1,currents1) ((Vs-(currents1*R)-(log(currents1/b)/a))/L);
% ------------ Runge-Kutta method -----------------
for k=1:1:length(time1)-1
    
    k1=step_size_1*func(time1(k),currents1(k));
    k2=step_size_1*func((time1(k)+(step_size_1/2)),(currents1(k)+(k1/2)));
    k3=step_size_1*func((time1(k)+(step_size_1/2)),(currents1(k)+(k2/2)));
    k4=step_size_1*func(time1(k+1),(currents1(k)+k3));
    currents1(k+1,1)=currents1(k,1)+((1/6)*(k1+2*k2+2*k3+k4));
       
end
% Calculation of all voltage values ​​in the circuit for  ∆t = 25 ms
for m=1:length(time1)
    
    VD_1(m,1)=log(currents1(m)/b)/a;
    V2_1(m,1)=L*func(time1(m),currents1(m,1));
    V1_1(m,1)=currents1(m)*R;
    
end
fprintf("Estimated current by runge-kutta for ∆t = 25 ms \n");
fprintf("%.10f\n",currents1);
fprintf("Diode voltage for ∆t = 25 ms\n");
fprintf("%.10f\n",VD_1);
fprintf("V1 voltage for ∆t = 25 ms\n");
fprintf("%.10f\n",V1_1);
fprintf("V2 voltage for ∆t = 25 ms\n");
fprintf("%.10f \n",V2_1);
% --------> For ∆t = 2.5 ms  <-------------

VD_2=[];V2_2=[];V1_2=[];
currents2=[]; 
currents2(1,1)=1*10^-10; % Initial Value
%  Initial value function
func= @(time2,currents2) ((Vs-(currents2*R)-(log(currents2/b)/a))/L);
% ------------ Runge-Kutta method -----------------
for l=1:1:length(time2)-1
    
    k1=step_size_2*func(time2(l),currents2(l));
    k2=step_size_2*func((time2(l)+(step_size_2/2)),(currents2(l)+(k1/2)));
    k3=step_size_2*func((time2(l)+(step_size_2/2)),(currents2(l)+(k2/2)));
    k4=step_size_2*func(time2(l+1),(currents2(l)+k3));
    currents2(l+1,1)=currents2(l,1)+((1/6)*(k1+2*k2+2*k3+k4));
    
end
% Calculation of all voltage values ​​in the circuit for  ∆t = 2.5 ms
for n=1:length(time2)
    
    VD_2(n,1)=log(currents2(n)/b)/a;
    V2_2(n,1)=L*func(time2(n),currents2(n,1));
    V1_2(n,1)=currents2(n)*R;
    
end

fprintf("Estimated current by runge-kutta for ∆t = 2.5 ms \n");
fprintf("%.10f\n",currents2);
fprintf("Diode voltage for ∆t = 2.5 ms\n");
fprintf("%.10f\n",VD_2);
fprintf("V1 voltage for ∆t = 2.5 ms\n");
fprintf("%.10f\n",V1_2);
fprintf("V2 voltage for ∆t = 2.5 ms\n");
fprintf("%.10f \n",V2_2);

% ------------------------ Graphs -----------------------------------

figure(1);
semilogy(voltage,currents,"o-r",'LineWidth', 1.5);
hold on;
semilogy(voltage_1,currents,"-b");
xlabel("Voltage [V]");
ylabel("Current [A]");
legend("Measured diode voltage","Calculated diode voltage");
title("Logarithmic Scales"); 
figure(2);
plot(voltage,currents,"o-r",'LineWidth', 2);
hold on;
plot(voltage_1,currents,"-b");
xlabel("Voltage [V]");
ylabel("Current [A]");
legend("Measured diode voltage","Calculated diode voltage");
title("Linear Scales ");

figure(3);
plot(time2,currents2,"o-r");
hold on;
plot(time1,currents1,"-b",'LineWidth', 2);
ylabel("Current [A]");
xlabel("Time [s]");
legend("∆t = 2.5 ms","∆t = 25 ms");
figure(4);
plot(time2,VD_2,"o-r");
hold on;
plot(time1,VD_1,"-b",'LineWidth', 2);
ylabel("Voltage Diode [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms","∆t = 25 ms");
figure(5);
plot(time2,V1_2,"o-r");
hold on;
plot(time1,V1_1,"-b",'LineWidth', 2);
ylabel("Voltage Resistance V1 [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms","∆t = 25 ms");
figure(6);
plot(time2,V2_2,"o-r");
hold on;
plot(time1,V2_1,"-b",'LineWidth', 2);
ylabel("Voltage Inductance V2 [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms","∆t = 25 ms");

figure(7);
plot(time1,VD_1,"*-r");
ylabel("Voltage Diode [V]");
xlabel("Time [s]");
legend("∆t = 25 ms = 0.025 s");
figure(8);
plot(time1,V1_1,"*-r");
ylabel("Voltage Resistance V1 [V]");
xlabel("Time [s]");
legend("∆t = 25 ms = 0.025 s");
figure(9);
plot(time1,V2_1,"*-r");
ylabel("Voltage Inductance V2 [V]");
xlabel("Time [s]");
legend("∆t = 25 ms = 0.025 s");
figure(10);
plot(time1,currents1,"*-r");
ylabel("Current [A]");
xlabel("Time [s]");
legend("∆t = 25 ms = 0.025 s");

figure(11);
plot(time2,VD_2,"o-r");
ylabel("Voltage Diode [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms = 0.0025 s");
figure(12);
plot(time2,V1_2,"o-r");
ylabel("Voltage Resistance V1 [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms = 0.0025 s");
figure(13);
plot(time2,V2_2,"o-r");
ylabel("Voltage Inductance V2 [V]");
xlabel("Time [s]");
legend("∆t = 2.5 ms = 0.0025 s");
figure(14);
plot(time2,currents2,"o-r");
ylabel("Current [A]");
xlabel("Time [s]");
legend("∆t = 2.5 ms = 0.0025 s");
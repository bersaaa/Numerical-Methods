% % % 1. Plot the current i(t) and voltage v(t) data and comment on their consistency.
% % % 2. Determine and plot the power p(t).
% % % 3. Determine the stored energy in the inductor by numerically integrating the equation (2) using
% % % (a) Composite Midpoint Rule,
% % % (b) Composite Trapezoidal Rule,
% % % (c) Composite Simpson’s Rule.
% % % 4. Determine the stored energy in the inductor using equation (3).
% % % 5. Compare all results obtained in Question 3 with the result obtained in Question
% % % 6. Comment on the stored energy, specify the important time instances.

%--------------> 1. and 2. <-----------------
clear;
format long;
Delta_time =0.025;
L=0.1;

load pr3data.dat;
time = pr3data(1:end,1);
current = pr3data(1:end,2);
voltage = pr3data(1:end,3);

count_1=1;
derivate_current=[]; 
derivate_voltage=[]; 
Value_power=[];

while count_1 <= length(pr3data)
    if count_1==1  
        df_current = (-3*current(1)+ 4*(current(2))-(current(3)))/(2*Delta_time);
        voltage_1 = L*df_current;        
    elseif 1< count_1 && count_1 < length(current)
        df_current = (current(count_1+1)-current(count_1-1))/ (2*Delta_time);
        voltage_1 = L*df_current;
    elseif count_1==length(current) 
        df_current = (-3*current(end)+ 4*(current(end-1))-(current(end-2)))/(2*Delta_time); 
        voltage_1 = L*df_current;
    end  
    derivate_current(count_1)=df_current;
    derivate_voltage(count_1)=voltage_1;
    Power= (current(count_1)*voltage(count_1));
    Value_power(count_1)=Power;
    count_1=count_1+1;
end

% ----------------> 3. <--------------------
% -------------> Composite Midpoint Rule <--------------
fprintf("\nExpending Energy Midpoint Rule\n");
count_2=1;
while (count_2 <= (length(time)))
    
    n=time(count_2)/ Delta_time +2;
    lower_limit=time(1);
    upper_limit=time(count_2);
    h=(upper_limit-lower_limit)/(n+2);
    expending_energy_midpoint(count_2)=0;
    for count_3=1:2: count_2
        expending_energy_midpoint(count_2)=expending_energy_midpoint(count_2)+ (2*h*Value_power(count_3));
    end 
    fprintf("%.16f \n",expending_energy_midpoint(count_2));
    count_2=count_2+1;
end
expending_energy_midpoint=transpose(expending_energy_midpoint);

% ------------> Composite Trapezoidal Rule <---------------
fprintf("\nExpending Energy Trapezoidal Rule\n");
count_4=1;
while (count_4 <= (length(time)))
    
    n=time(count_4)/ (Delta_time+2);
    lower_limit=time(1);
    upper_limit=time(count_4);
    h1=(upper_limit-lower_limit)/(n);
    expending_energy_trapezoidal(count_4)=0;
    for (count_5=1:1: (count_4-1))
        expending_energy_trapezoidal(count_4)=expending_energy_trapezoidal(count_4)+(h1/2*((2*voltage(count_5)*current(count_5))+Value_power(1)+Value_power(end)));
    end
    fprintf("%.16f \n",expending_energy_trapezoidal(count_4));
    count_4=count_4+1;
end
expending_energy_trapezoidal=transpose(expending_energy_trapezoidal);

% -----------> Composite Simpson Rule <--------------
fprintf("\nExpending Energy Simpson Rule\n");
count_6=1;
value2=0;
while (count_6 <= (length(time)))
    
    n=time(count_6)/ (Delta_time +2);
    lower_limit=time(1);
    upper_limit=time(count_6);
    h2=(upper_limit-lower_limit)/(n);
    expending_energy_simpson(count_6)=0;
    for (count_7=2:2: (count_6))
        value1=4*Value_power(count_7);
        for (count_9=2:1:(count_7-1))
            value2=2*Value_power(count_9);
        end
        expending_energy_simpson(count_6)=expending_energy_simpson(count_6)+ ((h2/3)*(Value_power(1)+Value_power(end)+value2+value1));
    end
    fprintf("%.16f \n",expending_energy_simpson(count_6));
    count_6=count_6+1;
end
expending_energy_simpson=transpose(expending_energy_simpson);
% ----------------> 4. <-------------------
count_8=1;
expending=[];
fprintf("\nExpending Energy\n");
while (count_8<=length(time))
    expending_energy=(1/2)*L*(current(count_8)*current(count_8));
    expending(count_8)=expending_energy;
    fprintf("%.16f \n",expending_energy);
    count_8=count_8+1;
end
figure(7)
plot(time,expending);
xlabel("Time (s)");
ylabel("Energy (W) ");
legend("Expending Energy");
title('Stored Energy for Expending');
figure(1)
plot(time,derivate_voltage);
xlabel("Time (s)");
ylabel("Voltage (V)");
title('Calculated Voltage by Derivate ');
legend("Voltage for \DeltaT=25 ms");
figure(2)
plot(time,voltage);
xlabel("Time (s)");
ylabel("Values of Voltage (V)");
title('Voltage Given in *dat file ');
legend("Voltage in data file");
figure(3)
plot(time,Value_power);
xlabel("Time (s)");
ylabel("Power (W) ");
title('Calculated Power ');
legend("Power = v(t)*i(t)");
figure(4)
plot(time,expending_energy_midpoint);
xlabel("Time (s)");
ylabel("Energy (W) ");
legend("Composite Midpoint Rule");
title('Stored Energy for Midpoint');
figure(5)
plot(time,expending_energy_trapezoidal);
xlabel("Time (s)");
ylabel("Energy (W) ");
legend("Composite Trapezoidal Rule");
title('Stored Energy for Trapezoidal');
figure(6)
plot(time,expending_energy_simpson);
xlabel("Time (s)");
ylabel("Energy (W) ");
legend("Composite Simpson Rule");
title('Stored Energy for Simpson ');
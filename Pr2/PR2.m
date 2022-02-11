clear;
format long;
%Delta t (second) values given for .Dat files:
Delta_current_1_time =0.75;
Delta_current_2_time =0.50;
Delta_current_3_time =0.25;
Delta_current_4_time =0.10;

%Load command is used to read data from cuurrent1.dat file.
load current1.dat;
time_1= current1(1:end,1);
current_1=current1(1:end,2);

%The first method used to find the derivative is the forward method.
%The formulas used are also used for other dat files. There are only value differences.
a=1; 
derivate_1_forward=[]; %The array used to hold the calculated derivative values.
impressed_voltage1_1_array=[]; %The array used to hold the calculated impresed voltage values.
ForwardError1=[]; %The array used to hold the calculated error values.
while a<= length(current_1)-1
    
    df_1_forward = (current_1(a+1)-current_1(a)) / Delta_current_1_time ; %Derivative formula used for forward method.
    E = (0.98)* df_1_forward + (14.2)* current_1(a); %The impressed voltage is calculated here.
    fprintf("%f \n",E);
    derivate_1_forward(a+1)=df_1_forward; %The calculated derivative is transferred to the array in this section.
    impressed_voltage1_1_array(a+1)=E; %The calculated impresed voltage is transferred to the array in this section.
    Error1_forward= ((E-df_1_forward)/df_1_forward); %Error calculation is made in this section.
    ForwardError1(a+1)=Error1_forward;  %The calculated error value is transferred to the array in this section.
    a=a+1;
end

fprintf("--------------------------------------------\n");
%The second method used to find the derivative is the backward method.
%The formulas used are also used for other dat files. There are only value differences.
b=2;
derivate_1_backward=[];  %The array used to hold the calculated derivative values.
impressed_voltage1_2_array=[]; %The array used to hold the calculated impresed voltage values.
BackwardError1=[];  %The array used to hold the calculated error values.
while b <= length(current_1)
    
    df_1_backward = (current_1(b)-current_1(b-1))/ Delta_current_1_time ; %Derivative formula used for backward method.
    E = (0.98)* df_1_backward + (14.2)* current_1(b); %The impressed voltage is calculated here.
    fprintf("%f \n",E);
    derivate_1_backward(b)=df_1_backward; %The calculated derivative is transferred to the array in this section.
    impressed_voltage1_2_array(b)=E; %The calculated impresed voltage is transferred to the array in this section.
    Error1_backward= ((E-df_1_backward)/df_1_backward); %Error calculation is made in this section.
    BackwardError1(b)=Error1_backward;  %The calculated error value is transferred to the array in this section.
    b=b+1;
    
end

fprintf("--------------------------------------------\n");
%The third method used to find the derivative is the three point midpoint method.
%The formulas used are also used for other dat files. There are only value differences.
c=1;
derivate_1_midpoint=[]; %The array used to hold the calculated derivative values.
impressed_voltage1_3_array=[]; %The array used to hold the calculated impresed voltage values.
MidpointError1=[];  %The array used to hold the calculated error values.
while c <= length(current_1)
    if c==1  %In this section, the derivative is calculated using the first  values ​​at the endpoint.
        df_1_midpoint= (-3*current_1(c)+ 4*(current_1(c+1))-(current_1(c+2)))/2*Delta_current_1_time;
        E = (0.98)* df_1_midpoint + (14.2)* current_1(c); %For the first derivatives, the impressed voltage value is calculated
        fprintf("%f \n",E);
    elseif 1< c && c < length(current_1)
        df_1_midpoint = (current_1(c+1)-current_1(c-1))/ 2*Delta_current_1_time; %Derivative formula used for midpoint method.
        E= (0.98)* df_1_midpoint+ (14.2)* current_1(c);%The impressed voltage is calculated here.
        fprintf("%f \n",E);
    elseif c==length(current_1) %In this section, the derivative is calculated using the last values ​​at the endpoint.
        df_1_midpoint= (-3*current_1(c)+ 4*(current_1(c-1))-(current_1(c-2)))/2*Delta_current_1_time;
        E = (0.98)* df_1_midpoint + (14.2)* current_1(c); %For the last derivatives, the impressed voltage value is calculated
        fprintf("%f \n",E);
        
    end
        
    derivate_1_midpoint(c)=df_1_midpoint; %The calculated derivative is transferred to the array in this section.
    impressed_voltage1_3_array(c)=E;  %The calculated impresed voltage is transferred to the array in this section.
    Error1_midpoint= ((E-df_1_midpoint)/df_1_midpoint);  %Error calculation is made in this section.
    MidpointError1(c)=Error1_midpoint;%The calculated error value is transferred to the array in this section.
    c=c+1;
end

fprintf("--------------------------------------------\n");
%Load command is used to read data from cuurrent2.dat file.
load current2.dat;
time_2= current2(1:end,1);
current_2=current2(1:end,2);

%The first method used to find the derivative is the forward method.
d=1; 
derivate_2_forward=[];
impressed_voltage2_1_array=[];
ForwardError2=[];
while d<= length(current_2)-1
    
    df_2_forward = (current_2(d+1)-current_2(d)) / Delta_current_2_time ;
    E = (0.98)* df_2_forward + (14.2)* current_2(d);
    fprintf("%f \n",E);
    derivate_2_forward(d+1)=df_2_forward;
    impressed_voltage2_1_array(d+1)=E;
    Error2_forward= ((E-df_2_forward)/df_2_forward);
    ForwardError2(d+1)=Error2_forward;
    d=d+1;
end
fprintf("--------------------------------------------\n");
%The second method used to find the derivative is the backward method.
e=2;
derivate_2_backward=[];
impressed_voltage2_2_array=[];
BackwardError2=[];
while e <= length(current_2)
    
    df_2_backward = (current_2(e)-current_2(e-1))/ Delta_current_2_time ;
    E = (0.98)* df_2_backward + (14.2)* current_2(e);
    fprintf("%f \n",E);
    derivate_2_backward(e)=df_2_backward;
    impressed_voltage2_2_array(e)=E;
    Error2_backward= ((E-df_2_backward)/df_2_backward);
    BackwardError2(e)=Error2_backward;
    e=e+1;
    
end
fprintf("--------------------------------------------\n");

%The third method used to find the derivative is the three point midpoint method. 
f=1;
derivate_2_midpoint=[];
impressed_voltage2_3_array=[];
MidpointError2=[];
while f <= length(current_2)
    if f==1 
        df_2_midpoint= (-3*current_2(f)+ 4*(current_2(f+1) )-(current_2(f+2)))/2*Delta_current_2_time;
        E = (0.98)* df_2_midpoint + (14.2)* current_2(f);
        fprintf("%f \n",E);
    elseif 1<f && f<length(current_2)
        df_2_midpoint = (current_2(f+1)-current_2(f-1))/ 2*Delta_current_2_time;
        E= (0.98)* df_2_midpoint+ (14.2)* current_2(f);
        fprintf("%f \n",E);
    elseif f==length(current_2)
        df_2_midpoint= (-3*current_2(f)+ 4*(current_2(f-1) )-(current_2(f-2)))/2*Delta_current_2_time;
        E = (0.98)* df_2_midpoint + (14.2)* current_2(f);
        fprintf("%f \n",E);
        
    end
   
    derivate_2_midpoint(f)=df_2_midpoint;
    impressed_voltage2_3_array(f)=E;
    Error2_midpoint= ((E-df_2_midpoint)/df_2_midpoint);
    MidpointError2(f)=Error2_midpoint;
    f=f+1;
    
 end

fprintf("--------------------------------------------\n");
%Load command is used to read data from cuurrent3.dat file.
load current3.dat;
time_3= current3(1:end,1);
current_3=current3(1:end,2);

%The first method used to find the derivative is the forward method.
g=1; 
derivate_3_forward=[];
impressed_voltage3_1_array=[];
ForwardError3=[];
while g<= length(current_3)-1
    
    df_3_forward = (current_3(g+1)-current_3(g)) / Delta_current_3_time ;
    E = (0.98)* df_3_forward + (14.2)* current_3(g);
    fprintf("%f \n",E);
    derivate_3_forward(g+1)=df_3_forward;
    impressed_voltage3_1_array(g+1)=E;
    Error3_forward= ((E-df_3_forward)/df_3_forward);
    ForwardError3(g+1)=Error3_forward;
    g=g+1;
end
fprintf("--------------------------------------------\n");
%%The second method used to find the derivative is the backward method.
h=2;
derivate_3_backward=[];
impressed_voltage3_2_array=[];
BackwardError3=[];
while h <= length(current_3)
    
    df_3_backward = (current_3(h)-current_3(h-1))/ Delta_current_3_time ;
    E = (0.98)* df_3_backward + (14.2)* current_3(h);
    fprintf("%f \n",E);
    derivate_3_backward(h)=df_3_backward;
    impressed_voltage3_2_array(h)=E;
    Error3_backward= ((E-df_3_backward)/df_3_backward);
    BackwardError3(h)=Error3_backward;
    h=h+1;
    
end
fprintf("--------------------------------------------\n");

%The third method used to find the derivative is the three point midpoint method.
i=1;
derivate_3_midpoint=[];
impressed_voltage3_3_array=[];
MidpointError3=[];
while i <= length(current_3)
    if i==1 
        df_3_midpoint= (-3*current_3(i)+ 4*(current_3(i+1) )-(current_3(i+2)))/2*Delta_current_3_time;
        E = (0.98)* df_3_midpoint + (14.2)* current_3(i);
        fprintf("%f \n",E);
    elseif 1<i && i<length(current_3)
        df_3_midpoint = (current_3(i+1)-current_3(i-1))/ 2*Delta_current_3_time;
        E= (0.98)* df_3_midpoint+ (14.2)* current_3(i);
        fprintf("%f \n",E);
    elseif i==length(current_3)
        df_3_midpoint= (-3*current_3(i)+ 4*(current_3(i-1) )-(current_3(i-2)))/2*Delta_current_3_time;
        E = (0.98)* df_3_midpoint + (14.2)* current_3(i);
        fprintf("%f \n",E);
    end
    
    derivate_3_midpoint(i)=df_3_midpoint;
    impressed_voltage3_3_array(i)=E;
    Error3_midpoint= ((E-df_3_midpoint)/df_3_midpoint);
    MidpointError3(i)=Error3_midpoint;
    i=i+1;
    
end
fprintf("--------------------------------------------\n");

%Load command is used to read data from cuurrent4.dat file.
load current4.dat;
time_4= current4(1:end,1);
current_4=current4(1:end,2);

%The first method used to find the derivative is the forward method.
j=1; 
derivate_4_forward=[];
impressed_voltage4_1_array=[];
ForwardError4=[];
while j<= length(current_4)-1
    
    df_4_forward = (current_4(j+1)-current_4(j)) / Delta_current_4_time ;
    E = (0.98)* df_4_forward + (14.2)* current_4(j);
    fprintf("%f \n",E);
    derivate_4_forward(j+1)=df_4_forward;
    impressed_voltage4_1_array(j+1)=E;
    Error4_forward= ((E-df_4_forward)/df_4_forward);
    ForwardError4(j+1)=Error4_forward;
    j=j+1;
end
fprintf("--------------------------------------------\n");
%%The second method used to find the derivative is the backward method.
k=2;
derivate_4_backward=[];
impressed_voltage4_2_array=[];
BackwardError4=[];
while k <= length(current_4)
    
    df_4_backward = (current_4(k)-current_4(k-1))/ Delta_current_4_time ;
    E = (0.98)* df_4_backward + (14.2)* current_4(k);
    fprintf("%f \n",E);
    derivate_4_backward(k)=df_4_backward;
    impressed_voltage4_2_array(k)=E;
    Error4_backward= ((E-df_4_backward)/df_4_backward);
    BackwardError4(k)=Error4_backward;
    k=k+1;
    
end
fprintf("--------------------------------------------\n");

%The third method used to find the derivative is the three point midpoint method.  
l=1;
derivate_4_midpoint=[];
impressed_voltage4_3_array=[];
MidpointError4=[];
while l<= length(current_4)
   if l==1 
        df_4_midpoint= (-3*current_4(l)+ 4*(current_4(l+1) )-(current_4(l+2)))/2*Delta_current_4_time;
        E = (0.98)* df_4_midpoint + (14.2)* current_4(l);
        fprintf("%f \n",E);
   elseif 1<l && l<length(current_4)
        df_4_midpoint = (current_4(l+1)-current_4(l-1))/ 2*Delta_current_4_time;
        E= (0.98)* df_4_midpoint+ (14.2)* current_4(l);
        fprintf("%f \n",E);
   elseif l== length(current_4)
        df_4_midpoint= (-3*current_4(l)+ 4*(current_4(l-1) )-(current_4(l-2)))/2*Delta_current_4_time;
        E = (0.98)* df_3_midpoint + (14.2)* current_4(l);
        fprintf("%f \n",E);
    end
    
    derivate_4_midpoint(l)=df_4_midpoint;
    impressed_voltage4_3_array(l)=E;
    Error4_midpoint= ((E-df_4_midpoint)/df_4_midpoint);
    MidpointError4(l)=Error4_midpoint;
    l=l+1;
    
end


fprintf("--------------------------------------------\n");
% The 1st figure for impresed voltage calculated with forward method.
figure(1);
plot(time_1,impressed_voltage1_1_array,'-r');
hold on;
plot(time_2,impressed_voltage2_1_array,'-b');
hold on;
plot(time_3,impressed_voltage3_1_array,'-y');
hold on;
plot(time_4,impressed_voltage4_1_array,'-k');
xlabel('TIME');
ylabel('IMPRESED VOLTAGE FOR FORWARD');
legend({'IMPRESED VOLTAGE FOR \Delta TIME_1=75','IMPRESED VOLTAGE FOR \Delta TIME_2=50','IMPRESED VOLTAGE FOR \Delta TIME_3=25','IMPRESED VOLTAGE FOR \Delta TIME_4=10'},'FontSize',6);

% The 2nd figure for impresed voltage calculated with backward method.
figure(2);
plot(time_1,impressed_voltage1_2_array,'-r');
hold on;
plot(time_2,impressed_voltage2_2_array,'-b');
hold on;
plot(time_3,impressed_voltage3_2_array,'-y');
hold on;
plot(time_4,impressed_voltage4_2_array,'-k');
xlabel('TIME');
ylabel('IMPRESED VOLTAGE FOR BACKWARD');
legend({'IMPRESED VOLTAGE FOR \Delta TIME_1=75','IMPRESED VOLTAGE FOR \Delta TIME_2=50','IMPRESED VOLTAGE FOR \Delta TIME_3=25','IMPRESED VOLTAGE FOR \Delta TIME_4=10'},'FontSize',6);

% The 3rd figure for impresed voltage calculated with midpoint method.
figure(3);
plot(time_1,impressed_voltage1_3_array,'-r');
hold on;
plot(time_2,impressed_voltage2_3_array,'-b');
hold on;
plot(time_3,impressed_voltage3_3_array,'-y');
hold on;
plot(time_4,impressed_voltage4_3_array,'-k');
xlabel('TIME');
ylabel('IMPRESED VOLTAGE FOR MIDPOINT');
legend({'IMPRESED VOLTAGE FOR \Delta TIME_1=75','IMPRESED VOLTAGE FOR \Delta TIME_2=50','IMPRESED VOLTAGE FOR \Delta TIME_3=25','IMPRESED VOLTAGE FOR \Delta TIME_4=10'},'FontSize',6);

% The 4th figure for derivate calculated with forward method.
figure(4);
plot(time_1,derivate_1_forward,'-r');
hold on;
plot(time_2,derivate_2_forward,'-b');
hold on;
plot(time_3,derivate_3_forward,'-y');
hold on;
plot(time_4,derivate_4_forward,'-k');
xlabel('TIME');
ylabel('FORWARD DERIVATE');
legend({'DERIVATE FOR \Delta TIME_1=75','DERIVATE FOR \Delta TIME_2=50','DERIVATE FOR \Delta TIME_3=25','DERIVATE FOR \Delta TIME_4=10'},'FontSize',6);

% The 5th figure for derivate calculated with backward method.
figure(5);
plot(time_1,derivate_1_backward,'-r');
hold on;
plot(time_2,derivate_2_backward,'-b');
hold on;
plot(time_3,derivate_3_backward,'-y');
hold on;
plot(time_4,derivate_4_backward,'-k');
xlabel('TIME');
ylabel('BACKWARD DERIVATE');
legend({'DERIVATE FOR \Delta TIME_1=75','DERIVATE FOR \Delta TIME_2=50','DERIVATE FOR \Delta TIME_3=25','DERIVATE FOR \Delta TIME_4=10'},'FontSize',6);

% The 6th figure for derivate calculated with midpoint method.
figure(6);
plot(time_1,derivate_1_midpoint,'-r');
hold on;
plot(time_2,derivate_2_midpoint,'-b');
hold on;
plot(time_3,derivate_3_midpoint,'-y');
hold on;
plot(time_4,derivate_4_midpoint,'-k');
xlabel('TIME');
ylabel('MIDPOINT DERIVATE');
legend({'DERIVATE FOR \Delta TIME_1=75','DERIVATE FOR \Delta TIME_2=50','DERIVATE FOR \Delta TIME_3=25','DERIVATE FOR \Delta TIME_4=10'},'FontSize',6);

% The 7th figure for error values calculated with forward method.
figure(7);
plot(time_1,ForwardError1,'-r');
hold on;
plot(time_2,ForwardError2,'-b');
hold on;
plot(time_3,ForwardError3,'-y');
hold on;
plot(time_4,ForwardError4,'-k');
xlabel('TIME');
ylabel('FORWARD ERROR');
legend({'ERROR FOR \Delta TIME_1=75','ERROR FOR \Delta TIME_2=50','ERROR FOR \Delta TIME_3=25','ERROR FOR \Delta TIME_4=10'},'FontSize',6);

% The 8th figure for error values calculated with backward method.
figure(8);
plot(time_1,BackwardError1,'-r');
hold on;
plot(time_2,BackwardError2,'-b');
hold on;
plot(time_3,BackwardError3,'-y');
hold on;
plot(time_4,BackwardError4,'-k');
xlabel('TIME');
ylabel('BACKWARD ERROR');
legend({'ERROR FOR \Delta TIME_1=75','ERROR FOR \Delta TIME_2=50','ERROR FOR \Delta TIME_3=25','ERROR FOR \Delta TIME_4=10'},'FontSize',6);

% The 9th figure for error values calculated with midpoint method.
figure(9);
plot(time_1,MidpointError1,'-r');
hold on;
plot(time_2,MidpointError2,'-b');
hold on;
plot(time_3,MidpointError3,'-y');
hold on;
plot(time_4,MidpointError4,'-k');
xlabel('TIME');
ylabel('MIDPOINT ERROR');
legend({'ERROR FOR \Delta TIME_1=75','ERROR FOR \Delta TIME_2=50','ERROR FOR \Delta TIME_3=25','ERROR FOR \Delta TIME_4=10'},'FontSize',6);

clear; clc; format long;
load pr5data.dat;
distance  = pr5data(1:end,1);
voltage = pr5data(1:end,2);

figure (1);
plot(distance /1000, voltage*1000 , '-ob');
xlabel("Distance [km]");
ylabel("Voltage [mV]");
legend("Measured signal level");

% % % % % % % % % % -------- Linear least squares polynomial ------

voltage_1=[];E1=[];
sum1=0;sum2=0;sum3=0;sum4=0;error=0;
for a=1:1:length(distance)
    sum1=sum1+distance(a)^2;
    sum2=sum2+voltage(a);
    sum3=sum3+(distance(a)*voltage(a));
    sum4=sum4+distance(a);

end
a0= ((sum1*sum2)- (sum3*sum4))/ ((length(distance)*sum1)- (sum4^2));
a1= (((length(distance)*sum3)-(sum4*sum2)) / (length(distance)*sum1-(sum4^2)));
    
fprintf("Error for Linear least squares polynomial\n");
for b=1:1:length(distance)
    voltage_1(b)=((a1*distance(b))+a0);
    error=error + (voltage(b)-voltage_1(b))*(voltage(b)-voltage_1(b));
    fprintf("%.10f \n",error);
    E1(b)=error;
end

figure(2);
plot(distance/1000,voltage_1*1000,"-ob");
xlabel("Distance [km]");
ylabel("Voltage [mV]");
legend("Signal level by linear least squares polynomial");
 
% % % % % % % % % % -------- Least squares polynomial of degree 2 ------
sum5=0;sum6=0;sum7=0;sum8=0;sum9=0;sum10=0;sum11=0;sum12=0;error_1=0;
a0a1a2=[];voltage_2=[];E2=[];
for c=1:1:length(distance)
    
    sum5=sum5+(distance(c)^0); % xi^0
    sum6=sum6+(distance(c)^1); % xi^1
    sum7=sum7+(distance(c)^2); % xi^2
    sum8=sum8+(distance(c)^3); % xi^3
    sum9=sum9+(distance(c)^4); % xi^4
    sum10=sum10+(voltage(c)*distance(c)^0);  % yi*xi^0
    sum11=sum11+(voltage(c)*distance(c)^1);  % yi*xi^1
    sum12=sum12+(voltage(c)*distance(c)^2);  % yi*xi^2
    equation_1=[sum5 sum6 sum7;
                sum6 sum7 sum8;
                sum7 sum8 sum9];
    equation_2=[sum10;
                sum11;
                sum12]; 
    a0a1a2=(equation_1)\(equation_2);
end
fprintf("\nError for Least squares polynomial of degree 2\n");
for d=1:1:length(distance)
        voltage_2(d)=a0a1a2(1)+a0a1a2(2)*distance(d)+a0a1a2(3)*(distance(d)^2);
        error_1=error_1+ ((voltage(d)-voltage_2(d))*(voltage(d)-voltage_2(d)));
        fprintf("%.10f\n",error_1);
        E2(d)=error_1;       
end


figure(3);
plot(distance/1000,voltage_2*1000,"-ob");
xlabel("Distance [km]");
ylabel("Voltage [mV]");
legend("Signal level by Least squares polynomial of degree 2");

% % % % % % % % % % -------- Least squares polynomial of degree 3 ------
sum13=0;sum14=0;sum15=0;sum16=0;sum17=0;sum18=0;sum19=0;sum20=0;sum21=0;sum22=0;sum23=0;error_2=0;
a0a1a2a3=[];voltage_3=[];E3=[];
for e=1:1:length(distance)
    sum13=sum13+(distance(e)^0); % xi^0
    sum14=sum14+(distance(e)^1); % xi^1
    sum15=sum15+(distance(e)^2); % xi^2
    sum16=sum16+(distance(e)^3); % xi^3
    sum17=sum17+(distance(e)^4); % xi^4
    sum18=sum18+(distance(e)^5); % xi^5
    sum19=sum19+(distance(e)^6); % xi^6    
    sum20=sum20+(voltage(e)*distance(e)^0);  % yi*xi^0
    sum21=sum21+(voltage(e)*distance(e)^1);  % yi*xi^1
    sum22=sum22+(voltage(e)*distance(e)^2);  % yi*xi^2
    sum23=sum23+(voltage(e)*distance(e)^3);  % yi*xi^3
    equation_1=[sum13 sum14 sum15 sum16;
                sum14 sum15 sum16 sum17;
                sum15 sum16 sum17 sum18;
                sum16 sum17 sum18 sum19];
    equation_2=[sum20;
                sum21;
                sum22;
                sum23]; 
    a0a1a2a3=(equation_1)\(equation_2);
end
fprintf("\nError for Least squares polynomial of degree 3\n");
for f=1:1:length(distance)
        voltage_3(f)=a0a1a2a3(1)+a0a1a2a3(2)*distance(f)+a0a1a2a3(3)*(distance(f)^2)+a0a1a2a3(4)*(distance(f)^3);
        error_2=error_2+ ((voltage(f)-voltage_3(f))*(voltage(f)-voltage_3(f)));
        fprintf("%.10f\n",error_2);
        E3(f)=error_2;        
end

    
figure(4);
plot(distance/1000,voltage_3*1000,"-ob");
xlabel("Distance [km]");
ylabel("Voltage [mV]");
legend("Signal level by Least squares polynomial of degree 3");


figure(5);
plot(distance /1000, voltage*1000 , '-or');
hold on;
plot(distance/1000,voltage_1*1000,"-k");
hold on;
plot(distance/1000,voltage_2*1000,"-xb");
hold on;
plot(distance/1000,voltage_3*1000,"-g");
xlabel("Distance [km]");
ylabel("Voltage [mV]");
legend("Measured signal level","Signal level by linear least squares polynomial","Signal level by Least squares polynomial of degree 2","Signal level by Least squares polynomial of degree 3");

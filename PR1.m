% Clearing Screen
clc
clear;
% Setting x as symbolic variable
syms x;

%-------- Bisection Method-------------

% Simplified function
y(x)= (1/4*pi*(1/(36*pi*(1e-9))))*(((13*(x+7))/(abs(x+7)^3))+((9*(x+4))/(abs(x+4)^3))+((6*(x-11))/(abs(x-11)^3))+((3*(x-14))/(abs(x-14)^3))); 
% Lower Limit
a = (-3); 
% Upper Limit
b = (10);     
% Tolerance Limit
e = (1e-10); 

% Finding Functional Value

fa = y(a);
fb = y(b);

% Implementing Bisection Method
if fa*fb > 0 
    disp('Given initial values do not bracket the root.');
else
    mData=[];                % Array generated for each predicted root calculated.
    err=[];                  % Array holding the computed error for each predicted root.
    iter=1;                  % Iteration number.
    c = (a+b)/2;             % The formula that finds the limit to be used in the next iteration
    fc = y(c);  % Calculation that gives the function value for the new limit
    fprintf('\n\nIteration\t\tLower limit\t\tUpper Limit\t\t\tNew Limit \t\t\tTolerance\n');  % Title of values ​​to show in the command window.
    while abs(fc)>e
        fprintf('%.0f\t\t%11.20f\t\t%11.20f\t\t%11.20f\t\t%11.20f\n',(iter),a,b,c,fc);
        if fa*fc< 0
            b =c;
        else
            a =c;
        end
        mData(iter)=c;
        err(iter)=abs(fc);
        c = (a+b)/2;
        fc = y(c);
        iter=iter+1;
        
    end
    fprintf('\nRoot is: %f\n', c);
end

%--------------Secant method----------------------------------------------

% Simplified function
f(x)=(1/4*pi*(1/(36*pi*(1e-9))))*(((13*(x+7))/(abs(x+7)^3))+((9*(x+4))/(abs(x+4)^3))+((6*(x-11))/(abs(x-11)^3))+((3*(x-14))/(abs(x-14)^3)));
% First Limit
p0=10;
% Second Limit
p1=-3;
% How many iterations will be
iter1=5;
% Tolerance Limit
tol=1e-10;

mData1=[];  % Array generated for each predicted root calculated.
err1=[];    % Array holding the computed error for each predicted root.
i=1;        % Iteration start value.

% Finding Functional Value
f0= f(p0);
f1= f(p1);

fprintf('\n\nIteration\t\tFirst Limit\t\t\tSecond Limit\t\t\tNew Limit \t\t\tTolerance\n');

% Enters the loop that calculates the tolerance and root.
while i<=iter1
    
    p=p1-f1*(p1-p0)/(f1-f0);    % General account formula used in the secand method.
    
    fp=f(p);                    %Calculates the value of the new position in the function.
    
    fprintf('\n%.0f\t\t%11.20f\t\t%11.20f\t\t%11.20f\t\t%11.20f',i,p0,p1,p,fp);
    
    if (f1-f0)==0
        fprintf('The denominator is undefined.');
        break;
        
    else
        if abs(p-p1)<tol 
            break;
        else
            i=i+1;
            p0=p1;
            f0=f1;
            p1=p;
            f1=fp;
        end
        mData1(i)=p;
        err1(i)=abs(fp);
    end  
end
fprintf('\nRoot is:%11.8f\n\n',p);



%------------------Newton-Raphson Method----------------------------

mData2=[];   % Array generated for each predicted root calculated.
err2=[];     % Array holding the computed error for each predicted root
x=3.5;       % Starting Limit.It is written in the instruction that the midpoint should be used.
xe=1e-10;    % Tolerance
iter2=10;    % Iteration number
fprintf('\n\nIteration\t\tNew Limit \t\t\tStarting Limit \t\t\tTolerance\n');

for i1=1:iter2
%----------------------------------------------   
    % Reminder Function 
    f=(1/4*pi*(1/(36*pi*(1e-9))))*(((13*(x+7))/(abs(x+7)^3))+((9*(x+4))/(abs(x+4)^3))+((6*(x-11))/(abs(x-11)^3))+((3*(x-14))/(abs(x-14)^3)));
    % Derivative Function
    df=16777215999/(268435456*abs(x + 4)^3) + 24233756444/(268435456*abs(x + 7)^3) + 5592405333/(134217728*abs(x - 11)^3) + 559240533333/(268435456*abs(x - 14)^3) - (55924053333*sign(x + 4)*(9*x + 36))/(268435456*abs(x + 4)^4) - (559240533333*sign(x - 14)*(3*x - 42))/(268435456*abs(x - 14)^4) - (5592405333333333*sign(x - 11)*(6*x - 66))/(268435456*abs(x - 11)^4) - (5592405333333333*sign(x + 7)*(13*x + 91))/(268435456*abs(x + 7)^4);
%----------------------------------------------   
    x1=x;   
    x=x1-f/df;
    if df==0
        fprintf('The denominator is undefined.');
        break;
    else
        if abs(x-x1)<xe
          fprintf('\nRoot is:%11.8f',x);
          break;
        else
          fprintf('\n%.0f\t\t%11.20f\t\t%11.20f\t\t%11.20f',i1,x,x1,abs(x-x1));   
        end
      mData2(i1)=abs(x);
      err2(i1)=abs(x-x1);  
    end
      
end


% % % All three graphics are shown in the same table.
loglog(mData,err,'-r');
hold on
loglog(mData1,err1,'-b');
hold on
loglog(mData2,err2,'-y');
xlabel('root')
ylabel('error')
legend('Bisection Method','Secant Method','Newton Method');



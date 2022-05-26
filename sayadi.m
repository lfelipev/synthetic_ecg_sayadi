clear all
close all
clc

%Simulation Time;
start_t = 0;
Ts      = 0.0001;
end_t   = 50; % end of simulation time
T = start_t:Ts:end_t;
N = length(T);

HR = 70;      % Heart rate;
RR = 60/HR;    % Duration between R waves

wecg = zeros(1,N);
P_plus = zeros(1,N);
P_minus = zeros(1,N);
C_q = zeros(1,N);
C_r = zeros(1,N);
C_s = zeros(1,N);
T_minus = zeros(1,N);
T_plus = zeros(1,N);

th = zeros(1,N);
z0 = zeros(1,length(T));

RR = 60/70;
%Initialize the x-matrix (state variables)
  x = [ 2*pi/RR 0 0 0 0 0 0 0 -1 0 0]';

RWM = 30;
th = zeros(1,length(T));
for i = 1:N-1
    
    if(i>=200000 && i<=400000)
        RR = 60/140;
    end

[xdot, x] = runkut4_ecg(Ts,x,RR, x(1));

wecg(i+1) = x(1);
P_plus(i+1) = x(2);
P_minus(i+1) = x(3);
C_q(i+1) = x(4);
C_r(i+1) = x(5);
C_s(i+1) = x(6);
T_minus(i+1) = x(7);
T_plus(i+1) = x(8);


x_ecg(i+1) = x(9);
y_ecg(i+1) = x(10);

th(i+1) = atan2(x(10),x(9));


%th(i+1) = atan2(x(2),x(1)) - (-1/3) * pi;
zecg(i+1) = x(2) + x(3) + x(4) + x(5) + x(6) + x(7) + x(8) + x(11);

end

%%
figure(1)
plot(T,zecg,'b')
% axis([0 10 -0.5 2])
clear all
close all
clc

%Simulation Time;
start_t = 0;
Ts      = 0.0001;
end_t   = 5; % end of simulation time
T = start_t:Ts:end_t;
N = length(T);

HR = 70; % Heart rate;
RR = 60/HR;  % Duration between R waves
RWM = 20; % RWM: R-Wave Magnitude

% Initialize state variables
wecg = zeros(1,N);
P_plus = zeros(1,N);
P_minus = zeros(1,N);
C_q = zeros(1,N);
C_r = zeros(1,N);
C_s = zeros(1,N);
T_minus = zeros(1,N);
T_plus = zeros(1,N);
th = zeros(1,length(T));
x_ecg = zeros(1,length(T));
y_ecg = zeros(1,length(T));
z_ecg = zeros(1,length(T));

% Initial state of the state variables
x = [ 2*pi/RR 0 0 0 0 0 0 0 -1 0 0]';

for i = 1:N-1
    
[xdot, x] = runkut4_ecg(Ts,x,RR,RWM);

wecg(i+1) = x(1); % omega

% ECG state variables
P_plus(i+1) = x(2);
P_minus(i+1) = x(3);
C_q(i+1) = x(4);
C_r(i+1) = x(5);
C_s(i+1) = x(6);
T_minus(i+1) = x(7);
T_plus(i+1) = x(8);

% State variables to calculate theta
x_ecg(i+1) = x(9);
y_ecg(i+1) = x(10);

% Values of theta
th(i+1) = atan2(x(10),x(9));

% Synthetic ECG
z_ecg(i+1) = x(2) + x(3) + x(4) + x(5) + x(6) + x(7) + x(8) + x(11);

end

figure(1)
plot(T,z_ecg,'b')
function xdot = equacoes_ecg(x,RR,RWM)

% Initialization Parameters
alfa_ecg = [0.7, 0.8, -1, RWM, -9.5, 0.27, 0.15];
b_ecg = [0.2, 0.1, 0.1, 0.1, 0.1, 0.4, 0.55];
theta_ecg = [-3/8, -1/3, -1/13, 0, 1/15, 2/5, 4/7]*pi;

alpha_w = 1-sqrt(x(9)^2 + x(10)^2);
th = atan2(x(10),x(9));
w = 2*pi/RR;

% Delta theta calcuation
deltap_minus = mod(th - theta_ecg(1) + pi,2*pi)-pi;
deltap_plus = mod(th - theta_ecg(2) + pi,2*pi)-pi;

deltaq = mod(th - theta_ecg(3) + pi, 2*pi)-pi;
deltar = mod(th - theta_ecg(4) + pi, 2*pi)-pi;
deltas = mod(th - theta_ecg(5) + pi, 2*pi)-pi;

deltat_minus = mod(th - theta_ecg(6) + pi, 2*pi)-pi;
deltat_plus = mod(th - theta_ecg(7) + pi, 2*pi)-pi;

% P C T calculation (See Sayadi 2010)
p_minus = (alfa_ecg(1)*w*(deltap_minus)*exp(-(deltap_minus)^2/(2*b_ecg(1)^2)));
p_plus = (alfa_ecg(2)*w*(deltap_plus)*exp(-(deltap_plus)^2/(2*b_ecg(2)^2)));

cq = (alfa_ecg(3)*w*(deltaq)*exp(-(deltaq)^2/(2*b_ecg(3)^2)));
cr = (alfa_ecg(4)*w*(deltar)*exp(-(deltar)^2/(2*b_ecg(4)^2)));
cs = (alfa_ecg(5)*w*(deltas)*exp(-(deltas)^2/(2*b_ecg(5)^2)));

t_minus = (alfa_ecg(6)*w*(deltat_minus)*exp(-(deltat_minus)^2/(2*b_ecg(6)^2)));
t_plus = (alfa_ecg(7)*w*(deltat_plus)*exp(-(deltat_plus)^2/(2*b_ecg(7)^2)));

% dot(P) dot(C) dot(T) calculation
xdot(1) = w; % dot(w)
xdot(2) = -p_minus;
xdot(3) = -p_plus;
xdot(4) = -cq;
xdot(5) = -cr;
xdot(6) = -cs;
xdot(7) = -t_minus;
xdot(8) = -t_plus;
xdot(9) = alpha_w*x(9) - w*x(10); % dot(x)
xdot(10) = w*x(9) + alpha_w*x(10); % dot(y)
xdot(11) = -x(11);













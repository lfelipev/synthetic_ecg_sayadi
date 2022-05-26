function xdot = equacoes_ecg(x,RR, w)

alpha_w = 1-sqrt(x(9)^2 + x(10)^2);
th = atan2(x(10),x(9));

alfa = 0.7;
alfa2 = 0.8;

alfaq = -1;
alfar = 20;
alfas = -9.5;

alfat = 0.27;
alfat2 = 0.15;

b = 0.2;
b2= 0.1;
bq = 0.1;
br = 0.1;
bs = 0.1;
bt = 0.4;
bt2 = 0.55;

omega = 2*pi/RR;
w=th;
delta_p = mod(w - (- 3*pi/8) + pi,2*pi)-pi;
delta_p2 = mod(w - (- pi/3) + pi,2*pi)-pi;

deltaq = mod(w - (- pi/13) + pi, 2*pi)-pi;
deltar = mod(w + pi, 2*pi)-pi;
deltas = mod(w - (pi/15) + pi, 2*pi)-pi;

deltat = mod(w - (2*pi/5) + pi, 2*pi)-pi;
deltat2 = mod(w - (4*pi/7) + pi, 2*pi)-pi;

w=omega;

p = (alfa*w*(delta_p)*exp(-(delta_p)^2/(2*b^2)));
p2= (alfa2*w*(delta_p2)*exp(-(delta_p2)^2/(2*b2^2)));

cq = (alfaq*w*(deltaq)*exp(-(deltaq)^2/(2*bq^2)));
cr = (alfar*w*(deltar)*exp(-(deltar)^2/(2*br^2)));
cs = (alfas*w*(deltas)*exp(-(deltas)^2/(2*bs^2)));

t = (alfat*w*(deltat)*exp(-(deltat)^2/(2*bt^2)));
t2 = (alfat2*w*(deltat2)*exp(-(deltat2)^2/(2*bt2^2)));

%xdot(1) = r*(1-r); % dot(x)
xdot(1) = w; % dot(y)
xdot(2) = -p; % dot(z)
xdot(3) = -p2; % dot(z)
xdot(4) = -cq; % dot(z)
xdot(5) = -cr; % dot(z)
xdot(6) = -cs; % dot(z)
xdot(7) = -t;
xdot(8) = -t2;
xdot(9) = alpha_w*x(9) - omega*x(10); % dot(x)
xdot(10) = omega*x(9) + alpha_w*x(10); % dot(y)
xdot(11) = -x(11);

















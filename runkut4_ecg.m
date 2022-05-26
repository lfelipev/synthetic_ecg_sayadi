function [xdot1, xf] = runkut4_ecg(Ts,x,RR, w)

xdot1 = equacoes_ecg(x,RR, w);
kx1 = Ts*xdot1;
x1 = x + 0.5*kx1';

xdot = equacoes_ecg(x1,RR, w);
kx2 = Ts*xdot;
x1 = x + 0.5*kx2';

xdot = equacoes_ecg(x1,RR, w);
kx3 = Ts*xdot;
x1 = x + kx3';

xdot = equacoes_ecg(x1,RR, w);
kx4 = Ts*xdot;

xf = x + (kx1 + 2*kx2 + 2*kx3 + kx4)'/6;


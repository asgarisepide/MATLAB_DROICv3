%plotting GUI output
clear;
Vrefp = 1.2;
Vrefn=0.195;
bits = 10;
NoLvl=2^bits;


data = importdatafile("data.txt", [1, Inf]);
data_v = (data * (Vrefp-Vrefn)/NoLvl)+Vrefn;

Fs = 1/80e-6;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
col = 1;

[minV,maxV] = bounds(data_v);
Vpp = (maxV - minV)*1000;

figure;
plot(t*1e3,data_v(1:L,col)*1000);
hold on;
plot(t*1e3,data_v(1:L,col+1)*1000);
plot(t*1e3,data_v(1:L,col+2)*1000);
grid on;
%ylim([0,1.2]);
%xlim([0,40]);
title('Output voltage (mV)')
xlabel({'Time','(ms)'})
ylabel({'Voltage','(mV)'})
text(5,640,'\itChannel1');
text(5,500,'\itChannel2');
text(5,380,'\itChannel3');


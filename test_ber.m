close all; clear; clc;
nSym =100000;
snr = []; ue1 = []; ue2 = [];
for SNR = -10:40
    mdl='Power_test.slx';
    load_system(mdl);
    assignin('base','snr',double(SNR));
%     assignin('base','UE1',x(1));
%     assignin('base','UE2',x(2));
    sim(mdl);
    disp(SNR);
    disp(UE1.Data:1);
    disp(UE2.Data:1);
    ue1 = [ue1, UE1.Data:1];
    ue2 = [ue2, UE2.Data:1];
end

semilogy(-10:40, ue1,'b');
hold on;
semilogy(-10:40, ue2,'r');
legend('UE1','UE2');
title('Noma 2 users SNR-BER');
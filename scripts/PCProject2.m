clc
clear
%% steady state 
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U0 = [100; 25; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss, U_ss, Y_ss, DX] = trim('PCProject1', X0, U0, [], IX, IU, IY);
%% steady state +5% F0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U01 = [100 * 1.05; 25; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss1, U_ss1, Y_ss1, DX1] = trim('PCProject1', X0, U01, [], IX, IU, IY);
%% steady state -5% F0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U02 = [100 * 0.95; 25; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss2, U_ss2, Y_ss2, DX2] = trim('PCProject1', X0, U02, [], IX, IU, IY);
%% steady state +5% F_PU
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U03 = [100; 25 * 1.05; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss3, U_ss3, Y_ss3, DX3] = trim('PCProject1', X0, U03, [], IX, IU, IY);
%% steady state -5% F_PU
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U04 = [100; 25 * 0.95; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss4, U_ss4, Y_ss4, DX4] = trim('PCProject1', X0, U04, [], IX, IU, IY);
%% steady state +5% Fc
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U05 = [100 ; 25; 500 * 1.05; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss5, U_ss5, Y_ss5, DX5] = trim('PCProject1', X0, U05, [], IX, IU, IY);
%% steady state -5% Fc
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U06 = [100 ; 25; 500 * 0.95; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss6, U_ss6, Y_ss6, DX6] = trim('PCProject1', X0, U06, [], IX, IU, IY);
%% steady state +5% S0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U07 = [100 ; 25; 500; 142.9 * 1.05];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss7, U_ss7, Y_ss7, DX7] = trim('PCProject1', X0, U07, [], IX, IU, IY);
%% steady state -5% S0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U08 = [100 ; 25; 500; 142.9 * 0.95];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss8, U_ss8, Y_ss8, DX8] = trim('PCProject1', X0, U08, [], IX, IU, IY);
%% steady state +30% F0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U09 = [100 * 1.3; 25; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss9, U_ss9, Y_ss9, DX9] = trim('PCProject1', X0, U09, [], IX, IU, IY);
%% steady state -30% F0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U010 = [100 * 0.7; 25; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss10, U_ss10, Y_ss10, DX10] = trim('PCProject1', X0, U010, [], IX, IU, IY);
%% steady state +30% F_PU
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U011 = [100; 25 * 1.3; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss11, U_ss11, Y_ss11, DX11] = trim('PCProject1', X0, U011, [], IX, IU, IY);
%% steady state -30% F_PU
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U012 = [100; 25 * 0.7; 500; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss12, U_ss12, Y_ss12, DX12] = trim('PCProject1', X0, U012, [], IX, IU, IY);
%% steady state +30% Fc
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U013 = [100 ; 25; 500 * 1.3; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss13, U_ss13, Y_ss13, DX13] = trim('PCProject1', X0, U013, [], IX, IU, IY);
%% steady state -30% Fc
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U014 = [100 ; 25; 500 * 0.7; 142.9];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss14, U_ss14, Y_ss14, DX14] = trim('PCProject1', X0, U014, [], IX, IU, IY);
%% steady state +30% S0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U015 = [100 ; 25; 500; 142.9 * 1.3];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss15, U_ss15, Y_ss15, DX15] = trim('PCProject1', X0, U015, [], IX, IU, IY);
%% steady state -30% S0
X0 = [21.5; 61.6; 9.45; 2.45; 0.49; 3.02; 2.73];   
U016 = [100 ; 25; 500; 142.9 * 0.7];
IX = [];  IU = [1;2;3;4];  IY = [];
[X_ss16, U_ss16, Y_ss16, DX16] = trim('PCProject1', X0, U016, [], IX, IU, IY);
%% normalised gain matrices  ( %out / %in )
Yp05 = [Y_ss1  Y_ss3  Y_ss5  Y_ss7 ];   % +5 %
Ym05 = [Y_ss2  Y_ss4  Y_ss6  Y_ss8 ];   % -5 %
Yp30 = [Y_ss9  Y_ss11 Y_ss13 Y_ss15];   % +30 %
Ym30 = [Y_ss10 Y_ss12 Y_ss14 Y_ss16];   % -30 %
K_p05 = ((Yp05 - Y_ss)./Y_ss) / ( 0.05);
K_m05 = ((Ym05 - Y_ss)./Y_ss) / (-0.05);
K_p30 = ((Yp30 - Y_ss)./Y_ss) / ( 0.30);
K_m30 = ((Ym30 - Y_ss)./Y_ss) / (-0.30);
uname = {'F0','F_PU','F_c','S0'};
yname = {'X','S','B'};
disp('=== +5 % ==='),  disp(array2table(K_p05,'VariableNames',uname,'RowNames',yname))
disp('=== -5 % ==='),  disp(array2table(K_m05,'VariableNames',uname,'RowNames',yname))
disp('=== +30 % ==='), disp(array2table(K_p30,'VariableNames',uname,'RowNames',yname))
disp('=== -30 % ==='), disp(array2table(K_m30,'VariableNames',uname,'RowNames',yname))
%% linearization 
[A, B, C, D] = linmod('PCProject1', X_ss, U_ss); 
G   = ss(A, B, C, D);
Gtf = tf(G);
Kss = dcgain(G)
%% transfer functions
G11 = Gtf(1,1)
G12 = Gtf(1,2)
G13 = Gtf(1,3)
G14 = Gtf(1,4)
G21 = Gtf(2,1)
G22 = Gtf(2,2)
G23 = Gtf(2,3)
G24 = Gtf(2,4)
G31 = Gtf(3,1)
G32 = Gtf(3,2)
G33 = Gtf(3,3)
G34 = Gtf(3,4)
Gall  = {G11 G12 G13 G14; G21 G22 G23 G24; G31 G32 G33 G34};
uname = {'F0','F_PU','F_c','S0'};
yname = {'X','S','B'};
fprintf('\n--- poles and zeros of each transfer function ---\n');
for i = 1:3
    for j = 1:4
        fprintf('G(%-2s <- %-5s): %d zeros , %d poles , K = %11.4g\n', ...
            yname{i}, uname{j}, numel(zero(Gall{i,j})), ...
            numel(pole(Gall{i,j})), dcgain(Gall{i,j}));
    end
end
G11ZPK = zpk(G11)
G22ZPK = zpk(G22)
G33ZPK = zpk(G33)
G11
G22
G33
%% half rule + PI tuning
%  loop 1 : X <- F0     loop 2 : S <- F_PU     loop 3 : B <- F_c
Gloop = {G11, G22, G33};
res   = zeros(3,8);
for i = 1:3
    [K, tau, td] = halfrule(Gloop{i});
    tau_c    = td;                          
    Kc_IMC   = (1/K)*tau/(tau_c + td);      
    tauI_IMC = min(tau, 4*(tau_c + td));    
    Kc_ZN    = (0.9/K)*(tau/td);            
    tauI_ZN  = 3.33*td;
    res(i,:) = [K tau td td/tau Kc_IMC tauI_IMC Kc_ZN tauI_ZN];
end
PI_table = table(res(:,1),res(:,2),res(:,3),res(:,4), ...
                 res(:,5),res(:,6),res(:,7),res(:,8), ...
 'VariableNames',{'K','tau_h','td_h','td_over_tau', ...
                  'Kc_IMC','tauI_IMC_h','Kc_ZN','tauI_ZN_h'}, ...
 'RowNames',{'X_F0','S_FPU','B_Fc'})
fprintf('\n--- Simulink PID block settings ---\n');
for i = 1:3
    fprintf('%-6s  IMC:  P = %10.5g   I = %10.5g\n', PI_table.Properties.RowNames{i}, ...
            res(i,5), res(i,5)/res(i,6));
    fprintf('%-6s  Z-N:  P = %10.5g   I = %10.5g\n', PI_table.Properties.RowNames{i}, ...
            res(i,7), res(i,7)/res(i,8));
end
%% feedforward controller 
Gd = G24;                                    
Gp = G22;                                    
[Kd, taud, thd] = halfrule(Gd);
[Kp, taup, thp] = halfrule(Gp);
Kf   = -Kd/Kp;                               
tau1 = taup + max(0, thp - thd);             
tau2 = taud;                                 
if tau2 < 0.1*tau1, tau2 = 0.1*tau1; end     
Gff = tf(Kf*[tau1 1], [tau2 1])
fprintf('Kf = %.5g   tau1 = %.4f h   tau2 = %.4f h\n', Kf, tau1, tau2);
%% local function 
function [K, tau, td] = halfrule(g)
    K = dcgain(g);
    p = pole(g);
    t = sort(1./abs(real(p)), 'descend'); 
    z = zero(g);
    zr = z(real(z) > 0); 
    tz = sum(1./real(zr)); 
    if numel(t) == 1
        tau = t(1);
        td = tz;
    else
        tau = t(1) + t(2)/2; 
        td = t(2)/2 + sum(t(3:end)) + tz;
    end
    td = td + sum(g.InputDelay) + sum(g.OutputDelay);
end
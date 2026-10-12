clc
clear
%% Variables
X = 21.5066564396397;
S = 61.6246329506498;
B = 9.44585785232475;
A = 2.44473177554800;
E = 0.491745288474893;
BA = 3.01943696537133;
AA = 2.73422289591667;
F0   = 100;
F_PU = 25;
F_c  = 500;   
S0   = 142.9;
%% Parameters
V = 300;
mu_m = 0.35;
K_S  = 21.14;     
K_AA = 10.10;
K_BA = 15.9;
k1=0.35;
k2=0.59;
k3=89.0;
k4=0.45;
k5=0.11;
k6=0.5;
k7=0.39;
k8=0.19;
k9=0.9;
k10=0.22;
k11=0.059;
k14=2.0;
k15=2.2;
beta = 0.02;
Ru = 1000;
MW_W=18.015;
MW_S=180.156;
MW_B=74.122;
MW_A=58.080;
MW_E=46.069;
MW_BA=88.106;
MW_AA=60.052;
% Psat(at 310.15K)) / P_flash
K_B_th  = 0.3082942712;   
K_A_th  = 7.72314764;
K_E_th  = 2.359811019;
K_BA_th = 0.05036190447;
K_AA_th = 0.6153525956;
K_W_th  = 0.97187749;
T_flash = 310.15;
%% Kinetic
S_mmol  = (S / MW_S) * 1000;
BA_mmol = (BA / MW_BA) * 1000;
AA_mmol = (AA / MW_AA) * 1000;
BBA = B + BA;
if BBA <= 8.0
    f_I = exp(-0.01 * BBA);
elseif BBA <= 13.9
    f_I = -0.153 * BBA + 2.16;
else
    f_I = 0.0333;
end
r_X  = mu_m * (S_mmol/(S_mmol+K_S)) * f_I * X;
r_S_mmol  = k3*r_X + k4*X + k1*(S_mmol/(S_mmol+K_S))*(BA_mmol/(BA_mmol+K_BA))*X + k2*(S_mmol/(S_mmol+K_S))*(AA_mmol/(AA_mmol+K_AA))*X;
r_BA_mmol = k5*(k3*r_X+k4*X) - k6*(BA_mmol/(BA_mmol+K_BA))*(S_mmol/(S_mmol+K_S))*X;
r_AA_mmol = k8*(k3*r_X+k4*X) - k9*(AA_mmol/(AA_mmol+K_AA))*(S_mmol/(S_mmol+K_S))*X;
r_B_mmol  = k7*(k3*r_X+k4*X) + k14*(BA_mmol/(BA_mmol+K_BA))*(S_mmol/(S_mmol+K_S))*X;
r_A_mmol  = k10*(k3*r_X+k4*X) + k15*(AA_mmol/(AA_mmol+K_AA))*(S_mmol/(S_mmol+K_S))*X;
r_E_mmol  = k11*(k3*r_X+k4*X);
r_S  = r_S_mmol*(MW_S/1000);
r_BA = r_BA_mmol*(MW_BA/1000);
r_AA = r_AA_mmol*(MW_AA/1000);
r_B  = r_B_mmol*(MW_B/1000);
r_A  = r_A_mmol*(MW_A/1000); 
r_E  = r_E_mmol*(MW_E/1000);
%% Flash Tank Calculations
S_c=S;
B_c=B;
A_c=A;
E_c=E;
BA_c=BA;
AA_c=AA;
X_c = X/(1-beta);
W_c = Ru - (X_c+S_c+B_c+A_c+E_c+BA_c+AA_c);
MWv = [MW_B,   MW_A,   MW_E,   MW_BA,   MW_AA,   MW_W  ];
Kv0 = [K_B_th, K_A_th, K_E_th, K_BA_th, K_AA_th, K_W_th];
Ic  = [B_c,    A_c,    E_c,    BA_c,    AA_c,    W_c   ];
c_molar      = Ic ./ MWv;
C_feed_molar = sum(c_molar);
zfeed        = c_molar / C_feed_molar;
function gamma6 = uniquac_gamma(x6, T)            
xv  = x6;
xv  = xv/sum(xv);  
r = [3.45420002937317, 2.57340002059937, 2.10540008544922, 3.55110001564026, 2.20230007171631, 0.920000016689301];
q = [3.05200004577637, 2.33590006828308, 1.97200000286102, 3.15190005302429, 2.07200002670288, 1.39970004558563];
    Aij = [
         0.000, -198.659,   75.355,    77.603,  -157.201,   727.385;
       453.669,    0.000,   94.242,  -500.369,  -552.448,   -52.302;
       -38.707,   98.752,    0.000,    24.035,   122.362,   232.009;
       -89.222,  824.084,    5.533,     0.000,   392.072,   316.019;
       177.104, 1082.940, -162.724,  -209.441,     0.000,  -305.452;
       -36.265,  601.612,   50.885,   132.540,   427.741,     0.000
   ];
z_coord  = 10;
n = 6;
tau = ones(n,n);
for i = 1:n
    for j = 1:n
        if i ~= j
            tau(i,j) = exp(-Aij(i,j)/(T * 1.98721)); 
        end
    end
end
Vi   = r ./ sum(r.*xv);
Fi = q ./ sum(q.*xv);
lnC = log(Vi) + 1 - Vi - (z_coord/2).*q.*( log(Vi./Fi) + 1 - Vi./Fi );
lnR = zeros(1,n);
for i = 1:n
    s1 = sum(q.*xv .* tau(:,i)') ./ sum(q.*xv);
    s2 = 0;
    for j = 1:n
        s2 = s2 + q(j) .* xv(j) .* tau(i,j) / sum(q.*xv .* tau(:,j)');
    end
    lnR(i) = q(i)*(1 - log(s1) - s2);
end
gamma6 = exp(lnC+lnR);         
end
gamma = ones(1,6);
x_i   = zfeed;
tol_outer = 1e-12; max_outer = 200;
for outer = 1:max_outer
    Kv = gamma .* Kv0;
    bubble_sum = sum(zfeed .* Kv);
    tol = 1e-12; max_iter = 200;
    if bubble_sum <= 1
        v = 0; 
    else
        v = 0.01;
        for iter = 1:max_iter
            f  = sum( zfeed.*(Kv-1) ./ (1+v*(Kv-1)) );
            fp = sum( -zfeed.*(Kv-1).^2 ./ (1+v*(Kv-1)).^2 );
            dv = -f/fp; v_new = v+dv;
            if v_new<=0, v_new=v/2; end
            if v_new>=1, v_new=(v+1)/2; end
            if abs(v_new-v)<tol, v=v_new; break; end
            v = v_new;
        end
    end
    x_i_new = zfeed ./ (1+v*(Kv-1));
    x_i_new = x_i_new / sum(x_i_new);
    gamma_new = uniquac_gamma(x_i_new, T_flash);
    if max(abs(gamma_new-gamma)) < tol_outer
        gamma = gamma_new; x_i = x_i_new;
        break
    end
    gamma = gamma_new; x_i = x_i_new;
end
y_i = zfeed .* Kv ./ (1 + v*(Kv-1));
y_i = y_i / sum(y_i); 
n_dot_feed = F_c * C_feed_molar;  
m_dot_V = (v * n_dot_feed) * sum(y_i .* MWv); 
m_dot_L = ((1 - v) * n_dot_feed) * sum(x_i .* MWv);
rho_const = sum(c_molar .* MWv); 
F_v = m_dot_V / rho_const; 
F_r = m_dot_L / rho_const; 
C_r_molar = (x_i .* (1 - v) .* n_dot_feed) ./ F_r; 
Ir_volatiles = C_r_molar .* MWv; 
B_r  = Ir_volatiles(1); 
A_r  = Ir_volatiles(2); 
E_r  = Ir_volatiles(3); 
BA_r = Ir_volatiles(4); 
AA_r = Ir_volatiles(5);
X_r = X_c * (F_c / F_r);
S_r = S_c * (F_c / F_r);
F_P = F0 - F_PU - F_v;
F   = F_P / beta;
F_re = F - F_P - F_c;
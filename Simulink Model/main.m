clear all
%sc mass properties
I_sc=[2 0 0; 0 1 0; 0 0 1.6].*10^3;
m_sc=1e03;
I_bold_sc=[I_sc zeros(3,3); zeros(3,3) m_sc*eye(3)];

%asteroid mass properties
I_rb=eye(3);
mu=94; %m^3/s^2
m_rb=mu/(6.67*(10^(-11)));
C20=-0.1;
C22=0.04;
ae=400; %m
I_bold_rb=[I_rb zeros(3,3); zeros(3,3) m_rb*eye(3)];

%rb initial position/attitude and velocities
A_rb0=eye(3);
wt=2.9089e-04; %s^-1
ang_vel_0_rb=[0 0 wt]';
r_rb=[1 0 0]';
v_rb=[0 0 0]';
eps_rb0=[ang_vel_0_rb;v_rb];
g_rb0=[A_rb0 r_rb; zeros(1,3) 1];
%
alfa_rh=[0.9659 0 -0.2588]';
beta_rh=[0.067 0.9659 0.25]';
gamma_rh=[0.25 -0.2588 0.933]';
R_rh=500*[0.9798 0 0.2]'; %m
%hovering 
A_rh=[alfa_rh beta_rh gamma_rh]'; 
r_rh=A_rh*R_rh;
g_rh=[A_rh r_rh; zeros(1,3) 1];
%desired trajectory
g_d=g_rh;
eps_d=zeros(6,1);
eps_d_dot=zeros(6,1);
%initial relative state
A_r0=A_rh*[cos(pi/9) -sin(pi/9) 0; sin(pi/9) cos(pi/9) 0; 0 0 1]*[cos(-pi/20) 0 sin(-pi/20); 0 1 0; -sin(-pi/20) 0 cos(-pi/20)]*[1 0 0; 0 cos(pi/18) -sin(pi/18); 0 sin(pi/18) cos(pi/18)];
r_r0=r_rh+[200 100 250]';%m
g_r0=[A_r0 r_r0; zeros(1,3) 1];
eps_r0=[-0.06 0.05 0.09 -1 2 1.5]';
%sc initial position/attitude and velocities
%A_sc=eye(3);
% ang_vel_sc_0=[0 0 0]';
% r_sc=[1 0 0]';
% v_sc=[0 0 0]';
g_sc0=g_rb0*g_r0;
A_inv=A_r0\eye(3);
Ad_g_r0_inv=[A_inv zeros(3,3); lie_cross(-A_inv*r_r0)*A_inv A_inv];
eps_sc=eps_r0+Ad_g_r0_inv*eps_rb0;%[ang_vel_sc_0;v_sc];
sim('model_6DOF.slx')
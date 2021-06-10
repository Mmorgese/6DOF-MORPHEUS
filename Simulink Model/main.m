clear all
%sc mass properties
I_sc=eye(3);
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

%sc initial position/attitude and velocities
A_sc=eye(3);
ang_vel_sc_0=[0 0 0]';
r_sc=[1 0 0]';
v_sc=[0 0 0]';
eps_sc=[ang_vel_sc_0;v_sc];

%rb initial position/attitude and velocities
A_rb=eye(3);
wt=2.9089e-04; %s^-1
ang_vel_0_rb=[0 0 wt]';
r_rb=[1 0 0]';
v_rb=[0 0 0]';
eps_rb=[ang_vel_0_rb;v_rb];

sim('model_6DOF.slx')
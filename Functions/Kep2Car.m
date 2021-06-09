function [rr,vv]= Kep2Car(a,e,i,OM,om,theta,mu)

% Function converts from Cartesian to Keplerian elements
% 
% PROTOTYPE
%     [rr,vv]= Elements2Keplerian(a,e,i,OM,om,theta,mu)
% 
% INPUT
%     a[1]           Semimajor axis [km]
%     e[1]           Eccentricty [-]
%     i[1]           Inclination of the orbit [rad]
%     OM[1]          Right ascension of node axis [rad]
%     om[1]          Pericentre anomaly [rad]
%     theta[1]       True anomaly [rad]
%
% OUTPUT
%     rr[3,1]        Position of s/c (rx ry rz) [km]
%     vv[3,1]        Velocity of s/c (vx vy vz) [km/s]
%
% CONTRIBUTORS
%     Alessio Quinci
% 

ROM=[cos(OM),sin(OM),0;-sin(OM),cos(OM),0;0,0,1];
Ri=[1,0,0;0,cos(i),sin(i);0,-sin(i),cos(i)];
Rom=[cos(om),sin(om),0;-sin(om),cos(om),0;0,0,1];
Tcar2par=Rom*Ri*ROM;
Tpar2car=Tcar2par';
p=a.*(1-e^2);
r=p./(1+e.*cos(theta));

rrpf=r.*[cos(theta);sin(theta);0];
vvpf=sqrt(mu/p).*[-sin(theta);e+cos(theta);0];
Rth=[cos(theta),sin(theta),0;-sin(theta),cos(theta),0;0,0,1];
A_LN=Rth*Tcar2par;

rr=Tpar2car*rrpf;
vv=Tpar2car*vvpf;
end
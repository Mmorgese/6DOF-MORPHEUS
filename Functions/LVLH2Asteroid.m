function A_AL=LVLH2Asteroid(t)

% In first approximation let's take 10 hours as asteroid rotational period
% [REF: http://adsabs.harvard.edu/full/1973A%26A....28..441I]. Moreover
% let's put axis rotation coincident with z-axis at this stage. At time t=0
% Asteroid fixed RF coincides with LVLH, it evolves and returns to be
% coincident after 10 hours. Input is time in seconds.

omega=2*pi/(10*3600);   % [rad/s]
A_AL=[cos(omega*t),sin(omega*t),0;...
     -sin(omega*t),cos(omega*t),0;...
           0,          0,       1];
end
function PlotOrbit(Elements)
a=Elements(:,1);
e=Elements(:,2);
i=deg2rad(Elements(:,3));
OM=deg2rad(Elements(:,4));
om=deg2rad(Elements(:,5));
theta=deg2rad(Elements(:,6));
RR=[];
for k=1:length(Elements)
[rr,vv]= Kep2Car(a(k),e(k),i(k),OM(k),om(k),theta(k),astroConstants(4));
RR=[RR;rr'];
end
plot3(RR(:,1),RR(:,2),RR(:,3))
grid on
axis equal
end
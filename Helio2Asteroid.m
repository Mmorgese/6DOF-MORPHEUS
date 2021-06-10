% Author: Alessio Quinci

clear, clc, close all
addpath Functions

[Elements]=readEphemeris('2021JE1.csv');
PlotOrbit(Elements)

A_LN=Helio2LVLH(Elements);
A_AL=LVLH2Asteroid(3600);

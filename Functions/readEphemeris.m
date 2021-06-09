function [Elements]=readEphemeris(filename)

% This function reads JPL ephemeris when put on csv file (Excel). Copy and
% paste data block into an Excel file CSV.

DATA = csvread(filename,0,2);
Elements=DATA(:,[10, 1, 3, 4, 5, 9]); % [km, -, deg, deg, deg, deg]

end
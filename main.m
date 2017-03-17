clc;
close all;
clear;

% 001.jpg - 002.jpg (normal, blue, normal width)
name = 'Non-speeding car'; 
[speedResult, speed, width, size] = calc('001.jpg', '002.jpg');
fprintf('%s / %s (%i MPH ) / %s (%2.2f M) \n', name, speedResult, speed, size, width)
% resets
clc;
close all; % close figures
clear;     % reset variables

imageloc = 'images/';

% 001.jpg - 002.jpg (normal, blue, normal width)
name = 'Non-speeding car'; 
[speedResult, speed, width, size] = calc(strcat(imageloc, '001.jpg'), strcat(imageloc, '002.jpg'));
fprintf('%16s / %16s (%6.2f) / %12s (%4.2f) \n', name, speedResult, speed, size, width)

          

                                
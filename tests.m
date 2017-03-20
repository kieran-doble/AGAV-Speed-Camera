clc;
clear;

% Image 1 & 2 
name = 'image: 1 & 2'; 
[speed, speedText, size, width] = controller('001.jpg', '002.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ')

% Image 1 & 3 
name = 'image: 1 & 3'; 
[speed, speedText, size, width] = controller('001.jpg', '003.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ')

% Image oversized & oversized
name = 'image: oversized & oversized '; 
[speed, speedText, size, width] = controller('oversized.jpg', 'oversized.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ')

% Image fire01 & fire02 
name = 'image: fire01 & fire02'; 
[speed, speedText, size, width] = controller('fire01.jpg', 'fire02.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                %Additional Tests%
%{                                
% Image 1 & 5 
name = 'image: 1 & 5'; 
[speed, speedText, size, width] = controller('001.jpg', '005.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ')

% Image 1 & 10 
name = 'image: 1 & 10'; 
[speed, speedText, size, width] = controller('001.jpg', '010.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ') 
                               % Image oversized & 11 
name = 'image: oversized & 11'; 
[speed, speedText, size, width] = controller('oversized.jpg', '011.jpg');
fprintf('%s | %iMPH %s  | %2.2fM %s \n', name, speedText, speed, size, width)
display(' ')
%}                                

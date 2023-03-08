clear 
clc
close

n = figure(1);
set(gcf, 'Position',  [20, 70, 700, 670])

% color
c1 = [0 .7 .7];
% point size
sz = 35;
% shape: "+", "*", ".", and "x"
shape = "filled";

pt_x1 = 0;
pt_y1 = 30;
scatter(pt_x1,pt_y1,sz,c1,shape)
hold on;

pt_x2 = 30;
pt_y2 = -30;
scatter(pt_x2,pt_y2,sz,c1,shape)
hold on;

pt_x3 = -30;
pt_y3 = -30;
scatter(pt_x3,pt_y3,sz,c1,shape)
hold on;

axis([-40 40 -40 40])
% axis equal
title(['Chaos game: Sierpinski triangle']);
% remove ticks if necessary
% xticks([])
% yticks([])

% text point 1
txt1 = '1';
text(pt_x1 -0.8, pt_y1 +3.5, txt1);

% text point 2
txt2 = '2';
text(pt_x2 +2.8, pt_y2 +0.3, txt2);

% text point 3
txt3 = '3';
text(pt_x3 -4, pt_y3 +0.2, txt3);

pt_x = [pt_x1, pt_x2, pt_x3]; 
pt_y = [pt_y1, pt_y2, pt_y3];

%% While Loop


% size of the loops
biLo = 900; % big loop: the entire animation
smLo = 50;  % small loop: number of points at a time

rand_x = randi([-30,30],1,1);
rand_y = randi([-30,30],1,1);

seq_x(1,30) = 0;
seq_y(1,30) = 0;

for j = 1:biLo
    
    for i = 1:smLo
        r = randi([1,3],1,1);

        x1 =  (rand_x + pt_x(r)) / 2;
        y1 =  (rand_y + pt_y(r)) / 2;
        
        seq_x(i) = x1;
        seq_y(i) = y1;
        
        rand_x = x1;
        rand_y = y1;
        
        if ishandle(n) == false
            break;
        end
    end
    color = seq_x;
    scatter(seq_x, seq_y,[],color, '.');
    
    drawnow limitrate
        
    if ishandle(n) == false
        break;
    end

end

% video = VideoWriter('Anime.avi','MPEG-4');
% video.FrameRate = 60;
% open(video)
% writeVideo(video,F);
% close(video)











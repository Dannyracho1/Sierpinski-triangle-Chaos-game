clear 
clc
close

n = figure(1);
set(gcf, 'Position',  [20, 70, 700, 670])

% color
c = [0 .7 .7];
% point size
sz = 35;
% shape: "+", "*", ".", and "x"
shape = "filled";

vertex_x1 = 30;
vertex_y1 = 30;
scatter(vertex_x1,vertex_y1,sz,c,shape)
hold on;

vertex_x2 = 30;
vertex_y2 = -30;
scatter(vertex_x2,vertex_y2,sz,c,shape)
hold on;

vertex_x3 = -30;
vertex_y3 = -30;
scatter(vertex_x3,vertex_y3,sz,c,shape)
hold on;

vertex_x4 = -30;
vertex_y4 = 30;
scatter(vertex_x4,vertex_y4,sz,c,shape)
hold on;

axis([-40 40 -40 40])
% axis equal
title(['Chaos game: Square']);
% remove ticks if necessary
xticks([])
yticks([])

% text point 1
txt1 = '1';
text(vertex_x1 +2.8, vertex_y1 +0.3, txt1);

% text point 2
txt2 = '2';
text(vertex_x2 +2.8, vertex_y2 +0.3, txt2);

% text point 3
txt3 = '3';
text(vertex_x3 -4, vertex_y3 +0.2, txt3);

% text point 4
txt3 = '4';
text(vertex_x4 -4, vertex_y4 +0.2, txt3);

vertex_x = [vertex_x1, vertex_x2, vertex_x3 vertex_x4]; 
vertex_y = [vertex_y1, vertex_y2, vertex_y3 vertex_y4];

%% While Loop

% size of the loops
biLo = 50; % big loop: the entire animation
smLo = 300;  % small loop: number of points at a time

rand_x = randi([-30,30],1,1);
rand_y = randi([-30,30],1,1);

r = 0;
seq_x(1,smLo) = 0;
seq_y(1,smLo) = 0;

% choose a pattern from 1 to 5
num = 3;

for j = 1:500

    curr(1,smLo) = 0;
    
    for i = 2:smLo
        % space between random point and vertex (1/2, 2/3 etc.)
        space = 1/2;
        
        switch num
            case 1
                r = randi([1,4],1,1);
            case 2
                x = setdiff(1:4, r);
                r = x(randi(numel(x)));
            case 3
                if (r == 1)
                    r = 4;
                else
                    r = r-1;
                end
                x = setdiff(1:4, r);
                r = x(randi(numel(x)));
            case 4
                if (r == 1)
                    r = 3;
                elseif (r == 3)
                    r = 1;
                elseif (r == 2)
                    r = 4;
                else
                    r = 2;
                end
                x = setdiff(1:4, r);
                r = x(randi(numel(x)));
            case 5
                if (curr(i) == curr(i-1))
                    if (r == 1)
                        r = 3;
                    elseif (r == 3)
                        r = 1;
                    elseif (r == 2)
                        r = 4;
                    else
                        r = 2;
                    end
                else
                    r = randi([1,4],1,1);
                end
            case 6
                if(i == 2)
                    vertex_x(end+1) = 0;
                    vertex_y(end+1) = 0;
                end
                r = randi([1,5],1,1);
                space = 1/2;
            otherwise
                msg = 'Invalid start!';
                error(msg)
        end
        
        % [distance, r] = cases(num, curr);
        x1 =  (rand_x + vertex_x(r)) * space;
        y1 =  (rand_y + vertex_y(r)) * space;
        
        curr(i+1) = r;
        seq_x(i+1) = x1;
        seq_y(i+1) = y1;
        
        rand_x = x1;
        rand_y = y1;
        
        if ishandle(n) == false
            break;
        end
    end
    color = seq_x;
    scatter(seq_x, seq_y,[],color ,'.');
    
    drawnow limitrate
    
    vertex_x = [vertex_x1, vertex_x2, vertex_x3 vertex_x4]; 
    vertex_y = [vertex_y1, vertex_y2, vertex_y3 vertex_y4];

    if ishandle(n) == false
        break;
    end

end


function[distance, current] = cases(num, curr)

    r = curr(end-1);
    switch num
        case 1
            r = randi([1,4],1,1);
        case 2
            x = setdiff(1:4, r);
            r = x(randi(numel(x)));
        case 3
            if (r == 1)
                r = 4;
            else
                r = r-1;
            end
            x = setdiff(1:4, r);
            r = x(randi(numel(x)));
        case 4
            if (r == 1)
                r = 3;
            elseif (r == 3)
                r = 1;
            elseif (r == 2)
                r = 4;
            else
                r = 2;
            end
            x = setdiff(1:4, r);
            r = x(randi(numel(x)));
        case 5
            if (curr(end) == curr(end-1))
                if (r == 1)
                    r = 3;
                elseif (r == 3)
                    r = 1;
                elseif (r == 2)
                    r = 4;
                else
                    r = 2;
                end
            else
                r = randi([1,4],1,1);
            end
        otherwise
            msg = 'Invalid start!';
            error(msg)
    end
    
    distance = 0.5;
    current = r;

end

% video = VideoWriter('Anime.avi','MPEG-4');
% video.FrameRate = 60;
% open(video)
% writeVideo(video,F);
% close(video)











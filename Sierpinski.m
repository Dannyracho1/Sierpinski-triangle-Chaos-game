clear 
clc
close

n = figure(1);
set(gcf, 'Position',  [20, 70, 700, 670])

% color
c = linspace(-40,40,length(10));
% point size
sz = 35;
% shape: "+", "*", ".", and "x"
shape = "filled";

pt_x1 = 0;
pt_y1 = 30;
scatter(pt_x1,pt_y1,sz,c,shape)
hold on;

pt_x2 = 30;
pt_y2 = -30;
scatter(pt_x2,pt_y2,sz,c,shape)
hold on;

pt_x3 = -30;
pt_y3 = -30;
scatter(pt_x3,pt_y3,sz,c,shape)
hold on;

axis([-40 40 -40 40])
% axis equal
title(['Sierpinski triangle']);
% remove ticks if necessary
xticks([])
yticks([])

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

% Where should the starting point be at?

num = 2;
switch num
    case 1
        rand_x = randi([-30,30],1,1);
        rand_y = randi([-30,30],1,1);
    case 2
        rand_x = 0;
        rand_y = 0;
    otherwise
        msg = 'Invalid start!';
        error(msg)
end

for j = 1:200
    
    for i = 1:100
        r = randi([1,3],1,1);

        x1 =  (rand_x + pt_x(r)) / 2;
        y1 =  (rand_y + pt_y(r)) / 2;
        
        if (r == 1)
            props = {'LineStyle','none',...
                      'Marker','.',...
                      'Color',[0.6350 0.0780 0.1840],...
                      'MarkerSize',6};
        elseif (r == 2)
            props = {'LineStyle','none',...
                      'Marker','.',...
                      'Color',[0.4660 0.6740 0.1880],...
                      'MarkerSize',6};
        elseif (r == 3)
            props = {'LineStyle','none',...
                      'Marker','.',...
                      'Color',[0.3010 0.7450 0.9330],...
                      'MarkerSize',6};
        end
        
        line([x1,x1],[y1,y1],props{:});
        % scatter(x1, y1, sz, c, shape);
        rand_x = x1;
        rand_y = y1;
        if ishandle(n) == false
            break;
        end
    end
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











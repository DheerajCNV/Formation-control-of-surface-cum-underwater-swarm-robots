clc, close all;

for k = 1:length(t_out)
    clf
    xb_anime = x_b(k);
    yb_anime = y_b(k);
   
    hold on;

    plot(xb_anime,yb_anime,'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G1
    plot([0;xb_anime], [0;yb_anime],'r','LineWidth',2) % plots leg2
    
    grid on
    axis equal;
    xlim([-2.5,2.5]);
    ylim([-2,2])
    drawnow;
end

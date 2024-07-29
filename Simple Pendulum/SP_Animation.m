clc, close all;

figh = figure;

for k = 1:length(tspan)
    clf
   
    hold on;

    plot(x_b(1,k),y_b(1,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G1
    plot(x_b(2,k),y_b(2,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G2
    plot(x_b(3,k),y_b(3,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G3
    plot(x_b(4,k),y_b(4,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G4
    plot(x_b(5,k),y_b(5,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G5
    plot(x_b(6,k),y_b(6,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G6
    plot(x_b(7,k),y_b(7,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G7
    plot(x_b(8,k),y_b(8,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G8
    plot(x_b(9,k),y_b(9,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G9
    plot(x_b(10,k),y_b(10,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G10
    plot(x_b(11,k),y_b(11,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G11
    plot(x_b(12,k),y_b(12,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G12
    plot(x_b(13,k),y_b(13,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G13
    plot(x_b(14,k),y_b(14,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','b','MarkerEdgeColor','g'); % plots G14
    plot(x_b(15,k),y_b(15,k),'Marker','o','MarkerSize',7,'MarkerFaceColor','g','MarkerEdgeColor','g'); % plots G15
    
    plot([0;x_b(1,k)], [0;y_b(1,k)],'r','LineWidth',0.5) % plots 1
    plot([0;x_b(2,k)], [0;y_b(2,k)],'r','LineWidth',0.5) % plots 2
    plot([0;x_b(3,k)], [0;y_b(3,k)],'r','LineWidth',0.5) % plots 3
    plot([0;x_b(4,k)], [0;y_b(4,k)],'r','LineWidth',0.5) % plots 4
    plot([0;x_b(5,k)], [0;y_b(5,k)],'r','LineWidth',0.5) % plots 5
    plot([0;x_b(6,k)], [0;y_b(6,k)],'r','LineWidth',0.5) % plots 6
    plot([0;x_b(7,k)], [0;y_b(7,k)],'r','LineWidth',0.5) % plots 7
    plot([0;x_b(8,k)], [0;y_b(8,k)],'r','LineWidth',0.5) % plots 8
    plot([0;x_b(9,k)], [0;y_b(9,k)],'r','LineWidth',0.5) % plots 9
    plot([0;x_b(10,k)], [0;y_b(10,k)],'r','LineWidth',0.5) % plots 10
    plot([0;x_b(11,k)], [0;y_b(11,k)],'r','LineWidth',0.5) % plots 11
    plot([0;x_b(12,k)], [0;y_b(12,k)],'r','LineWidth',0.5) % plots 12
    plot([0;x_b(13,k)], [0;y_b(13,k)],'r','LineWidth',0.5) % plots 13
    plot([0;x_b(14,k)], [0;y_b(14,k)],'r','LineWidth',0.5) % plots 14
    plot([0;x_b(15,k)], [0;y_b(15,k)],'r','LineWidth',0.5) % plots 15

    grid on
    axis equal;
    ylim([-l_mat(end),0]);
    xlim([-l_mat(end),l_mat(end)])
    drawnow;
end

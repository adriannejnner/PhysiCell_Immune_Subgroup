y3month = [250 250 225]; %https://www.researchgate.net/figure/Bronchioles-become-smaller-in-their-cross-sectional-area-and-diameter-with-age_fig2_342475455
y22momth = [234 218 215 213];
terminal_bronchiole = [160 100 90 58 NaN NaN NaN]; %https://www.researchgate.net/figure/Diameter-of-the-small-airways-and-equivalent-number-of-erosion-for-elimination_tbl1_236085075

figure
hold on 
boxplot([[y3month y22momth];[terminal_bronchiole]]')
plot(normrnd(1,0.05,1,length([y3month])),[y3month],'o','Color',[0.5 0.5 0.5],'LineWidth',2)
plot(normrnd(1,0.05,1,length([y22momth])),[y22momth],'o','Color',[0.5 0.5 0.5],'LineWidth',2)
plot(normrnd(2,0.05,1,length([terminal_bronchiole])),[terminal_bronchiole],'o','Color',[0.5 0.5 0.5],'LineWidth',2)
ylabel('Diameter ({\mu}m)')
set(gca,'FontSize',18)
set(gca,'xticklabel',{'Bronchi','Bronchioles'})
hold on 
plot(1,225,'.','MarkerSize',40)
plot(2,95,'.','MarkerSize',40)
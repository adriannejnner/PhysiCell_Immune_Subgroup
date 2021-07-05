load('simulated_data.mat')
timetotal = 225;%273;
hours_to_days = linspace(0,10,timetotal);
 
 figure
 hold on 
 plot(hours_to_days,uninfected,'LineWidth',2)
 plot(hours_to_days,infected,'--','LineWidth',2)
 plot(hours_to_days,dead,':','LineWidth',2)
 plot(hours_to_days,antiviral_cells,':','LineWidth',2)
 ylabel('Number of cells')
% ylim([0 3000])
 yyaxis right
 plot(hours_to_days,virion','-.','LineWidth',2)
 ylabel('Total virions')
 legend('Uninfected cells','Infected cells','Dead cells','Antiviral cells','Virions')
 xlabel('Time (days)')
 set(gca,'FontSize',15)
 ax = gca;
 ax.YAxis(1).Color = 'k';
 ax.YAxis(2).Color = 'k';
 saveas(gcf,'F1.png')

 figure
 hold on
 plot(hours_to_days,macrophagesinactive,'Color',[0.04 0.31 0.49],'LineWidth',2)
 plot(hours_to_days,macrophagesactive,'--','Color',[.3 .75 .93],'LineWidth',2)
 plot(hours_to_days,neutrophils,':','Color',[.47 .67 .19],'LineWidth',2)
 legend('Macrophages (inactive)','Macrophages (active)','Neutrophils')
 xlabel('Time (days)')
 ylabel('Number of cells')
 set(gca,'FontSize',15)
 saveas(gcf,'F2.png')
 
 
 figure
 hold on
 plot(hours_to_days,macrophagesinactive+macrophagesactive,'Color',[0.04 0.31 0.49],'LineWidth',2)
 plot(hours_to_days,neutrophils,':','Color',[.47 .67 .19],'LineWidth',2)
 plot(hours_to_days,DC,'Color',[1 0 0],'LineWidth',2)
 legend('Total Macrophages','Neutrophils','Dendritic cells')
 xlabel('Time (days)')
 ylabel('Number of cells')
 set(gca,'FontSize',15)
 saveas(gcf,'F2.png')
 
figure
 hold on
 plot(hours_to_days,CD4,'--','Color',[1 0.07 0.65],'LineWidth',2)
 plot(hours_to_days,CD8,':','Color',[.64 .08 .18],'LineWidth',2)
  legend('DCs','CD8 T cells','CD4 T cells')
 xlabel('Time (days)')
 ylabel('Number of cells')
 set(gca,'FontSize',15)
 saveas(gcf,'F3.png')
 
 figure
 hold on 
 plot(hours_to_days,cytokine,'Color',[1 0.41 0.16],'LineWidth',2)
 plot(hours_to_days,chemokine,'--','Color',[0.12 0.64 0.54],'LineWidth',2)
 plot(hours_to_days,debris,':','Color',[.73 0.46 0.9],'LineWidth',2)
 plot(hours_to_days,IFN,':','LineWidth',2)
 plot(hours_to_days,ROS,':','LineWidth',2)
 ylabel('Total substrates')
 legend('Pro-inflammatory cytokine','Chemokine','Debris','IFN','ROS')
 xlabel('Time (days)')
 set(gca,'FontSize',15)
 saveas(gcf,'F4.png')
 
 
 %% load Amber's data

 load('AmberData.mat')
 
 figure
 hold on 
 yyaxis left
 plot(time_virus,ASvirus_data,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
ylabel('Virion')
 yyaxis right
 plot(hours_to_days,virion','-.','LineWidth',2)
ylabel('Virion')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('Virion')
 
figure
hold on 
yyaxis left
plot(time_cells,ASneutrophils,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
 ylabel('Cells')
yyaxis right
plot(hours_to_days,neutrophils,':','Color',[.47 .67 .19],'LineWidth',2)
 ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('Neutrophils')
 
figure
hold on 
yyaxis left
plot(time_cells,ASmacs_tot,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
plot(hours_to_days,macrophagesactive,'Color',[0.04 0.31 0.49],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('Macrophages')

figure
hold on 
yyaxis left
plot(time_cells,ASDCs_tot,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
plot(hours_to_days,DC,'Color',[1 0 0],'LineWidth',2)
 ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('DCs')
 
figure
hold on 
yyaxis left
plot(time_cells,ASCD4s,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
 plot(hours_to_days,CD4,'--','Color',[1 0.07 0.65],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('CD4+ T cells')

figure
hold on 
yyaxis left
plot(time_cells,ASCD8s,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
ylabel('Cells')
yyaxis right
plot(hours_to_days,CD8,':','Color',[.64 .08 .18],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('CD8+ T cells')
 

%% Topanta Ross data comparison

load('Topanta_Ross.mat')

figure
hold on 
yyaxis left
plot(time_cells,macs_adult,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(time_cells,macs_aged,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
plot(hours_to_days,macrophagesactive,'Color',[0.04 0.31 0.49],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('Macrophages')

figure
hold on 
yyaxis left
plot(time_cells,DCs_adult,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(time_cells,DCs_aged,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
plot(hours_to_days,DC,'Color',[1 0 0],'LineWidth',2)
 ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('DCs')
 
figure
hold on 
yyaxis left
plot(time_cells,CD4_adult,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(time_cells,CD4_aged,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
yyaxis right
 plot(hours_to_days,CD4,'--','Color',[1 0.07 0.65],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('CD4+ T cells')

figure
hold on 
yyaxis left
plot(time_cells,CD8_adult,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(time_cells,CD8_aged,'o:','Color',[0.5 0.5 0.5],'LineWidth',1)
ylabel('Cells')
yyaxis right
plot(hours_to_days,CD8,':','Color',[.64 .08 .18],'LineWidth',2)
ylabel('Cells')
xlabel('Time (days)')
set(gca,'FontSize',15)
title('CD8+ T cells')

 
 
 
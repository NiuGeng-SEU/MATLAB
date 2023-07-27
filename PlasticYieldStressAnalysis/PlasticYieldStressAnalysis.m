clc;
%Setting
fs = 20; %FontSize
lfs = 18; %LegendFontSize&AxisFontSize
fn = 'times new roman'; %Font
sz = 100; %ScatterMarkerSize
lw = 1;%LineWeight
%DataInput
x = 10:10:60; %TimeSpan 0-60min
y1 = [2088.482871	3462.633484	2724.147147	3610.230826	4520.291123	5469.881985]; %Static yield stress
y2 = [1365.312956	2236.653555	2081.668292	2836.773357	2465.50711	3627.608549]; %Static yield stress
%FigureGene
hold on;
scatter(x,y1,sz,"filled","MarkerFaceColor",'#0072BD');
scatter(x,y2,sz,"filled","MarkerFaceColor",'#D95319');
%FittingProcess
p1 = polyfit(x,y1,1); %LineFitting
y1 = polyval(p1,x1);
p2 = polyfit(x,y2,1); %LineFitting
y2 = polyval(p2,x1);
plot(x1,y1,'-','LineWidth',lw,"Color",'#0072BD');
plot(x1,y2,'-','LineWidth',lw,"Color",'#D95319');
%Legend
ax = gca;
ax.XLim = [5 65];% X axis limitation
h = legend('R00','R02',' ',' ','Location','northwest','NumColumns',2); %Legend
legend('boxoff');
set(h,'Fontsize',lfs);
set(gca, 'FontSize', lfs);
set(gca,'xcolor',[0 0 0]);
set(gca,'ycolor',[0 0 0]);
set(gca, 'YTickLabelRotation', 45);
ylabel('Static yield stress (Pa)','FontSize',fs); %YLabel
xlabel('Time (min)','FontSize',fs); %XLabel
set(gca,'FontName',fn)
box on;
hold off;
%SaveAsSvg
saveas(gcf,'/Users/niugeng/Desktop/PlasticYieldStressAnalysis','svg');
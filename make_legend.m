% 生成图例
% Author GYF
% bilibili @gyf10162
axis image;
axis([0,11,0,8]);
color = [192,146,92;163,123,73;0,128,0;128,0,0;0,0,128]./255;colormap(color);
boxXY = [0, 0; 1, 0; 1, 1; 0, 1; 0, 0];
boxX = boxXY(:, 1)' - 0.5;
boxY = boxXY(:, 2)' - 0.5;
FontSize = 18;  %字体大小
%% 起点
Center=[1,1];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % 绘制底色
line(Center(1), Center(2), 'LineWidth', 2, 'color', 'r', 'Marker', '.', 'MarkerSize', 10); %标记起点
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'起点','FontSize',FontSize)
%% 钥匙
Center=[1,2.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % 绘制底色
line(Center(1), Center(2), 'LineWidth',2,'color','b','Marker','p','MarkerSize',10);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'钥匙','FontSize',FontSize)
%% 玩家
Center=[1,4];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % 绘制底色
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','o','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'玩家','FontSize',FontSize)
%% 蝎子
Center=[1,5.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % 绘制底色
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','x','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'蝎子','FontSize',FontSize)
%% 木乃伊
Center=[1,7];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % 绘制底色
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','+','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'木乃伊','FontSize',FontSize)
%% 骷髅
Center=[5,5.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(3)); % 绘制底色
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'骷髅','FontSize',FontSize)
%% 出口
Center=[5,7];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(2)); % 绘制底色
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'出口','FontSize',FontSize)
%% 墙
Center=[5,4];
line([-0.5,0.5]+Center(1), [0,0]+Center(2),'LineWidth',2,'color','k');
text(Center(1)+1, Center(2),'墙','FontSize',FontSize)
%% 栅栏
Center=[5,2.5];
line([-0.5,0.5]+Center(1), [0,0]+Center(2),'LineWidth',2,'color','k','LineStyle',':');
text(Center(1)+1, Center(2),'栅栏','FontSize',FontSize)
%% 隐藏坐标
ax = gca;
ax.Visible=false;
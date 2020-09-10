% ����ͼ��
% Author GYF
% bilibili @gyf10162
axis image;
axis([0,11,0,8]);
color = [192,146,92;163,123,73;0,128,0;128,0,0;0,0,128]./255;colormap(color);
boxXY = [0, 0; 1, 0; 1, 1; 0, 1; 0, 0];
boxX = boxXY(:, 1)' - 0.5;
boxY = boxXY(:, 2)' - 0.5;
FontSize = 18;  %�����С
%% ���
Center=[1,1];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % ���Ƶ�ɫ
line(Center(1), Center(2), 'LineWidth', 2, 'color', 'r', 'Marker', '.', 'MarkerSize', 10); %������
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'���','FontSize',FontSize)
%% Կ��
Center=[1,2.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % ���Ƶ�ɫ
line(Center(1), Center(2), 'LineWidth',2,'color','b','Marker','p','MarkerSize',10);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'Կ��','FontSize',FontSize)
%% ���
Center=[1,4];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % ���Ƶ�ɫ
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','o','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'���','FontSize',FontSize)
%% Ы��
Center=[1,5.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % ���Ƶ�ɫ
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','x','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'Ы��','FontSize',FontSize)
%% ľ����
Center=[1,7];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(0)); % ���Ƶ�ɫ
line(Center(1), Center(2), 'LineWidth',2,'color','w','Marker','+','MarkerSize',15);
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'ľ����','FontSize',FontSize)
%% ����
Center=[5,5.5];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(3)); % ���Ƶ�ɫ
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'����','FontSize',FontSize)
%% ����
Center=[5,7];
image('XData',[1,1].*Center(1),'YData',[1,1].*Center(2),'CData',uint8(2)); % ���Ƶ�ɫ
line(boxX + Center(1), boxY + Center(2), 'color', 'k');
text(Center(1)+1, Center(2),'����','FontSize',FontSize)
%% ǽ
Center=[5,4];
line([-0.5,0.5]+Center(1), [0,0]+Center(2),'LineWidth',2,'color','k');
text(Center(1)+1, Center(2),'ǽ','FontSize',FontSize)
%% դ��
Center=[5,2.5];
line([-0.5,0.5]+Center(1), [0,0]+Center(2),'LineWidth',2,'color','k','LineStyle',':');
text(Center(1)+1, Center(2),'դ��','FontSize',FontSize)
%% ��������
ax = gca;
ax.Visible=false;
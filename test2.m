% 从CSV文件获取步骤，进行批量演示
% Author GYF
% bilibili @gyf10162
close all;
clear;
hFig = figure('Position', [1920+100, 100, 700, 700]);
filename = 'result.csv';
[xs, ys, canSolve, Steps] = textread(filename, '%d%d%d%s', 'delimiter', ',');
% videoObj = VideoWriter('output.mp4','MPEG-4');
% fps = 60;
% videoObj.FrameRate = fps;
% videoObj.open();
for i = 1:length(xs)
    test([xs(i), ys(i)], Steps{i}, canSolve(i));
    %     test([xs(i),ys(i)],Steps{i},canSolve(i)),videoObj,fps);
end

% videoObj.close();

% ���ɽ��棬ģ����Ϸ����
% Author GYF
% bilibili @gyf10162
function [] = show_animation(Player, Steps, canSolve, videoObj, fps)
    % ����ϴλ�ͼ
    persistent hDrawItems;

    if ~isempty(hDrawItems)
        delete(hDrawItems);
    end

    hDrawItems = [];
    % �жϲ���
    if nargin == 0
        Steps = 'DDDURURRRDRRDUURULLUUURRLLRLDLLLLDDDRRDDDDRD';
        Player = [2,7];
        canSolve = true;
    end

    if nargin == 2
        canSolve = true;
    end

    if nargin == 5
        video = true;
    else
        video = false;
        fps = 30;
    end

    if canSolve
        info1 = sprintf("��㣺(%d,%d)��������%d", Player(1), Player(2), length(Steps));
    else
        info1 = sprintf("��㣺(%d,%d)���������޷�ͨ�أ�", Player(1), Player(2));
    end

    info2 = sprintf("���裺%s", Steps);
    %% ��������
    Exit = [6, 1];
    Trap = [5, 7];
    Key = [10, 3];
    color = [192, 146, 92; 163, 123, 73; 0, 128, 0; 128, 0, 0; 0, 0, 128] ./ 255;
    mapSizeX = 10;
    mapSizeY = 10;
    blocks = uint8(zeros(mapSizeY, mapSizeX));
    blocks(1:2:size(blocks, 1), 2:2:size(blocks, 2)) = 1;
    blocks(2:2:size(blocks, 1), 1:2:size(blocks, 2)) = 1;
    blocks(Exit(2), Exit(1)) = 2; % ��������ɫ���
    blocks(Trap(2), Trap(1)) = 3; % �����ú�ɫ���
    hBlocks = image(blocks);
    hDrawItems = [hDrawItems, hBlocks];
    colormap(color);
    axis xy;
    axis image;
    axis manual;
    NoteSize = 12; %�����С
    title(info1, 'FontSize', NoteSize);
    xlabel(info2, 'FontSize', NoteSize);
    %% ����Կ��
    tmp = line(Key(1, 1), Key(1, 2), 'LineWidth', 2, 'color', 'b', 'Marker', 'p', 'MarkerSize', 10);
    hDrawItems = [hDrawItems, tmp];
    %% ����ǽ
    global wallRight wallTop FenceRight FenceTop
    wallRight = [[1, 1]; [1, 3]; [4, 2]; [4, 5]; [5, 3]; [5, 10]; [6, 2]; [6, 3]; [7, 6]; [7, 9]; [8, 3]; [9, 5]; [9, 7]; [9, 9]];
    wallTop = [[1, 9]; [2, 1]; [3, 3]; [3, 4]; [4, 2]; [4, 5]; [4, 8]; [5, 1]; [5, 6]; [5, 7]; [8, 6]; [8, 7]; [8, 9]; [9, 2]; [9, 5]; [9, 9]; [10, 2]];

    for i = 1:size(wallTop, 1)
        tmp = line([-0.5, 0.5] + wallTop(i, 1), [0.5, 0.5] + wallTop(i, 2), 'LineWidth', 2, 'color', 'k');
        hDrawItems = [hDrawItems, tmp];
    end

    for i = 1:size(wallRight, 1)
        tmp = line([0.5, 0.5] + wallRight(i, 1), [-0.5, 0.5] + wallRight(i, 2), 'LineWidth', 2, 'color', 'k');
        hDrawItems = [hDrawItems, tmp];
    end

    %% ����դ��
    FenceRight = [];
    FenceTop = [3, 2];
    hFences = [];

    for i = 1:size(FenceTop, 1)
        tmp = line([-0.5, 0.5] + FenceTop(i, 1), [0.5, 0.5] + FenceTop(i, 2), 'LineWidth', 2, 'color', 'k', 'LineStyle', ':');
        hFences = [hFences, tmp];
    end

    for i = 1:size(FenceRight, 1)
        line([0.5, 0.5] + FenceRight(i, 1), [-0.5, 0.5] + FenceRight(i, 2), 'LineWidth', 2, 'color', 'k', 'LineStyle', ':');
        hFences = [hFences, tmp];
    end

    hDrawItems = [hDrawItems, hFences];
    %% �������
    tmp = line(Player(1, 1), Player(1, 2), 'LineWidth', 2, 'color', 'r', 'Marker', '.', 'MarkerSize', 10); %������
    hDrawItems = [hDrawItems, tmp];
    hPlayer = line(Player(1, 1), Player(1, 2), 'LineWidth', 2, 'color', 'w', 'Marker', 'o', 'MarkerSize', 15);
    hDrawItems = [hDrawItems, hPlayer];
    %% ����Ҵ���Կ�״���������դ��
    isFenceClosed = true;

    if all(Player == Key)
        isFenceClosed = ~isFenceClosed;

        for hTmp = hFences
            hTmp.Visible = isFenceClosed;
        end

    end

    %% ����Ы��
    Scorpion = [2, 1];
    hScorpion = line(Scorpion(1, 1), Scorpion(1, 2), 'LineWidth', 2, 'color', 'w', 'Marker', 'x', 'MarkerSize', 15);
    hDrawItems = [hDrawItems, hScorpion];
    %% ����ľ����
    Mummy = [9, 5];
    hMummy = line(Mummy(1, 1), Mummy(1, 2), 'LineWidth', 2, 'color', 'w', 'Marker', '+', 'MarkerSize', 15);
    hDrawItems = [hDrawItems, hMummy];
    %% ���ɶ���
    frames = 0;
    time = 0;
    moveTime = 0.2; %�ƶ�ʱ��
    moveFrames = ceil(fps * moveTime); %�ƶ�����֡��

    for i = 1:moveFrames
        % ͣ��
        % pause(1/fps);
        % �ڴ˱���֡
        drawnow;

        if video
            f = getframe(gcf);
            videoObj.writeVideo(f);
        end

    end

    if ~canSolve
        tmp = text(mapSizeX / 2 + 0.5, mapSizeY / 2 + 0.5, '�޷�ͨ�أ�', 'HorizontalAlignment', 'center', 'color', 'r', 'FontSize', 40);
        hDrawItems = [hDrawItems, tmp];
    end

    for i = 1:length(Steps)
        step = Steps(i);
        info2 = sprintf("���裺%s{\\bf%s}%s", Steps(1:i - 1), Steps(i), Steps(i + 1:end));
        xlabel(info2, 'FontSize', NoteSize);
        XPlayerStart = hPlayer.XData(1);
        YPlayerStart = hPlayer.YData(1);
        [XPlayerFinal, YPlayerFinal, ~] = tryMove(XPlayerStart, YPlayerStart, step, isFenceClosed);
        % �����ƶ�
        XPlayerMiddle = linspace(XPlayerStart, XPlayerFinal, 1 + moveFrames);
        XPlayerMiddle = XPlayerMiddle(2:end);
        YPlayerMiddle = linspace(YPlayerStart, YPlayerFinal, 1 + moveFrames);
        YPlayerMiddle = YPlayerMiddle(2:end);

        for i = 1:moveFrames
            hPlayer.XData = XPlayerMiddle(i);
            hPlayer.YData = YPlayerMiddle(i);
            % pause(1/fps);
            % �ڴ˱���֡
            drawnow;

            if video
                f = getframe(gcf);
                videoObj.writeVideo(f);
            end

        end

        hPlayer.XData = XPlayerFinal;
        hPlayer.YData = YPlayerFinal;

        % �ƶ�Mummy��Scorpion
        XMummyStart = hMummy.XData(1);
        YMummyStart = hMummy.YData(1);
        [XMummyFinal, YMummyFinal, MummyCanMove] = tryMoveEnemy(XMummyStart, YMummyStart, XPlayerFinal, YPlayerFinal, isFenceClosed);
        XScorpionStart = hScorpion.XData(1);
        YScorpionStart = hScorpion.YData(1);
        [XScorpionFinal, YScorpionFinal, ScorpionCanMove] = tryMoveEnemy(XScorpionStart, YScorpionStart, XPlayerFinal, YPlayerFinal, isFenceClosed);

        if MummyCanMove || ScorpionCanMove
            % �����ƶ�
            XMummyMiddle = linspace(XMummyStart, XMummyFinal, 1 + moveFrames);
            XMummyMiddle = XMummyMiddle(2:end);
            YMummyMiddle = linspace(YMummyStart, YMummyFinal, 1 + moveFrames);
            YMummyMiddle = YMummyMiddle(2:end);
            XScorpionMiddle = linspace(XScorpionStart, XScorpionFinal, 1 + moveFrames);
            XScorpionMiddle = XScorpionMiddle(2:end);
            YScorpionMiddle = linspace(YScorpionStart, YScorpionFinal, 1 + moveFrames);
            YScorpionMiddle = YScorpionMiddle(2:end);

            for i = 1:moveFrames
                hMummy.XData = XMummyMiddle(i);
                hMummy.YData = YMummyMiddle(i);
                hScorpion.XData = XScorpionMiddle(i);
                hScorpion.YData = YScorpionMiddle(i);
                % pause(1/fps);
                % �ڴ˱���֡
                drawnow;

                if video
                    f = getframe(gcf);
                    videoObj.writeVideo(f);
                end

            end

            if (XMummyFinal == XScorpionFinal && YMummyFinal == YScorpionFinal)
                XScorpionFinal = 0;
                YScorpionFinal = 0;
            end

            hMummy.XData = XMummyFinal;
            hMummy.YData = YMummyFinal;
            hScorpion.XData = XScorpionFinal;
            hScorpion.YData = YScorpionFinal;
        end

        if (all([XPlayerFinal, YPlayerFinal] == Key) || all([XMummyFinal, YMummyFinal] == Key) || all([XScorpionFinal, YScorpionFinal] == Key))
            isFenceClosed = ~isFenceClosed;

            for hTmp = hFences
                hTmp.Visible = isFenceClosed;
            end

        end

        % �ƶ�Mummy
        XMummyStart = hMummy.XData(1);
        YMummyStart = hMummy.YData(1);
        [XMummyFinal, YMummyFinal, MummyCanMove] = tryMoveEnemy(XMummyStart, YMummyStart, XPlayerFinal, YPlayerFinal, isFenceClosed);

        if MummyCanMove
            % �����ƶ�
            XMummyMiddle = linspace(XMummyStart, XMummyFinal, 1 + moveFrames);
            XMummyMiddle = XMummyMiddle(2:end);
            YMummyMiddle = linspace(YMummyStart, YMummyFinal, 1 + moveFrames);
            YMummyMiddle = YMummyMiddle(2:end);

            for i = 1:moveFrames
                hMummy.XData = XMummyMiddle(i);
                hMummy.YData = YMummyMiddle(i);
                % pause(1/fps);
                % �ڴ˱���֡
                drawnow;

                if video
                    f = getframe(gcf);
                    videoObj.writeVideo(f);
                end

            end

            hMummy.XData = XMummyFinal;
            hMummy.YData = YMummyFinal;
        end

        if (all([XPlayerFinal, YPlayerFinal] == Key) || all([XMummyFinal, YMummyFinal] == Key) || all([XScorpionFinal, YScorpionFinal] == Key))
            isFenceClosed = ~isFenceClosed;

            for hTmp = hFences
                hTmp.Visible = isFenceClosed;
            end

        end

        for i = 1:moveFrames
            % ͣ��
            % pause(1/fps);
            % �ڴ˱���֡
            drawnow;

            if video
                f = getframe(gcf);
                videoObj.writeVideo(f);
            end

        end

        if all([XPlayerFinal, YPlayerFinal] == Exit)
            % �����յ㣬�򲻼����ƶ�
            break;
        end

    end

    for i = 1:fps * 1
        drawnow;
        % ͣ��
        % pause(1/fps);
        % �ڴ˱���֡
        drawnow;

        if video
            f = getframe(gcf);
            videoObj.writeVideo(f);
        end

    end

end

function [XFinal, YFinal, canMove] = tryMove(XStart, YStart, step, isFenceClosed)
    global wallRight wallTop FenceRight FenceTop
    canMove = true;
    XFinal = XStart;
    YFinal = YStart;

    if step == 'U'
        P = [XStart, YStart];

        if ((~isempty(wallTop)) && any(all(wallTop == P, 2), 1)) || ((~isempty(FenceTop)) && isFenceClosed && any(all(FenceTop == P, 2), 1))
            canMove = false;
        else
            XFinal = XStart;
            YFinal = YStart + 1;
        end

    elseif step == 'D'
        P = [XStart, YStart - 1];

        if ((~isempty(wallTop)) && any(all(wallTop == P, 2), 1)) || ((~isempty(FenceTop)) && isFenceClosed && any(all(FenceTop == P, 2), 1))
            canMove = false;
        else
            XFinal = XStart;
            YFinal = YStart - 1;
        end

    elseif step == 'L'
        P = [XStart - 1, YStart];

        if ((~isempty(wallRight)) && any(all(wallRight == P, 2), 1)) || ((~isempty(FenceRight)) && isFenceClosed && any(all(FenceRight == P, 2), 1))
            canMove = false;
        else
            XFinal = XStart - 1;
            YFinal = YStart;
        end

    elseif step == 'R'
        P = [XStart, YStart];

        if ((~isempty(wallRight)) && any(all(wallRight == P, 2), 1)) || ((~isempty(FenceRight)) && isFenceClosed && any(all(FenceRight == P, 2), 1))
            canMove = false;
        else
            XFinal = XStart + 1;
            YFinal = YStart;
        end

    elseif step == 'S'
        XFinal = XStart;
        YFinal = YStart;
    end

end

function [XFinal, YFinal, canMove] = tryMoveEnemy(XStart, YStart, XPlayer, YPlayer, isFenceClosed)
    canMove = false;
    XFinal = 0;
    YFinal = 0;

    if (XStart ~= 0 && YStart ~= 0)

        if XStart - XPlayer > 0
            [XFinal, YFinal, canMove] = tryMove(XStart, YStart, 'L', isFenceClosed);
        elseif XStart - XPlayer < 0
            [XFinal, YFinal, canMove] = tryMove(XStart, YStart, 'R', isFenceClosed);
        end

        if ~canMove

            if YStart - YPlayer > 0
                [XFinal, YFinal, canMove] = tryMove(XStart, YStart, 'D', isFenceClosed);
            elseif YStart - YPlayer < 0
                [XFinal, YFinal, canMove] = tryMove(XStart, YStart, 'U', isFenceClosed);
            end

        end

    end

end

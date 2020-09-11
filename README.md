# “队长杯”第6期思考题动画演示

## 简介

因为本人最近比较闲，就把“队长杯”第6期（[你要如何走才能不被木乃伊吃掉？][av796939581]）思考题的动画演示做了，另一方面也是为了复习 MATLAB 用法，为某数模比赛做准备。

演示视频见 [av457006196] 。

此演示代码不包含求解部分，求解代码见 <https://github.com/gyf10162/bilibili-av796939581-solve>。

## 代码说明

* `show_animation.m` 用于模拟游戏界面，如下图所示。该界面完全由代码生成，所以玩家等等都是用符号代替（~~因为本人懒得去画~~）。

    ![界面][interface]

    `show_animation` 函数接受五个参数 `Player, Steps, canSolve, videoObj, fps`：
    * 如果不提供参数，则函数使用默认起点和步骤进行演示。
    * 如果提供 `Player, Steps` 参数，则使用指定的起点和步骤进行演示。
    * 如果提供 `Player, Steps, canSolve` 参数，则使用指定的起点和步骤进行演示，且当 `canSolve == false` 时，则界面中央显示“**无法通关**”，这是为了和起点在出口处进行区分。
    * 如果提供 `Player, Steps, canSolve, videoObj, fps` 参数，则在上一条基础上，从 `videoObj` 参数接受由 `VideoWriter` 创建的对象，通过 `videoObj` 将演示画面保存到视频文件。

* `show_animation_all.m` 为一个脚本，该脚本从 `result.csv` 中读取数据，并分别将每一组数据传入到 `show_animation` 函数。

* `make_legend.m` 用于生成图例，如下图所示，此处不再详细说明。

![图例][legend]  

[av796939581]: https://www.bilibili.com/video/av796939581
[av457006196]: https://www.bilibili.com/video/av457006196
[legend]: https://github.com/gyf10162/bilibili-av796939581-animation/raw/master/fig/legend.png
[interface]: https://github.com/gyf10162/bilibili-av796939581-animation/raw/master/fig/interface.jpg

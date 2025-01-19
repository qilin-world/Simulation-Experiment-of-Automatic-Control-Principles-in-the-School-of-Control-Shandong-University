% 定义系统参数
zeta = 0.5; % 阻尼比
omega_n = 1; % 固有频率

% 创建二阶振荡系统的传递函数
s = tf('s');
G = omega_n^2 / (s^2 + 2*zeta*omega_n*s + omega_n^2);

% 创建一个图形窗口
figure;

% 绘制奈奎斯特图
subplot(1, 2, 1); % 左侧
nyquist(G);
title('奈奎斯特图', 'FontSize', 24); % 超大号字体
grid on;

% 绘制伯德图
subplot(1, 2, 2); % 右侧
bode(G);
title('伯德图', 'FontSize', 24); % 超大号字体
grid on;

% 设置整个图形窗口的字体大小
set(gcf, 'FontSize', 24); % 超大号字体

% 调整子图间距
subplot(1, 2, 1);
set(gca, 'Position', [0.13, 0.11, 0.373, 0.775]);
subplot(1, 2, 2);
set(gca, 'Position', [0.53, 0.11, 0.373, 0.775]);
% 定义时间向量
t = 0:0.1:20;

% 定义阻尼比和固有频率
zetas = [-3, 0, 0.5, 1, 3, 3]; % 阻尼比
wns = [1, 1, 1, 1, 1, 10]; % 固有频率

% 创建一个新的图形窗口
figure;

% 循环绘制每个系统的阶跃响应
for i = 1:length(zetas)
    % 定义传递函数的分子和分母
    num = [wns(i)^2];
    den = [1, 2*zetas(i)*wns(i), wns(i)^2];
    
    % 创建传递函数
    G = tf(num, den);
    
    % 计算阶跃响应
    c = step(G, t);
    
    % 绘制阶跃响应
    subplot(3, 2, i);
    plot(t, c, 'LineWidth', 2);
    hold on;
    grid on;
    
    % 添加标注
    title(['\zeta = ', num2str(zetas(i)), ', \omega_n = ', num2str(wns(i))], 'FontSize', 20);
    % xlabel('Time (s)', 'FontSize', 12);
    % ylabel('Amplitude', 'FontSize', 12);
end

% 调整子图之间的间距
sgtitle('Step Response for Different \zeta and \omega_n', 'FontSize', 1);
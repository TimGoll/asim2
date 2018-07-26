%set this variable to true, if the workspace should be cleared and the
%simulation should be rerun
doSimulation = false;

if (doSimulation == true)
    clc;
    clear;
    doSimulation = true;
end
close ALL;

param_simtime = 55;

param_f_res = 0;
param_v = 0;
param_f = 0.001;
param_N = 8;
param_l1 = 0.0164;
param_y2  = -1.135*10^-4;
param_y1  = 0.0164 + param_y2;
param_ys0 = 0.02;
param_k1  = 10800;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;
param_g   = 9.81;

if (doSimulation == true)    
    param_f_res = 34.5;
    
    a1 = sim('DEA_strip_t6_pwm', 'SimulationMode', 'normal');

    b1 = sim('DEA_strip_t6_sawtooth', 'SimulationMode', 'normal');

    c1 = sim('DEA_strip_t6_sinus', 'SimulationMode', 'normal');

    d1 = sim('DEA_strip_t6_triangle', 'SimulationMode', 'normal');
    
    %param_f_res = 17;
    %a2 = sim('DEA_strip_t6_pwm', 'SimulationMode', 'normal');
    %b2 = sim('DEA_strip_t6_sawtooth', 'SimulationMode', 'normal');
    %c2 = sim('DEA_strip_t6_sinus', 'SimulationMode', 'normal');
    %d2 = sim('DEA_strip_t6_triangle', 'SimulationMode', 'normal');
end




figure('Name', 'y_1 - f=34.5 // pwm');
plot(a1.get('time'), a1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - f=34.5 // pwm');
plot(a1.get('time'), a1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

figure('Name', 'f=34.5 // pwm - POWER');
plot(a1.get('time'), a1.get('power') ./ a1.get('time'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-1 10]);

power_ = a1.get('power');
%power_result = 0;
%for i=1:1:size(power_)
%    power_result = power_result + power_(i);
%end
power_result = power_(end) / param_simtime;
disp('f=34.5 // pwm - POWER: ' + string(power_result));



figure('Name', 'y_1 - f=34.5 // sawtooth');
plot(b1.get('time'), b1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - f=34.5 // sawtooth');
plot(b1.get('time'), b1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

figure('Name', 'f=34.5 // sawtooth - POWER');
plot(b1.get('time'), b1.get('power') ./ b1.get('time'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-1 10]);

power_ = b1.get('power');
%power_result = 0;
%for i=1:1:size(power_)
%    power_result = power_result + power_(i);
%end
power_result = power_(end) / param_simtime;
disp('f=34.5 // sawtooth - POWER: ' + string(power_result));



figure('Name', 'y_1 - f=34.5 // sinus');
plot(c1.get('time'), c1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - f=34.5 // sinus');
plot(c1.get('time'), c1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

figure('Name', 'f=34.5 // sinus - POWER');
plot(c1.get('time'), c1.get('power') ./ c1.get('time'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-1 10]);

power_ = c1.get('power');
%power_result = 0;
%for i=1:1:size(power_)
%    power_result = power_result + power_(i);
%end
power_result = power_(end) / param_simtime;
disp('f=34.5 // sinus - POWER: ' + string(power_result));



figure('Name', 'y_1 - f=34.5 // triangle');
plot(d1.get('time'), d1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - f=34.5 // triangle');
plot(d1.get('time'), d1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

figure('Name', 'f=34.5 // triangle - POWER');
plot(d1.get('time'), d1.get('power') ./ d1.get('time'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-1 10]);

power_ = d1.get('power');
%power_result = 0;
%for i=1:1:size(power_)
%    power_result = power_result + power_(i);
%end
power_result = power_(end) / param_simtime;
disp('f=34.5 // triangle - POWER: ' + string(power_result));



figure('Name', 'y_1 combined');
hold on;
plot(a1.get('time'), a1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'Square Wave');
plot(d1.get('time'), d1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'Triangle Wave');
plot(b1.get('time'), b1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'Sawtooth Wave');
plot(c1.get('time'), c1.get('y_1'), 'Linewidth', 2, 'DisplayName', 'Sinus Wave');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);
legend('show');

figure('Name', 'y_2 combined');
hold on;
plot(a1.get('time'), a1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'Square Wave');
plot(d1.get('time'), d1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'Triangle Wave');
plot(b1.get('time'), b1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'Sawtooth Wave');
plot(c1.get('time'), c1.get('y_2'), 'Linewidth', 2, 'DisplayName', 'Sinus Wave');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);
legend('show');

figure('Name', 'power combined');
hold on;
plot(a1.get('time'), a1.get('power') ./ a1.get('time'), 'Linewidth', 2, 'DisplayName', 'Square Wave');
plot(d1.get('time'), d1.get('power') ./ d1.get('time'), 'Linewidth', 2, 'DisplayName', 'Triangle Wave');
plot(b1.get('time'), b1.get('power') ./ b1.get('time'), 'Linewidth', 2, 'DisplayName', 'Sawtooth Wave');
plot(c1.get('time'), c1.get('power') ./ c1.get('time'), 'Linewidth', 2, 'DisplayName', 'Sinus Wave');
grid;
grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-1 8]);
legend('show');



% 
% 
% 
% figure('Name', 'y_1 - f=17 // pwm');
% plot(a2.get('time'), a2.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'y_2 - f=17 // pwm');
% plot(a2.get('time'), a2.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'f=17 // pwm - POWER');
% plot(a2.get('time'), a2.get('power'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Power [W]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% power_ = a2.get('power');
% power_result = 0;
% for i=1:1:size(power_)
%     power_result = power_result + power_(i);
% end
% power_result = power_result / param_simtime;
% disp('f=17 // pwm - POWER: ' + string(power_result));
% 
% 
% 
% figure('Name', 'y_1 - f=17 // sawtooth');
% plot(b2.get('time'), b2.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'y_2 - f=17 // sawtooth');
% plot(b2.get('time'), b2.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'f=17 // sawtooth - POWER');
% plot(b2.get('time'), b2.get('power'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Power [W]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% power_ = b2.get('power');
% power_result = 0;
% for i=1:1:size(power_)
%     power_result = power_result + power_(i);
% end
% power_result = power_result / param_simtime;
% disp('f=17 // sawtooth - POWER: ' + string(power_result));
% 
% 
% 
% figure('Name', 'y_1 - f=17 // sinus');
% plot(c2.get('time'), c2.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'y_2 - f=17 // sinus');
% plot(c2.get('time'), c2.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'f=17 // sinus - POWER');
% plot(c2.get('time'), c2.get('power'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Power [W]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% power_ = c2.get('power');
% power_result = 0;
% for i=1:1:size(power_)
%     power_result = power_result + power_(i);
% end
% power_result = power_result / param_simtime;
% disp('f=17 // sinus - POWER: ' + string(power_result));
% 
% 
% 
% figure('Name', 'y_1 - f=17 // triangle');
% plot(d2.get('time'), d2.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'y_2 - f=17 // triangle');
% plot(d2.get('time'), d2.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Displacement [m]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% figure('Name', 'f=17 // triangle - POWER');
% plot(d2.get('time'), d2.get('power'), 'Linewidth', 2, 'DisplayName', 'y_2');
% grid;
% grid minor;
% ylabel 'Power [W]';
% xlabel 'Time [s]';
% set(gca, 'FontSize', 20);
% xlim([0 param_simtime]);
% %ylim([-10 10]);
% 
% power_ = d2.get('power');
% power_result = 0;
% for i=1:1:size(power_)
%     power_result = power_result + power_(i);
% end
% power_result = power_result / param_simtime;
% disp('f=17 // triangle - POWER: ' + string(power_result));
% 

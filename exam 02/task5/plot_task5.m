%set this variable to true, if the workspace should be cleared and the
%simulation should be rerun
doSimulation = true;

if (doSimulation == true)
    clc;
    clear;
    doSimulation = true;
end
close ALL;

param_simtime = 55;

param_v = 0;
param_f = 0.001;
param_N = 8;
param_l1 = 0.0164;
param_y2  = -1.135*10^-4;
param_y1  = 0.0164 + param_y2;
param_ys0 = 0.02;
param_k1  = 10800;
param_m1  = 0.25;
param_g   = 9.81;

m_2_default = 0.25;
m_2_low     = 0.05;
m_2_high    = 0.45;
k_2_default = 43200;
k_2_low     = 20000;
k_2_high    = 66400;

%%%%% DECREASE M %%%%%
if (doSimulation == true)
    set_param('DEA_strip_t5', 'StopTime', param_simtime');

    param_k2  = k_2_default;
    param_m2  = m_2_low;
    a = sim('DEA_strip_t5', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

%%%%% INCREASE M %%%%%
if (doSimulation == true)
    param_k2  = k_2_default;
    param_m2  = m_2_high;
    b = sim('DEA_strip_t5', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(b.get('time'), b.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(b.get('time'), b.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

%%%%% DECREASE K %%%%%
if (doSimulation == true)
    param_k2  = k_2_low;
    param_m2  = m_2_default;
    c = sim('DEA_strip_t5', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(c.get('time'), c.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(c.get('time'), c.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

%%%%% INCREASE K %%%%%
if (doSimulation == true)
    param_k2  = k_2_high;
    param_m2  = m_2_default;
    d = sim('DEA_strip_t5', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(d.get('time'), d.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(d.get('time'), d.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

%%%%% DEFAULT VALUES (like Task3) %%%%%
if (doSimulation == true)
    param_k2  = k_2_default;
    param_m2  = m_2_default;
    e = sim('DEA_strip_t5', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(e.get('time'), e.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - m2=' + string(param_m2) + ', k2=' + string(param_k2));
plot(e.get('time'), e.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);


%%%%% COMBINED PLOTS %%%%%
figure('Name', 'y_1 - different masses');
hold on;
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_low) + ', k_2=' + string(k_2_default));
plot(e.get('time'), e.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(b.get('time'), b.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_high) + ', k_2=' + string(k_2_default));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_1 - different K');
hold on;
plot(c.get('time'), c.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_low));
plot(e.get('time'), e.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(d.get('time'), d.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_high));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - different masses');
hold on;
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_low) + ', k_2=' + string(k_2_default));
plot(e.get('time'), e.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(b.get('time'), b.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_high) + ', k_2=' + string(k_2_default));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

figure('Name', 'y_2 - different K');
hold on;
plot(c.get('time'), c.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_low));
plot(e.get('time'), e.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(d.get('time'), d.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_high));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([-0.002 0.002]);

if (doSimulation == true)
    param_k2 = 2*k_2_default;
    param_m2 = 1/2 * m_2_default;
    f = sim('DEA_strip_t5', 'SimulationMode', 'normal'); 
end
figure('Name', 'y_1 - double and half');
hold on;
plot(e.get('time'), e.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(f.get('time'), f.get('y_1'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(1/2*m_2_default) + ', k_2=' + string(2*k_2_default));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - double and half');
hold on;
plot(e.get('time'), e.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(m_2_default) + ', k_2=' + string(k_2_default));
plot(f.get('time'), f.get('y_2'), 'Linewidth', 2, 'DisplayName', 'm_2=' + string(1/2*m_2_default) + ', k_2=' + string(2*k_2_default));
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([-0.002 0.002]);


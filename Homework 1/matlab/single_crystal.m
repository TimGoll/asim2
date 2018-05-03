function [epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0] = single_crystal(strain, stress)

strain1 = strain(1:42);
strain2 = strain(42:150);
strain3 = strain(187:248);
strain4 = strain(248:347);

f1 = (192.86*strain1)*10^8  *10^-9;
f2 = linspace(2.7*10^8,2.7*10^8,109)  *10^-9;
f3 = (1.5714*10^10*(strain3)-4.84*10^8)  *10^-9;
f4 = linspace(0.8967*10^8,0.8967*10^8,100)  *10^-9;

figure('Name', 'approximated single-crystal');
plot(strain, stress, 'Linewidth', 1);
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Stress [GPa]';
set(gca,'FontSize', 14);
hold on;
plot(strain1, f1, 'Linewidth', 2, 'color', 'r');
plot(strain2, f2, 'Linewidth', 2, 'color', 'r');
plot(strain3, f3, 'Linewidth', 2, 'color', 'r');
plot(strain4, f4, 'Linewidth', 2, 'color', 'r');


% outputs (values from graphs)
epsilon_A_T0 = 0.014;
epsilon_M_T0 = 0.0365;
epsilon_T    = 0.031;
sigma_A_T0   = 0.27;
sigma_M_T0   = 0.09;

end

function [] = boxPlot (strain, stress, pos1, pos2, pos3, pos4, pos5)
    p0 = [strain(1); stress(pos1)];
    p1 = [strain(pos1); stress(pos1)];
    p2 = [strain(pos2); stress(pos2)];
    p3 = [strain(pos3); stress(pos3)];
    p4 = [strain(pos4); stress(pos4)];
    p5 = [strain(pos5); stress(pos5)];
    
    strain0_1 = strain(1:pos1);
    strain1_2 = strain(pos1:pos2+6);
    strain2_3 = strain(pos2:pos3);
    strain3_4 = strain(pos3:pos4);
    strain4_5 = strain(pos4:pos5+14);
    strain5_1 = strain(pos1:pos5);
    
    gradient0_1 = (p1(2) - 0) / (p1(1) - 0);
    gradient1_2 = (p2(2) - p1(2)) / (p2(1) - p1(1));
    gradient2_3 = (p3(2) - p2(2)) / (p3(1) - p2(1));
    gradient3_4 = (p4(2) - p3(2)) / (p4(1) - p3(1));
    gradient4_5 = (p5(2) - p4(2)) / (p5(1) - p4(1));
    gradient5_1 = (p5(2) - p1(2)) / (p5(1) - p1(1));
    
    intercept0_1 = 0;
    intercept1_2 = p1(2) - gradient1_2 * p1(1);
    intercept2_3 = p2(2) - gradient2_3 * p2(1);
    intercept3_4 = p3(2) - gradient3_4 * p3(1);
    intercept4_5 = p4(2) - gradient4_5 * p4(1);
    intercept5_1 = p5(2) - gradient5_1 * p5(1);
    
    f0_1 = ((gradient0_1*strain0_1)+intercept0_1);
    f1_2 = ((gradient1_2*strain1_2)+intercept1_2);
    f2_3 = ((gradient2_3*strain2_3)+intercept2_3);
    f3_4 = ((gradient3_4*strain3_4)+intercept3_4);
    f4_5 = ((gradient4_5*strain4_5)+intercept4_5);
    f5_1 = ((gradient5_1*strain5_1)+intercept5_1);
    
    figure('Name', 'approximated single-crystal');
    plot(strain,stress,'Linewidth',1);
    grid;
    grid minor;
    xlabel 'Strain';
    ylabel 'Stress [GPa]';
    set(gca,'FontSize',14);
    hold on;
    
    plot(strain0_1, f0_1, 'Linewidth', 2, 'color', 'r');
    plot(strain1_2, f1_2, 'Linewidth', 2, 'color', 'r');
    %plot(strain2_3, f2_3, 'Linewidth', 2, 'color', 'r'); 
    plot(strain3_4, f3_4, 'Linewidth', 2, 'color', 'r'); 
    plot(strain4_5, f4_5, 'Linewidth', 2, 'color', 'r'); 
    %plot(strain5_1, f5_1, 'Linewidth', 2, 'color', 'r'); 
    
end
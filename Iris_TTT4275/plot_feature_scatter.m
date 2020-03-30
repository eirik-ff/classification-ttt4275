%% Load data
class1 = load('class_1');  % Setosa
class2 = load('class_2');  % Versicolour
class3 = load('class_3');  % Virginica

all_data = [class1; class2; class3];

samples = length(class1);

%% Plot scatter
features = {'Sepal length [cm]','Sepal width [cm]','Petal length [cm]','Petal width [cm]'};
classes  = {'Setosa','Versicolour','Virginica'};

features_to_plot = [1, 2;
                    1, 3;
                    1, 4;
                    2, 3;
                    2, 4;
                    3, 4];
N_plots = length(features_to_plot);
N_plots_x = 3;
N_plots_y = N_plots / N_plots_x;

figure(1);
sgtitle('Iris features plotted against each other');

g = [kron(ones(samples,1),1);
     kron(ones(samples,1),2);
     kron(ones(samples,1),3);];
 
for i = 1:N_plots
    subplot(N_plots_y, N_plots_x, i);
    f1 = features_to_plot(i, 1);
    f2 = features_to_plot(i, 2);
    
    gscatter(all_data(:, f1), all_data(:, f2), g);
    xlabel(features{f1});
    ylabel(features{f2});
    
    legend off;
end
subplot(N_plots_y, N_plots_x, N_plots_x*N_plots_y);
legend(classes,'location','northwest', 'location','southeast');





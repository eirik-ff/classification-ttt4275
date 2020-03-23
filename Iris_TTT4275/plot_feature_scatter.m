%% Load data
class1 = load('class_1');  % Setosa
class2 = load('class_2');  % Versicolour
class3 = load('class_3');  % Virginica

all_data = [class1; class2; class3];

samples = length(class1);

%% Plot scatter
features = {'Sepal length [cm]','Sepal width [cm]','Petal length [cm]','Petal width [cm]'};
classes  = {'Setosa','Versicolour','Virginica'};

N = length(features);
figure(1);
g = [kron(ones(samples,1),1);
     kron(ones(samples,1),2);
     kron(ones(samples,1),3);];
i = 0;
for f1 = 1:N
    for f2 = 1:N
        i = i + 1;
        subplot(N,N,i);
        gscatter(all_data(:,f1),all_data(:,f2),g);
        legend off;
        xlabel(features{f1});
        ylabel(features{f2});
    end
end
subplot(N,N,1);
legend(classes,'location','northwest');






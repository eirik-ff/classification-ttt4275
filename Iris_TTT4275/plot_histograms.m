%% Load data
class1 = load('class_1');  % Setosa
class2 = load('class_2');  % Versicolour
class3 = load('class_3');  % Virginica

all_data = [class1; class2; class3];

%% Defs
sl_bins = min(all_data(:,1)):0.1:max(all_data(:,1)); % sepal length
sw_bins = min(all_data(:,2)):0.1:max(all_data(:,2)); % sepal width
pl_bins = min(all_data(:,3)):0.2:max(all_data(:,3)); % petal length
pw_bins = min(all_data(:,4)):0.1:max(all_data(:,4)); % petal width

bins    = 0:0.2:8;
sl_bins = bins;
sw_bins = bins;
pl_bins = bins;
pw_bins = bins;

%% Plot histogram sepal length
figure(1);
clf;
sgtitle('Comparison of features across classes');

subplot(411);
hold on;
histogram(class2(:,1), sl_bins);
histogram(class1(:,1), sl_bins);
histogram(class3(:,1), sl_bins);

xlabel('Sepal length [cm]');
ylabel('Count');


subplot(412);
hold on;
histogram(class2(:,2), sw_bins);
histogram(class1(:,2), sw_bins);
histogram(class3(:,2), sw_bins);

xlabel('Sepal width [cm]');
ylabel('Count');


subplot(413);
hold on;
histogram(class2(:,3), pl_bins);
histogram(class1(:,3), pl_bins);
histogram(class3(:,3), pl_bins);

xlabel('Petal length [cm]');
ylabel('Count');


subplot(414);
hold on;
histogram(class2(:,4), pw_bins);
histogram(class1(:,4), pw_bins);
histogram(class3(:,4), pw_bins);

xlabel('Petal width [cm]');
ylabel('Count');

legend('Setosa (class 1)', 'Versicolour (class 2)', 'Virginica (class 3)');

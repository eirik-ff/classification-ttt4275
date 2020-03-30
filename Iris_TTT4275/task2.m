%% Load data
class1 = load('class_1');  % Setosa
class2 = load('class_2');  % Versicolour
class3 = load('class_3');  % Virginica

all_data = [class1; class2; class3];

%% Definitions
features = [1,2,3,4];

C = 3; % number of classes
D = length(features); % number of features

% Target vectors
t1 = [1; 0; 0];
t2 = [0; 1; 0];
t3 = [0; 0; 1];


%% Split data into training and testing data
N_obsv = length(class1);
N_train = 30;
N_test  = 20;

% 30 first train, 20 last test
idx_train = 1:N_train;
idx_test  = N_train+1:N_obsv;

% % 20 first test, 30 last train
% idx_test  = 1:N_test;
% idx_train = N_test+1:N_obsv;


%% Training data (d = data)
x1d = class1(idx_train,features);
x2d = class2(idx_train,features);
x3d = class3(idx_train,features);

xd  = [x1d; x2d; x3d];

%% Testing data (t = test)
x1t = class1(idx_test,features);
x2t = class2(idx_test,features);
x3t = class3(idx_test,features);

xt  = [x1t; x2t; x3t];

%% Helper functions
grad_W_MSE_k = @(gk, tk, xk) ( (gk - tk) .* gk .* (1 - gk) ) * xk'; % (22) in compendium


%% Gradient descent
tol = 0.4;

t = [kron(ones(1,N_train),t1), kron(ones(1,N_train),t2), kron(ones(1,N_train),t3)];
W = eye(C,D+1);
cond = 1;
iters = 0;
disp('---- Begin training reduced feature set ----');
tic;
while cond
    grad_W_MSE = 0;
    for k = 1:C*N_train
        xk = [xd(k,:)'; 1];
        zk = W*xk;
        gk = sigmoid(zk);
        tk = t(:,k);

        grad_W_MSE = grad_W_MSE + grad_W_MSE_k(gk, tk, xk);
    end
    cond = norm(grad_W_MSE) >= tol;
    iters = iters + 1;

    alpha = 0.0001;
    W = W - alpha*grad_W_MSE;
end
toc
disp('---- End training reduced feature set ----');


%% Test
known_test = [kron(ones(1,N_test),t1), kron(ones(1,N_test),t2), kron(ones(1,N_test),t3)];
pred_test  = zeros(size(known_test));
for i = 1:length(xt)
    x = [xt(i,:)'; 1];
    g = W*x;
    [w,j] = max(g);
    pred_test(j,i) = 1;
end

pred_train = zeros(size(t));
for i = 1:length(xd)
    x = [xd(i,:)'; 1];
    g = W*x;
    [w,j] = max(g);
    pred_train(j,i) = 1;
end


%% Confusion matrix
figure(1);
plotconfusion(known_test,pred_test,'Iris test set');
titl = get(get(gca,'title'),'string');
fstr = sprintf(', %d', features);
title({titl, sprintf('Features: %s', fstr(2:end))});
xticklabels({'Setosa', 'Versicolour', 'Virginica'});
yticklabels({'Setosa', 'Versicolour', 'Virginica'});


figure(2);
plotconfusion(t,pred_train,'Iris training set');
titl = get(get(gca,'title'),'string');
fstr = sprintf(', %d', features);
title({titl, sprintf('Features: %s', fstr(2:end))});
xticklabels({'Setosa', 'Versicolour', 'Virginica'});
yticklabels({'Setosa', 'Versicolour', 'Virginica'});




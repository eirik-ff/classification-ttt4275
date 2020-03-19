%% Load data
class1_data = load('class_1');  % Setosa
class2_data = load('class_2');  % Versicolour
class3_data = load('class_3');  % Virginica


%% Definitions
C = 3; % number of classes
D = 4; % number of features (size(class1_data,2))

% Target vectors
t1 = [1; 0; 0];
t2 = [0; 1; 0];
t3 = [0; 0; 1];


%% Split data into training and testing data
N_obsv = length(class1_data);
N_train = 30;
N_test  = 50;

idx_train = 1:N_train;
idx_test  = N_train+1:N_obsv;


%% Training data (d = data)
x1d = class1_data(idx_train,:);
x2d = class2_data(idx_train,:);
x3d = class3_data(idx_train,:);

xd  = [x1d; x2d; x3d];

%% Testing data (t = test)
x1t = class1_data(idx_train,:);
x2t = class2_data(idx_train,:);
x3t = class3_data(idx_train,:);

xt  = [x1t; x2t; x3t];

%% Helper functions
grad_W_MSE_k = @(gk, tk, xk) ( (gk - tk) .* gk .* (1 - gk) ) * xk'; % (22) in compendium


%% Gradient descent
t = [kron(ones(1,N_train),t1), kron(ones(1,N_train),t2), kron(ones(1,N_train),t3)];

W = eye(C,D+1);
for i = 1:50
    grad_W_MSE = 0;
    for k = 1:N_train
        xk = [xd(k,:)'; 1];
        zk = W*xk;
        gk = sigmoid(zk);
        tk = t(:,k);

        grad_W_MSE = grad_W_MSE + grad_W_MSE_k(gk, tk, xk);
    end

    alpha = 0.1;
    W = W - alpha*grad_W_MSE;
end

x = [x3t(1,:)'; 1];
guess = sigmoid(W*x)

%% 

% x = [sl, sw, pl, pw, 1];
% 
% W: Cx(D+1) matrix
% C = 3;
% D = 4;
% -> W: 3x5 matrix
% 
% x: 1x5
% x': 5x1
% z = W*x'; % z: 3x1 vector 
% 
% g = sigmoid(z);
% g - t
% 
% 
% 
% W0 = eye(C,D+1);
% 



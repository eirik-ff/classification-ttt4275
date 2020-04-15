%% Definitions
N_test     = size(testv,1);
N_train    = size(trainv,1);

%% Classify
guess = zeros(10,N_test);
disp('---- Begin 1-NN classify ----');
tic;
for i = 1:N_test
    test = testv(i,:);
    dists = dist(trainv,test');
    [d,di] = min(dists);
    pred = trainlab(di);
    guess(pred+1,i) = 1;
end
toc
disp('---- End 1-NN classify ----');


%% Make knowns for confusion matrix
known = zeros(10,N_test);
for i = 1:N_test
    l = testlab(i);
    known(l+1,i) = 1;
end


%% Plot confusion
plotconfusion(known,guess);
titl = get(get(gca,'title'),'string');
title({titl, '1-NN with no clustering'});
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});




% Run task2_cluster.m first. 

%% Definitions
N_test     = size(testv,1);
N_train    = size(trainv_clustered,1);
chunk_size = 1000;
N_chunks   = N_train / chunk_size;


%% Classify
guess = zeros(10,N_test);
disp('---- Begin 1-NN clustered classify ----');
tic;
for i = 1:N_test
    test = testv(i,:);
    dists = dist(trainv_clustered,test');
    [d,di] = min(dists);
    pred = trainlab_clustered(di);
    guess(pred+1,i) = 1;
end
toc
disp('---- End 1-NN clustered classify ----');


%% Make knowns for confusion matrix
known = zeros(10,N_test);
for i = 1:N_test
    l = testlab(i);
    known(l+1,i) = 1;
end


%% Plot confusion
plotconfusion(known,guess);
titl = get(get(gca,'title'),'string');
title({titl, '1-NN with clustering'});
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});


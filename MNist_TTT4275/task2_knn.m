% Run task2_cluster.m first. 

%% Definitions
N_test     = size(testv,1);
N_train    = size(trainv_clustered,1);
chunk_size = 1000;
N_chunks   = N_train / chunk_size;

k = 7;


%% Classify
guess = zeros(10,N_test);
disp('---- Begin kNN clustered classify ----');
tic;
for i = 1:N_test
    test = testv(i,:);
    dists = dist(trainv_clustered,test');
    
    [~,idx] = sort(dists);
    k_smallest = idx(1:k);
    labels = trainlab_clustered(k_smallest);
    binc = 0:9;
    count = hist(labels,binc);
    [~,pred] = max(count); % pred = label + 1
    guess(pred,i) = 1;
end
toc
disp('---- End kNN clustered classify ----');


%% Make knowns for confusion matrix
known = zeros(10,N_test);
for i = 1:N_test
    l = testlab(i);
    known(l+1,i) = 1;
end


%% Plot confusion
plotconfusion(known,guess);
titl = get(get(gca,'title'),'string');
title({titl, sprintf('%d-NN with clustering',k)});
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});


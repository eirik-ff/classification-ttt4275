%% Split data
trainvecs = cell(10,1);
for n = 0:9
    vi = trainv(trainlab == n,:);
    i = n+1;
    trainvecs{i} = vi;
end

%% Cluster
M = 64;
clusters = cell(10,1);

disp('---- Begin clustering ----');
tic;
for i = 1:10
    vi = trainvecs{i};
    [~,Ci] = kmeans(vi,M);
    clusters{i} = Ci;
end
toc
disp('---- End clustering ----');


%% Clustered training set
trainv_clustered   = cell2mat(clusters);
trainlab_clustered = NaN(10*M,1);
for n = 0:9
    trainlab_clustered(n*M+1:(n+1)*M) = n * ones(M,1);
end

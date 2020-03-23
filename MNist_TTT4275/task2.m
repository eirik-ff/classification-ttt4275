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

tic;
for n = 0:9
    i = n+1;
    vi = trainvecs{i};
    [~,Ci] = kmeans(vi,M);
    clusters{i} = Ci;
end
toc



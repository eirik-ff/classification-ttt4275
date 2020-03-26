%% Definitions
N_test     = size(testv,1);
N_train    = size(trainv,1);
chunk_size = 1000;
N_chunks   = N_train / chunk_size;


%% Classify
% test defines
N_chunks = 10;
N_test = 1000;

guess = zeros(10,N_test);
tic;
for i = 1:N_test
    test = testv(i,:);
    
    % Go through all chunks and find and save closest image in each chunk
    dmin = Inf;
    imin = 0;
    for j = 0:N_chunks-1
        first = j*chunk_size+1;
        last  = (j+1)*chunk_size;
        train = trainv(first:last,:);
        dists = dist(train,test'); % chunk_size x 1
        
        [d,di] = min(dists); % di: distance index in this chunk
        if d < dmin 
            dmin = d;
            imin = j*chunk_size + di;
        end
    end
    
    % Find the chunk with the closest image
    pred = trainlab(imin);
    guess(pred+1,i) = 1;

%     dists = dist(trainv,test');
%     [d,di] = min(dists);
%     pred = trainlab(di);
%     guess(pred+1,i) = 1;
end
toc


%% Make knowns for confusion matrix
known = zeros(10,N_test);
for i = 1:N_test
    l = testlab(i);
    known(l+1,i) = 1;
end


%% Plot confusion
plotconfusion(known,guess);
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});




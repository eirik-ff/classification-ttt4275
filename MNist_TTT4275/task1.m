N_test = 1000;

known = zeros(10,N_test);
for i = 1:N_test
    l = testlab(i);
    known(l+1,i) = 1;
end

pred = zeros(10,N_test);
tic;
for i = 1:N_test
    tim = testv(i,:);
    tlab = testlab(i);

    dists = Inf(2,1000);
    for j = 1:1000
        train = trainv(j,:);
        dists(1,j) = trainlab(j);
        dists(2,j) = pdist([train;tim]);
    end

%     [d,di] = min(dists(2,:));
%     classlab = dists(1,di);
%     pred(classlab+1,i) = 1;

    k = 11;
    [dists_sort,lab_idx] = sort(dists(2,:),2);
    k_smallest_idx = lab_idx(1:k);
    k_smallest_labs = dists(1,k_smallest_idx);
    count = zeros(1,10);
    for n = 0:9
        count(n+1) = length(k_smallest_labs(k_smallest_labs==n));
    end
    [c,ci] = max(count);
    pred(ci,i) = 1;
end
toc

plotconfusion(known,pred);


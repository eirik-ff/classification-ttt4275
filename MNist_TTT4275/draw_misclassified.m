% Results must be loaded as "known" and "guess"
% data_all must be loaded

%% Find misclassified
misclassified_idx = NaN(10,1);
for i = 1:length(guess)
    g = find(guess(:,i));
    k = find(known(:,i));
    
    if g ~= k && isnan(misclassified_idx(g))
        misclassified_idx(g) = i;
    end
end

%% Draw misclassified
figure(1);
clf;
sgtitle('Some misclassified images');
% sgtitle('Some correctly classified images');

for i = 1:10
    subplot(2,5,i);
    idx = misclassified_idx(i);
    draw_image(testv(idx,:));
    title({sprintf('Guess %d',i-1),sprintf('Real: %d',testlab(idx))});
end




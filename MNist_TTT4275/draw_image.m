function draw_image(imv, label)
    % Draws the image imv and add title with label
    %  imv:   image vector, either as 1x784 vector or 28x28 matrix
    %  label: label of picture, will be put as title of plot
    
    if isequal(size(imv), [1,784])
        imv = reshape(imv, [28,28]);
    end
    
    imv = fliplr(imv);
    imv = rot90(imv);
    
    image(imv);
    if nargin == 2
        title(sprintf('%d', label));
    end
end
% Test draw_image

for i = 1:length(testv)
    draw_image(testv(i,:), testlab(i));
    pause
end

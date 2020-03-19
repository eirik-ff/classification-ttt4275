% Test draw_image
subplot(221);
draw_image(testv(1,:), testlab(1));

subplot(222);
draw_image(testv(2,:), testlab(2));

subplot(223);
draw_image(testv(3,:), testlab(3));

subplot(224);
draw_image(testv(4,:), testlab(4));


pause;
clf;
for i = 1:10
    draw_image(testv(i,:), testlab(i));
    pause
end

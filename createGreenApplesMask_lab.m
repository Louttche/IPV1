function masked_img = createGreenApplesMask_lab(RGB)
    % Use color-based segmentation using L*a*b* Color space %
    lab_he = rgb2lab(RGB);
    % Classify colors (3/4)
    ab = lab_he(:,:,2:3);
    ab = im2single(ab);
    nColors = 3;
    % repeat the clustering 3 times to avoid local minima
    pixel_labels = imsegkmeans(ab,nColors,'NumAttempts', 3);
    mask = pixel_labels==2;
    masked_img = RGB .* uint8(mask); % <== Green apple segmentation in cluster 2
end


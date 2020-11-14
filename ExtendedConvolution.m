%% 6.2 Border Handling

image = im2double(imread('cameraman.tif'));
kernel = ones(5) / 25;
filtered = extended_convolution(image, kernel);
subplot(121); imshow(image); title('Input image');
subplot(122); imshow(filtered); title('Filtered image');

filtered = extended_convolution(image, kernel);
reference = imfilter(image, kernel, 'replicate');
difference = 0.5 + 10 * (filtered - reference);
ssd = sum((filtered(:) - reference(:)) .^ 2);

subplot(131); imshow(filtered); title('Extended convolution');
subplot(132); imshow(reference); title('Reference result');
subplot(133); imshow(difference); title(sprintf('Difference (SSD=%.1f)',ssd));

%% 6.3 Image Filtering

hKernal = [ 1 2 1 ; 0 0 0 ; -1 -2 -1 ]; % horizontal
vKernal = [ 1 0 -1 ; 2 0 -2 ; 1 0 -1 ]; % vertical
dKernal = [ 2 1 0 ; 1 0 -1 ; 0 -1 -2 ]; % any dialog iamge gradients
sKernal = [ 0 -1 0 ; -1 5 -1 ; 0 -1 0 ]; % sharpening
gKernal = 1/16 * [1 2 1; 2 4 2; 1 2 1]; % Gaussian 

figure('Name', 'Image Filtering');
subplot(221); imshow(extended_convolution(image, hKernal)); title('Horizontal');
subplot(222); imshow(extended_convolution(image, vKernal)); title('Vertical');
subplot(223); imshow(extended_convolution(image, dKernal)); title('Diagonal');
subplot(224); imshow(extended_convolution(image, sKernal)); title('Sharpening');

figure('Name', 'Gaussian');
imshow(extended_convolution(image, gKernal)); title(sprintf('sum(K(:)) = %.1f', sum(gKernal(:))));
%% Extended Convolution

function [iOut] = extended_convolution(iSource, k)
    
    %imshow(iSource)
    %iSource = padarray(iSource, 2, "both");
    %imshow(iSource)
    
    filter = 1/9 * [-1 -1 -1 ; -1 17 -1 ; -1 -1 -1];
    s = size(iSource);
    r = zeros(s);
    %disp(s(1))
    %disp(s(2))
    
    for i = 2:s(1)-1
        for j = 2:s(2)-1
            temp = iSource(i-1:i+1,j-1:j+1) .* filter;
            r(i,j) = sum(temp(:));
        end
    end

    iOut = zeros(size(r));
    % doc zeros
    [row, col] = size(r);
    [row2, col2] = size(k);
    %row2 = floor(row2/4)
    %disp(length(iSource(image_row,:)))
    
    for image_row = 1:row
        for pixel = 1:col
            
            accumulator = 0;
            
            for kernel_row = 1:row2
                for element = 1:col2
                    
                    if (image_row+kernel_row-1 <= row) && (pixel+element-1 <= col) 
                        accumulator = accumulator + (k(kernel_row, element) * r(image_row+kernel_row-1, pixel+element-1));
                    end
                    
                end
                
            end
            %disp(accumulator)
            iOut(image_row, pixel) = accumulator;
            %iOut = iOut(3:end-2);
        end
    end
    
end
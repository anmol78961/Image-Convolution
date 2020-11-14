image = im2double(imread('cameraman.tif'));
size(image)

kernelA =  ones(5) / 25;
kernelB = [-1 0 1];

basic = basic_convolution(image, kernelA);

figure('Name', 'Basic Convolution');
subplot(131); imshow(image); title('Input image');
subplot(132); imshow(basic); title('Filtered image');
subplot(133); imshow(basic_convolution(image, kernelB)); title('[-1 0 1]');

%% Basic Convolution

function [iOut] = basic_convolution(iSource, k)

%basic_convolution - returns resultant image of convolution of an 
%image(img) and kernel(k)
%    input a grayscale image (2D matrix) and a filtering kernel 
%    (2D matrix), and returns the convolved image result as a greyscale 
%    image with the same size and datatype as the input image.

%% TODO: finish the rest part of the basic_convolution.
    iOut = zeros(size(iSource));
    [row, col] = size(iSource);
    [row2, col2] = size(k);
    
    for image_row = 1:row
        for pixel = 1:col
            
            accumulator = 0;
            
            for kernel_row = 1:row2
                for element = 1:col2
                    
                    if (image_row+kernel_row-1 <= row) && (pixel+element-1 <= col) 
                        accumulator = accumulator + (k(kernel_row, element) * iSource(image_row+kernel_row-1, pixel+element-1));
                    end
                    
                end
                
            end
            iOut(image_row, pixel) = accumulator;
        end
    end
    
end
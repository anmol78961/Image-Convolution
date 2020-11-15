# Image-Convolution-Lab

## MATLAB Coding
- This lab implements image convolution of greyscale images, a basic image filtering function that is implemented in many computer vision systems (e.g. for edge detection) and most image editing programs such as Photoshop (e.g. for image sharpening).
- The image used here is "cameraman.tif".

## About Basic Convolution
- The function: fun result = basic_convolution(image, kernel) takes a grayscale image (2D matrix) and a filtering kernel (2D matrix) as input , and returns the convolved image result as a greyscale image with the same size and datatype as the input image.

## About Extended Convolution
- The first part is Border Handling:
-- The code centre's the filtered image (so that the content of the input and filtered images is not shifted between them), and then fill in the border regions by extending/replicating the edge pixels of the image (‘clamp-to-edge’).

- The second part is Image Filtering:
-- It demonstrate's 3×3 convolution kernels for computing horizontal, vertical and (any) diagonal image gradients, and sharpening an image using unsharp masking. It also implements a Gaussian low-pass filtering from scratch, which includes a 5×5 kernel and a standard deviation of 1 pixel.

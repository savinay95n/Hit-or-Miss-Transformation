%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Mathematical Morphology: Hit-or-Miss Transform
%
% Input Variables:
%      Img             input image
%      
% Returned Results:
%      Large_Disk_Img  large disk image
%      Small_Disk_Img  small disk image
%      Comb_Img        combination of large & small disk image
%
% Processing Flow:
%      1.  Read the image.
%      2.  Convert the image to binary image with threshold of 127
%      3.  Remove the salt & pepper noise from the binary image using median 
%          filter
%      4.  Create disk shape structuring elements with radii 30 & 8
%      5.  Create window based structuring elements with size 35 & 10
%      6.  Perform hit-or-miss transformation to obtain disks with specific
%          size
%      7.  Highlight the disks and save them on the machine
%      8.  Repeat steps 6 & 7 on the binary image containing noise
%
%
% The following functions are called:
%      imread.m              read the image
%      apply_threshold.m     convert the image to a binary image with threshold of 127
%      hit_or_miss_transf.m  perform the hit or miss transform on the denoised binary image
%      imwrite.m             saves the image
%      generate_image.m      generates the object in the image based on the intersection
%      compute_union.m       performs union on the 2 disk shape images
%
% Author:      Sweekar Sudhakara, Savinay Nagendra, Nagarjuna Pampana and
%              Prapti Panigrahi
% Date:        2/5/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 

%  Read in image "RandomDisks-P10-2.jpg" into array "Img" and  display it on the screen
%  Note that "RandomDisks-P10-2.jpg" is needed in the directory of this .m file
Img = imread('RandomDisks-P10-2.jpg');

% Convert the image to a binary image with a threshold of 127
threshold = 127;
Thr_Img = apply_threshold(Img, threshold);
figure; imshow(Thr_Img);
imwrite(Thr_Img, 'BinaryImage.jpg');

% Remove the salt & pepper noise using the median filter
Filt_Img = medfilt2(Thr_Img);
figure; imshow(Filt_Img);
imwrite(Filt_Img, 'FilteredImage.jpg');

% Generate structuring element A for biggest disk
struc_elem = strel('disk', 30, 8);
temp_struc = double(struc_elem.Neighborhood);
A_struc_large = double(~temp_struc);

% Generate structuring element B (W-A) for biggest disk
struc_elem = strel('disk', 35, 8);
temp_struc = double(struc_elem.Neighborhood);
B_struc_large = double(temp_struc);

% Hit-or-Miss operation on the noise filtered image
Fin_Img = hit_or_miss_transf(Filt_Img, A_struc_large, B_struc_large);
% Generate the big disk image
Large_Disk_Img = generate_image(Filt_Img, Fin_Img); 
figure; imshow(Large_Disk_Img);
imwrite(Large_Disk_Img, 'Large_Disk.jpg');


% Generate structuring element A for smallest disk
struc_elem = strel('disk', 8, 4);
temp_struc = double(struc_elem.Neighborhood);
A_struc_small = double(~temp_struc);

% Generate structuring element B (W-A) for smallest disk
struc_elem = strel('disk', 10, 4);
temp_struc = double(struc_elem.Neighborhood);
B_struc_small = double(temp_struc);

% Hit-or-Miss operation on the noise filtered image
Fin_Img = hit_or_miss_transf(Filt_Img, A_struc_small, B_struc_small);
% Generate the small disk image
Small_Disk_Img = generate_image(Filt_Img, Fin_Img);
figure; imshow(Small_Disk_Img);
imwrite(Small_Disk_Img, 'Small_Disk.jpg');

% Combine the large & small disk image using union and generate a new image
Comb_Img = compute_union(Large_Disk_Img, Small_Disk_Img);
figure; imshow(Comb_Img);
imwrite(Comb_Img, 'Overall_Image.jpg');


% perform hit or miss on noisy image
Fin_Noise_Img = hit_or_miss_transf(Thr_Img, A_struc_large, B_struc_large);
Large_Disk_Img = generate_image(Thr_Img, Fin_Noise_Img);
imwrite(Large_Disk_Img, 'Large_Disk_Noise.jpg');

Fin_Noise_Img = hit_or_miss_transf(Thr_Img, A_struc_small, B_struc_small);
Small_Disk_Img = generate_image(Thr_Img, Fin_Noise_Img);
imwrite(Small_Disk_Img, 'Small_Disk_Noise.jpg');

Comb_Img = compute_union(Large_Disk_Img, Small_Disk_Img);
figure; imshow(Comb_Img);
imwrite(Comb_Img, 'Overall_Noise_Image.jpg');
%%%%%%%%%%%%%%%%%%%%%%%% generate_image.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Generates the object detected after hit-or-miss transformation
%
% Input Variables:
%      Orig_Img   denoised binary image
%      New_Img    image after performing hit-or-miss transform
%      
% Returned Results:
%      Out_Img       processed  image
%
% Processing Flow:
%      1.  Find the locations in transformed image with pixel value '0'
%      2.  Fill the original image at the locations found in previous step
%      3.  Compute intersection between the original image and the complement 
%          of image generated from step 2
%
%   The following functions are called:
%      find.m                finds the locations of the required pixel
%      imfill.m              fills the image regions
%      compute_intersect.m   compute the intersection of 2 images
%
%
% Author:      Sweekar Sudhakara, Savinay Nagendra, Nagarjuna Pampana and
%              Prapti Panigrahi
% Date:        2/5/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = generate_image(Orig_Img, New_Img)

    [M,N] = find(New_Img == 0);
    temp_img = imfill(logical(Orig_Img), [M,N]);
    Out_Img = compute_intersect(Orig_Img, ~temp_img);
    
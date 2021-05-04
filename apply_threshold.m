%%%%%%%%%%%%%%%%%%%%%%%%% apply_threshold.m file %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Convert the image to a binary image
%
% Input Variables:
%      Img      input image
%      Thr      threshold
%      
% Returned Results:
%      Out_Img  binary image
%
% Processing Flow:
%      1.  Convert the image from RGB (3D) to grayscale (2D)
%      2.  Convert the grayscale image to double format
%      3.  Apply the threshold of 127 to convert the grayscale image to
%          binary image by going through each pixel with the logical
%          operation
%      4.  Return the binary image
%          
%
% Author:      Sweekar Sudhakara, Savinay Nagendra, Nagarjuna Pampana and
%              Prapti Panigrahi
% Date:        2/5/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = apply_threshold(Img, Thr)

    % convert the RGB image to grayscale image
    f_gray = double(rgb2gray(Img));

    Out_Img = zeros(size(f_gray));

    % conversion of grayscale image to binary image
    for x = 1 : size(f_gray, 1)
        for y = 1 : size(f_gray, 2)
            if f_gray(x,y) > Thr
                Out_Img(x,y) = 1;
            else
                Out_Img(x,y) = 0;
            end
        end
    end
    
end


%%%%%%%%%%%%%%%%%%%%%%%%% hit_or_miss_transf.m file %%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform the Hit-or-Miss Transformation
%
% Input Variables:
%      X_Img  input denoised binary image
%      A      structuring element with circle enclosed with black pixels
%      B      structuring element (complement of slightly bigger version of A)
%      
% Returned Results:
%      Out_Img  output image after hit-or-miss transformation
%
% Processing Flow:
%      1.  Perform the erosion operation on image X using A
%      2.  Perform the erosion operation on image ~X using B
%      3.  Compute intersection between the result of step 1 & 2
%      
%
%   The following functions are called:
%      erosion_oper.m        perform the erosion operation
%      compute_intersect.m   return the intersection of 2 images
%
%
% Author:      Sweekar Sudhakara, Savinay Nagendra, Nagarjuna Pampana and
%              Prapti Panigrahi
% Date:        2/5/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = hit_or_miss_transf(X_Img, A, B)

Eroded_Img = erosion_oper(X_Img, A);
Eroded_Img2 = erosion_oper(~X_Img, B);
Out_Img = compute_intersect(Eroded_Img, Eroded_Img2);


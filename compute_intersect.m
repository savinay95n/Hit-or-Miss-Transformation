%%%%%%%%%%%%%%%%%%%%%%% compute_intersect.m file %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute the intersection between two images
%
% Input Variables:
%      X     image 1 in binary format
%      Y     image 2 in binary format
%      
% Returned Results:
%      Out_Img   intersection between X & Y
%
% Processing Flow:
%      1.  Iterate through individual pixels of both images
%      2.  If both the pixels are 0 then set the output pixel to 0
%      3.  Return the output image
%
%
% Author:      Sweekar Sudhakara, Savinay Nagendra, Nagarjuna Pampana and
%              Prapti Panigrahi
% Date:        2/5/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out_Img = compute_intersect(X, Y)

Out_Img = ones(size(X));

for i = 1:size(X,1)
    for j = 1:size(X,2)
        if X(i,j) == 0 && Y(i,j) == 0
            Out_Img(i,j)=0;
        end
    end
end

function [ keypoints ] = localextrema( DOG )
%LOCALEXTREMA SIFT -step 2 
%   Determine the local extrema of DOG images 

[venda,j]=size(DOG);
[venda,venda1,nblur_levels]=size(DOG{1});




for k=1:j
    disp(strcat('finding local extrema for octave ',int2str(k)));
    
   
    
    copyimage=imread(strcat('output/scales/scale-',strcat(int2str(k),'.png')));
    disp(size(copyimage));
    copyimage=uint8(copyimage);
    copyimage=cat(3,copyimage,copyimage,copyimage);
%     hold off
%     image(DOG{k}(:,:,1));
   for l=2:nblur_levels-1
         im=DOG{k};
         [r,c]=size(im(:,:,1));
         
         for m=2:r-1
             for n=2:c-1
                uppermat=im(m-1:m+1,n-1:n+1,l-1);
                lowermat=im(m-1:m+1,n-1:n+1,l+1);
                neighbour8=im(m-1:m+1,n-1:n+1,l);
                largest=max(uppermat(:));
                largest2=max(lowermat(:));
                largestinsame=max(neighbour8(:));
                %disp(largest);
                %disp(largestinsame);
                if(largestinsame>largest&&largestinsame>largest2&&largestinsame==im(m,n,1))
                   
                                      copyimage(m,n,1)=255;
                                      copyimage(m,n,2)=0;
                                      copyimage(m,n,3)=0;
                   
                   
                end
                
             end
         end
           
        
   end
   
   imwrite(copyimage,strcat('output/keypoints/key',strcat(int2str(k),'.png')));
end


end


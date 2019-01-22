a=imread('lena.jpg');
img=rgb2gray(a);
b=padarray(img,[1 1],0,'both');
imshow(b);
weights=[1 2 4 8 16 32 64 128];
temp = zeros(size(img));
for y= 2:321
    for x=2:257
       neighbour = [b(x+1,y) b(x+1,y+1) b(x,y+1) b(x-1,y+1) b(x-1,y) b(x-1,y-1) b(x,y-1) b(x+1,y-1)];
       bit_pattern = neighbour(1,:) > b(x,y) ;
       values = weights.*bit_pattern ;
       total = sum(values);
       temp(x-1,y-1) = total;
    end
end
imshow(temp);
       
     


   
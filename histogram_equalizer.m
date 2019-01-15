clc; clear; close all;

Img = [52 55 61 59 70 61 76 61; 62 59 55 104 94 85 59 71; 63 65 66 113 144 104 63 72; 64 70 70 126 154 109 71 69; 67 73 68 106 122 88 68 68; 68 79 60 79 77 66 58 75; 69 85 64 58 55 61 65 83; 70 87 69 68 65 73 78 90];
total_pixels = size(Img,1)*size(Img,2);

subplot(2,2,1);
imshow(Img/255);
title('Original Grayscale Image');

Img_hist = uint8(zeros(size(Img,1),size(Img,2)));
freq = zeros(256,1); %occurence of each pixel
probf = zeros(256,1); %probability
probc = zeros(256,1);
cummulative = zeros(256,1);
output = zeros(256,1);
n=1:256;

for i = 1:size(Img,1)
    for j = 1:size(Img,2)
        value = Img(i,j);
        freq(value+1) = freq(value+1)+1;
        probf(value+1) = freq(value+1)/total_pixels;
    end
end

subplot(2,2,2);
hist(Img);
title('Histogram of original image');


sum = 0;
max_val = 255;

%CDF
for i = 1:size(probf)
   sum = sum+freq(i);
   cummulative(i) = sum;
   probc(i) = cummulative(i)/total_pixels;
   output(i) = round(probc(i)*max_val);
end
z = 1;
for i = 1:size(cummulative)
   if cummulative(i)>0
       filtered(z) = cummulative(i);
       z = z+1;
   end
end

minimum = min(filtered);
maximum = max(filtered);



for i = 1:size(Img,1)
    for j = 1:size(Img,2)
            Img_hist(i,j) = round(cummulative(Img(i,j)+1)*255/63);
    end
end

subplot(2,2,3);
imshow(Img_hist);
title('Histogram equalization');

subplot(2,2,4);
imhist(Img_hist);
title('Histogram of Enhanced Image');

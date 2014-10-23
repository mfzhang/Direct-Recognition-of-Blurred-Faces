function A = getMatrixFromIm( im, kernelSize,boundary)
%GETMATRIXFROMIM 得到函数mat A，先默认为replicate方式
%   Author:buptlijun
pad = kernelSize-floor((kernelSize + 1)/2);
a = padarray(im,pad,boundary,'both');
A=zeros(size(im,1)*size(im,2),kernelSize(1)*kernelSize(2));
n=1;
for y=pad(2)+1:size(im,2)+pad(2)
    for x=pad(1)+1:size(im,1)+pad(1)
        window=a(x-pad(1):x+pad(1),y-pad(2):y+pad(2));
%         window=imrotate(window,-180);
        A(n,:)=window(:)';
        n=n+1;
    end
end
A=fliplr(A);  %卷积conv 需要翻转一下
end
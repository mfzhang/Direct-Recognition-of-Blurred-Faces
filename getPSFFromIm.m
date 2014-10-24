function [hVal, rVal] = getPSFFromIm( Ib,A,kernelSize )
%GETPSFFROMIM 根据Ib预测Ij(A)模糊的最佳PSF
%   L2，不加W
lh=kernelSize(1)*kernelSize(2);
H=2*A'*A;
f=-2*A'*Ib;
lb=zeros(lh,1);
ub=[];

beq=zeros((lh+1)/2,1);
beq((lh+1)/2)=1;
Aeq=zeros((lh+1)/2,lh);
for i=1:(lh-1)/2
    Aeq(i,i)=1;
    Aeq(i,lh+1-i)=-1;
end
Aeq((lh+1)/2,:)=ones(1,lh);


%求解
[hVal,rVal]=quadprog(H,f,[],[],Aeq,beq,lb,ub);

%显示模糊后图像
%imshow(reshape(A*hVal,[150 130]),[])

end


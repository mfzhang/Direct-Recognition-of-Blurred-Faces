Direct-Recognition-of-Blurred-Faces
===================================

Implemention of Method in paper 'Blur and Illumination invariant face recognition via set-theoretic characterization'

    kernelSize=size(filter);
    A=getMatrixFromIm(im,kernelSize,boundrary);
    h=filter(:);
    Ib=Ah;

is equal to

    imBlurred=imfilter(im,filter,boundrary,'conv');
    Ib=imBlurred(:);

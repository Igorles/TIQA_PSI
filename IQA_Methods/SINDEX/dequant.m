%--------------------------------- DEQUANT ---------------------------------
%
% author: Lionel Moisan                                   
%
% Image dequantization using a (1/2,1/2) translation in Fourier domain 
%
% reference: A. Desolneux, S. Ladjal, L. Moisan, J.-M. Morel, 
% "Dequantizing image orientation", IEEE Transactions on Image Processing,
% vol. 11(10), pp. 1129-1140, 2002.
%
% usage:   v = dequant(u)
%
% input: a 2D array (Matlab matrix)
% output: a 2D array (same size as u)
%
% v1.0 (02/2014): initial version 

function v = dequant(u)

[ny,nx] = size(u);
mx = floor(nx/2); my = floor(ny/2);
Tx = exp(-i*pi/nx*( mod(mx:mx+nx-1,nx)-mx ));
Ty = exp(-i*pi/ny*( mod(my:my+ny-1,ny)-my ));
v = real(ifft2(fft2(u).*(Ty.'*Tx))); 

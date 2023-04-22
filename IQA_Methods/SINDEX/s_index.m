%---------------------------- s_index ----------------------------

% Compute the simplified sharpness index (S) of a numerical image
%
%               author: Lionel Moisan
%
%  This program is freely available on the web page
%
%     http://www.mi.parisdescartes.fr/~moisan/sharpness/
%
%  It implements the S Index described in the paper

% You may freely use the programs given below. If you do, please make reference to this web page and to the corresponding paper.
% If you want to distribute the codes, please do not modify them (or if you do so, indicate clearly in the codes that you did).

%  A. Leclaire, L. Moisan, No-reference image quality assessment 
%  and blind deblurring with sharpness metrics exploiting Fourier 
%  phase information, preprint MAP5 n° 2014-03, 2014.
%
%  If you use it for a publication, please mention this paper
%  If you modify this program, please indicate in the code that you 
%  did so and leave this message.
%  You can report bugs or suggestions to lionel.moisan [AT] parisdescartes.fr
%
% usage:    s = s_index(u)   or   s = s_index(u,pmode) 
%
% u is an image (a 2D array = a Matlab matrix)
%
% available preprocessing modes are:
%
% pmode = 0             raw S index of u
% pmode = 1             S index of the periodic component of u 
% pmode = 2             S index of the 1/2,1/2-translated of u 
% pmode = 3 (default)   S index of the 1/2,1/2-translated 
%                       of the periodic component of u
%
% Default mode (pmode = 3) should be used, unless you want to work on very
% specific images that are naturally periodic or not quantized (see paper)
%
% note: this function also works for 1D signals (line or column vectors)
%
% v1.0 (02/2014): initial version from s_index.sci v1.2

% dependencies: dequant, perdecomp, logerfc

function s = s_index(u,pmode)
u = double(rgb2gray(u));
if (nargin<2) pmode = 3; end
if (pmode==1) | (pmode==3) u = perdecomp(u); end
if (pmode==2) | (pmode==3) u = dequant(u); end
u = double(u);
[ny,nx] = size(u);
gx = u(:,[2:nx,1])-u;
gy = u([2:ny,1],:)-u;
tv = sum(sum(abs(gx)+abs(gy)));
fu = fft2(u);
p = 0:nx-1; q = 0:ny-1;
P = repmat(p,ny,1)*2*pi/nx; Q = repmat(q',1,nx)*2*pi/ny;
fgx2 = fu.*sin(P/2); fgx2 = real(4*fgx2.*conj(fgx2));
fgy2 = fu.*sin(Q/2); fgy2 = real(4*fgy2.*conj(fgy2));
fgxx2 = sum(sum(fgx2.^2));
fgyy2 = sum(sum(fgy2.^2));
fgxy2 = sum(sum(fgx2.*fgy2));
vara = 0; % the simplified variance
axx = sum(sum(gx.^2));    if (axx>0) vara = vara+fgxx2/axx; end
ayy = sum(sum(gy.^2));    if (ayy>0) vara = vara+fgyy2/ayy; end
axy = sqrt(axx*ayy);      if (axy>0) vara = vara+2*fgxy2/axy; end
vara = vara/(pi*nx*ny);
if vara>0 
  % t = ( E(TV)-tv )/sqrt(vara)
  t = ( (sqrt(axx)+sqrt(ayy))*sqrt(2*nx*ny/pi) - tv )/sqrt(vara);
  % s = -log10(P(N(0,1)>t))
  s = -logerfc(t/sqrt(2))/log(10)+log10(2); 
else 
  s = 0; 
end


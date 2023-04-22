%----------------------- global_phase_coherence -----------------------
%
%    Compute the Global Phase Coherence (GPC) of a numerical image
%
%               author: Lionel Moisan
%
%  This program is freely available on the web page
%
%     http://www.mi.parisdescartes.fr/~moisan/sharpness/
%
%  It implements the Sharpness Index (SI) described in the paper
%
%  G. Blanchet, L. Moisan, B. Rougé. Measuring the global phase
%  coherence of an image, proceedings of the IEEE International Conference 
%  on Image Processing (ICIP), pp. 1176-1179, 2008.
%
%  If you use it for a publication, please mention this paper
%  If you modify this program, please indicate in the code that you 
%  did so and leave this message.
%  You can report bugs or suggestions to lionel.moisan [AT] parisdescartes.fr
%
% usage:       gpc = global_phase_coherence(u)   
%          or  gpc = global_phase_coherence(u,N)
%          or  gpc = global_phase_coherence(u,N,pmode)
%
% u is an image (a 2D array = a Matlab matrix)
%
% N is the number of Monte-Carlo iterations used to estimate gpc
% (default value: 100)
%
% available preprocessing modes are:
%
% pmode = 0             raw global phase coherence of u
% pmode = 1             global phase coherence of the periodic component of u 
% pmode = 2             global phase coherence of the 1/2,1/2-translated of u 
% pmode = 3 (default)   global phase coherence of the 1/2,1/2-translated 
%                       of the periodic component of u
%
% Default mode (pmode = 3) should be used, unless you want to work on very
% specific images that are naturally periodic or not quantized (see paper)
%
% Remarks: 
%   - this function also works for 1D signals (line or column vectors)
%   - the convergence is very slow (run the function several times to
%       have an idea of the precision attained for the value of N used)
%
% v1.0 (02/2014): initial version from global_phase_coherence.sci v1.3

% dependencies: dequant, perdecomp, logerfc

function gpc = global_phase_coherence(u,N,pmode)

if (nargin<2) N = 100; end
if (nargin<3) pmode = 3; end
if (pmode==1) | (pmode==3) u = perdecomp(u); end
if (pmode==2) | (pmode==3) u = dequant(u); end
u = double(u);
% initialization for random phases
[ny,nx] = size(u);
fu = fft2(u);
x = 1:nx; y = 1:ny; X = repmat(x,ny,1); Y = repmat(y',1,nx);
Xp = mod(nx+1-X,nx)+1; Yp = mod(ny+1-Y,ny)+1;
i0 = (X-1)*ny+Y; ip = (Xp-1)*ny+Yp;
A = find(ip>i0);
B = find(ip==i0);
phi = zeros(ny,nx);
% compute (anisotropic) Total Variation of u
tvu = sum(sum( abs(u(:,[2:nx,1])-u)+abs(u([2:ny,1],:)-u) ));
% MAIN LOOP (Monte-Carlo samples)
tv = zeros(1,N);
for k=1:N  
  % build random phases with Hermitian symmetry
  phi(A) = rand(size(A))*2*pi;
  phi(ip(A)) = -phi(A);
  phi(B) = pi*randi([0,1],size(B));
  % compute TV of random phase image
  v = real(ifft2(fu.*exp(i*phi)));
  tv(k) = sum(sum( abs(v(:,[2:nx,1])-v)+abs(v([2:ny,1],:)-v) ));
end
% estimate first and second order moments
mu = sum(tv)/N;
var = sum((tv-mu).^2/(N-1));
% t is the estimate of ( E(TV)-tv )/sqrt(var(TV))
t = (mu-tvu)/sqrt(var);
% gpc = -log10(P(N(0,1)>t))
gpc = -logerfc(t/sqrt(2))/log(10)+log10(2);



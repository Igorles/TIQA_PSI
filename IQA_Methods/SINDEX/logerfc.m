%--------------------------------- LOGERFC ---------------------------------
%
% author: Lionel Moisan                                   
%
% Compute the logarithm of the complementary error function for any x
%
% usage:   y = logerfc(x)
%
% for x<=20, logerfc(x) = log(erfc(x)) 
% for x>20, a direct asymptotic formula is used to avoid machine underflow
%
% note: x can also be a vector or a matrix
%
% v1.0 (02/2014): initial version 
% v1.1 (02/2014): extension to x vector or matrix

function y = logerfc(x)
  y = x;
  T = (x>20);
  if sum(T(:))>0
    X = x(T);
    z = X.^(-2);
    s = ones(size(X));
    for k=8:-1:1
      s = 1-(k-0.5)*z.*s;
    end
    y(T) = -0.5*log(pi)-X.^2+log(s./X);
  end
  y(~T) = log(erfc(x(~T)));
end

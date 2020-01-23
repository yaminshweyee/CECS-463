function [p,np,r,nr] = deconv_m(b,nb,a,na) % Modified deconvolution routine for noncausal sequences
% function [p,np,r,nr] = deconv_m(b,nb,a,na) %
% p=polynomial part of support np1 <= n <= np2
% np =[np1, np2]
% r=remainder part of support nr1 <= n <= nr2
% nr =[nr1, nr2]
% b=numerator polynomial of support nb1 <= n <= nb2
% nb =[nb1, nb2]
% a=denominator polynomial of support na1 <= n <= na2 
% na =[na1, na2]
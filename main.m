
%sift 
dog=octavegen('samples/prave.bmp')
if(iscell(dog)==0)
   disp('error');
end
disp('generated octaves');
keys=localextrema(dog);

%orientation_assign(keys);


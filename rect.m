function [output,t] = rect(Fs,amplitude,width,duration)
zerotime= (duration-width)*Fs;
t = 0:1/Fs:duration-1/Fs;
t = t-(duration/2);
output = amplitude*ones(1,width*Fs);
output = [zeros(1,ceil(zerotime/2)) output zeros(1,floor(zerotime/2))];
end
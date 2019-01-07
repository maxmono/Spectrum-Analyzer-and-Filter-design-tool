function [output, t]=trig(Fs,amplitude,width,duration)
    t=-duration/2:1/Fs:duration/2-1/Fs;
    output = amplitude*(1-abs(t/width*2)) .* (t/width*2>=-1) .*(t/width*2<1);
end
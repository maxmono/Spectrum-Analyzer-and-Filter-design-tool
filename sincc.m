function [output,t] = sincc(Fs,amplitude,mainLoopW,duration)
    t=-duration/2:1/Fs:duration/2-1/Fs;
   
    output = amplitude*sinc(t/mainLoopW);
    
end
function [ h,Hw,w,D, error ] = myFilterDesigner( N,L,w_0,w_p,w_s,K_p,K_s,mode )
M = (N-1)/2;

wo = w_0*pi; % cut-off frequency
wp = w_p*pi; % pass-band frequency
ws = w_s*pi; % stop-band frequency

frequencyAxis = [0:L]'*pi/L; % frequency axis ( 0 -> pi)
if mode ==0
D = frequencyAxis < wo; % desired response
else
D = frequencyAxis > wo; % desired response
end
W = diag(sqrt(K_p*(frequencyAxis <= wp)+K_s*(frequencyAxis >= ws))); % weight diagonal (L+1 * L+1 zero matrix with weights on the diagonal) 

C = cos(frequencyAxis*[0:M]); % rectangular C matrix
a = (W*C)\(W*D); % solve linear system to get a(n)

h = [a(M+1:-1:2); 2*a(1); a(2:M+1)]/2; % form impulse response h(n) (impulse response truncation)

[Hw, w] = freqz(h,1,L); % H(w)
w = w/pi; % normalized frequency axis
D= D(1:L);
D=D-1e-7;
error = sum( (abs(Hw) - abs(D)).^2 ); % LS error

end


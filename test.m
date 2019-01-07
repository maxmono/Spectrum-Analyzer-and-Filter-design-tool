N=31;
M = (N-1)/2;
L=512;
K_p = 1;K_s = 1;
wo = 0.25*pi; % cut-off frequency
wp = 0.2*pi; % pass-band frequency
ws = 0.3*pi; % stop-band frequency

frequencyAxis = [0:L]'*pi/L; % frequency axis ( 0 -> pi)
D = frequencyAxis < wo; % desired response
W = diag(sqrt(K_p*(frequencyAxis <= wp)+K_s*(frequencyAxis >= ws))); % weight diagonal (L+1 * L+1 zero matrix with weights on the diagonal) 

C = cos(frequencyAxis*[0:M]); % rectangular C matrix
a = (W*C)\(W*D); % solve linear system to get a(n)

h = [a(M+1:-1:2); 2*a(1); a(2:M+1)]/2; % form impulse response h(n) (impulse response truncation)

%%
myFilterDesigner(31,512,0.25,0.2,0.3,1,1,0);
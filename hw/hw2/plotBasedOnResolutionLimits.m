function plotBasedOnResolutionLimits(sampleNumber,deltaF)
N = 100;
NFFT = 100000;
n = 0:N-1;
k=0:NFFT-1;
fk = k/NFFT;
f1 = 0.2;

% Time vector
x = cos(2*pi*f1*n) + cos(2*pi*(f1+deltaF)*n);
x=x';
x_FFT = fft(x,NFFT);
figure(sampleNumber*10), plot(fk,abs(x_FFT))
title('deltaF: '+string(deltaF)+ " rectangular window");
% ....

hammingWin = hamming(N);
x_HM_FFT = fft(x.*hammingWin,NFFT);
figure(sampleNumber*10+1), plot(fk,abs(x_HM_FFT))
title('deltaF: '+string(deltaF)+ " Hamming window");
% .........

blackmanWin = blackman(N);
x_BM_FFT = fft(x.*blackmanWin,NFFT);
figure(sampleNumber*10+2), plot(fk,abs(x_BM_FFT))
title('deltaF: '+string(deltaF)+ " Blackman window");

end
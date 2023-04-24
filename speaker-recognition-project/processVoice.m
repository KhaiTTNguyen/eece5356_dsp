function [voice] = processVoice(fileName)
% break signal into frames
% length of frame (Twin) is best between 10-50ms. Take Twin = % 0.04sec, or 40ms 
% break Twin into samples 
[x,Fs]=audioread(fileName);

% keep 1 column only
x=x(:,1);
Twin=0.040; 
% Number of samples for each frame/window. Fs - sampling freq
Nwin=round(Twin*Fs);

% when use spetrogram function, we want some overlap between neighboring
% windows
Noverlap=round(Nwin/2); % 50% overlap

% to calculate DFT of each frame/window, need NFFT.
% large NFFT --> more frequency samples for visualization
% small NFFT --> here no need to visual
NFFT = Nwin; % no zero-pad

% human brain/ear system primarily use the 'magnitude of the FT' rather than
% 'phase of FT'
% spectrogram (time vs Freq)
% thus take spectrogram & take magnitude
S=spectrogram(x,hamming(Nwin),Noverlap,NFFT,Fs); 
S=abs(S); 

% break speech signal into frames -  each length Twin
% 1st column is DFT(frame1)
% 2nd column is DFT(frame2)
% ....
% row index = k: row1~k=0
% each row ~ 1 frequency sample 
% 1st row k = 0, freq = 0 --> DC offset cant be heard --> discard
% ...

[nrows,ncols] = size(S);
S=S(2:nrows,:); % or 2:round(nRows/2) - leave out first row

% each recordings have different volumnes/gains
% Normalize a frame
for i=1:ncols
    tmp=S(:,i);
    S(:,i)=tmp/norm(tmp); % SUPER IMPORTANT to normalize
end

% S is now a matrix of short fundamental sounds a speaker makes.
voice = S;
end


% -----------------sample-----------------
% [x,Fs]=audioread('john1.wav')
% x=x(:,1);
% Twin=0.040; % 0.04sec, or 40ms 
% Nwin=round(Twin*Fs);
% Noverlap=round(Nwin/2); % 50% overlap
% NFFT = Nwin; % no zero-pad
% S=spectrogram(x,hamming(Nwin),Noverlap,NFFT,Fs);
% S=abs(S); 
% % 1st column is DFT(frame1)
% % 2nd column is DFT(frame2)
% % ....
% % row index = k: row1~k=0
% 
% [nrows,ncols] = size(S);
% S=S(2:nrows,:) % or 2:round(nRows/2)
% 
% % Normalize a frame
% for i=1:ncols
%     tmp=S(:,i);
%     S(:,i)=tmp/norm(tmp); % SUPER IMPORTANT to normalize
% end
% John1 = S;

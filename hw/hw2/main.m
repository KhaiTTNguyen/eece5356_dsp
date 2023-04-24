deltaF = [0.01,0.03,0.05,0.08,0.1,0.15,0.2];
for sampleNumber=1:numel(deltaF)
    plotBasedOnResolutionLimits(sampleNumber,deltaF(sampleNumber))
end

%%
rectangularFPeakEstimate = [
    0.19819,0.19912,0.19946,0.19967,0.19974,0.19983,0.19987];

hammingFPeakEstimate = [
    0.19626,0.199935,0.19987,0.19990,0.19992,0.19995,0.19996];

blackmanFPeakEstimate = [
    0.19425,0.19997,0.20003,0.20001,0.2,0.2,0.2];


figure(99), plot(deltaF,rectangularFPeakEstimate)
hold on
plot(deltaF,hammingFPeakEstimate)
plot(deltaF, blackmanFPeakEstimate)
legend('rect','hamming','blackman')
hold off

figure(91), plot(deltaF,rectangularFPeakEstimate), legend('rect')
figure(92), plot(deltaF,hammingFPeakEstimate),legend('hamming')
figure(93), plot(deltaF, blackmanFPeakEstimate),legend('blackman')
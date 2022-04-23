clc
clear all
Data = importdata('Voltage_Poroject.txt');
samples=[Data(:,2)];
N=8192;
output_fft=(abs(fft(samples,N)));
Ts=10e-9;
Fs=1/Ts;
f=[0:N/2]*Fs/N;
%SNDR & SFDR calculation
output_fft=output_fft(1:N/2+1)/N;
output_noise=output_fft;
output_noise(output_noise==max(output_noise))=0;
sndr_db=10*log10(max(output_fft)^2/(sum(output_noise.^2)));
sfdr_db=10*log10(max(output_fft)^2/max(output_noise)^2);
%plot
plot(f,20*log10(output_fft/max(output_fft)))
axis([0 max(f) -180 0])
xlabel('Frequency[fin/fs]"Hz"')
ylabel('DFT Magnitude [dbfs]')
title('Normalized FFT of Output')
%print(SNDR,SFDR)
fprintf('SNDR=  %f   decibel\n',sndr_db)
fprintf('SFDR=  %f   decibel\n',sfdr_db)
grid on

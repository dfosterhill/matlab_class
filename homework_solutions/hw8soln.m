%ce 640 / oc 512
%hw 8 solution
%d. hill

clear all
close all

%create the time series of data.
%specificy amplitudes and phases
A=[0.5 0.25 1.5];
T=[10 200 12.5*3600];

%create time vector
dt=0.5;
t=0:dt:7*24*3600;

%calculate sampling frequency
fs=1/dt;

%sum the three sin waves
signal=sum(A'.*sin(2*pi./T'.*repmat(t,[3,1])));

%add random noise
signal=signal+0.1*randn(size(signal));

%note: the sampling frequency (with dt = 0.5s) is 2 Hz. One half of this is
%1 Hz. Also note: the frequencies of our three waves are 0.1 Hz, 0.005 Hz,
%and 2.2e-5 Hz.

%isolate wave: We need to 'bracket' the wave frequency with two cutoffs. 
%In other words, we need to do a bandpass to cut out the low frequency stuff
%and cut out the high frequency noise. If we use 0.15 and 0.08 Hz as 
%limits, that should work. We compute our 'normalized' cutoffs as the 
%actual cutoffs divided by 1/2 the sampling rate (which is 1 for this
%problem). Note that the quality of your result will vary strongly with how
%close your cutoff frequencies are compared to the frequency you are trying
%to isolate.
Wn=[0.08 0.15]/(fs/2);
[B,A]=butter(3,Wn); %this will do a bandpass
signal_wave=filtfilt(B,A,signal);

%isolate infragravity wave.
Wn=[.004 .006]/(fs/2);
[B,A]=butter(3,Wn); %this will do a bandpass
signal_ig=filtfilt(B,A,signal);

%isolate tide wave. Here we just do a lowpass.
Wn=[1e-4]/(fs/2);
[B,A]=butter(3,Wn,'low'); %this will do a bandpass

signal_tide=filtfilt(B,A,signal);

%let's plot the results. I will set axes for each subplot for good
%readability.
figure(1)
subplot(4,1,1);
plot(t,signal);
axis([0 86400 -2.5 2.5])
xlabel('t (s)'); ylabel('\eta (m)')
title('Full signal');

subplot(4,1,2)
plot(t,signal_wave);
xlabel('t (s)'); ylabel('\eta (m)')
axis([0 100 -1 1]);
title('Wave signal')

subplot(4,1,3)
plot(t,signal_ig);
xlabel('t (s)'); ylabel('\eta (m)')
axis([0 1000 -.5 .5])
title('Infragravity wave signal')

subplot(4,1,4)
plot(t,signal_tide);
xlabel('t (s)'); ylabel('\eta (m)')
axis([0 2*86400 -1.5 1.5])
title('Tide signal')

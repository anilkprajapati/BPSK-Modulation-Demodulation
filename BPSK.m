%BPSK Modulation 
%Reference: https://www.youtube.com/watch?v=PZoNwTYl0IM
clear 
clc
% Input Sequence
%n=[1,0,1,0,1];
n=randi([0,1],1,5)
% Mapping
for ii=1:length(n)
    if n(ii)==1;
        nn(ii)=1;
    else
        nn(ii)=-1;
    end
end
%Pulse Shaping
i=1;
t=0:0.01:length(n);
for j=1:length(t)
    if t(j)<=i;
        y(j)=nn(i);
    else
        y(j)=nn(i);
        i=i+1;
    end
end
% Plotting
subplot(4,1,1);
plot(t,y,'r-');
axis([0 length(n) -2 2]);
grid on;
ylabel('Amplitude');
xlabel('Time');
title('Message Signal');

% carrier
c=cos(2*pi*2*t);
subplot(4,1,2);
plot(t,c,'k-');
grid on;
ylabel('Amplitude');
xlabel('Time');
title('Carrier Signal');

%BPSK MODULATION
x=y.*c;
subplot(4,1,3);
plot(t,x, 'b-');
grid on;
ylabel('Amplitude');
xlabel('Time');
title('BPSK Signal');


% Detection and recontruction
for j=1:length(t)
    if x(j)==c(j)
        det(j)=1;
    else
        det(j)=-1;
    end
end
subplot(4,1,4);
plot(t,det,'m-');
grid on;
ylabel('Amplitude');
xlabel('Time');
title('Recovered Msg Signal');
axis([0 length(n) -2 2]);

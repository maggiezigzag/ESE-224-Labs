%% 3.1 DFT of an A note

clear;
f0 = 440;
fs = 44100;
T = 2;
ANote = cosine_gen(fs,T,f0);
[f,X,fc,Xc]=dft(ANote,fs);
mx = abs(Xc);
plot(fc,mx);
xlabel('Real frequency Fk');
ylabel('DFT Value');
title('DFT for A note');
energyA = dot(mx,mx);
Anote90 = mx(fc<500 & fc>-500);
energyA90 = dot(Anote90,Anote90);

%% 3.2 DFT of a musical piece

fs = 44100;
T = 0.5*[1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 ... 
    1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2];
notes = [40 40 47 47 49 49 47 45 45 44 44 42 42 40 47 47 ...
    45 45 44 44 42 47 47 45 45 44 44 42 40 40 47 47 49 ...
    49 47 45 45 44 44 42 42 40];
melody = [];
for i = 1:length(notes)
    f0 = 2^((notes(i)-49)/12)*440;
    [note,N]=cosine_gen(fs, T(i), f0);
    melody = [melody note zeros(1,10)]; 
end
[f,X,fc,Xc]=dft(melody,fs);
mx = abs(Xc);
plot(fc,mx);
xlabel('Real frequency Fk');
ylabel('DFT Value');
title('DFT for Twinkle Twinkle Little Star');

% The DFT shows 6 peaks which confirms that the song
% "Twinkle Twinkle Little Star" has 6 notes.

%% 3.3 Energy of different tones of a musical piece

Cnote = mx(fc<275 & fc>250);
energyC = dot(Cnote,Cnote);
Dnote = mx(fc<297 & fc>290);
energyD = dot(Dnote,Dnote);
Enote = mx(fc<335 & fc>325);
energyE = dot(Enote,Enote);
Fnote = mx(fc<351 & fc>347);
energyF = dot(Fnote,Fnote);
Gnote = mx(fc<394 & fc>391);
energyG = dot(Gnote,Gnote);
Anote = mx(fc<442 & fc>438);
energyA = dot(Anote,Anote);

%% 3.4 DFT of an A note of different musical instruments

oboe = [1.386, 1.370, 0.360, 0.116, 0.106, 0.201, 0.037, 0.019];
flute = [0.260,0.118,0.085,0.017,0.014];
trumpet = [1.167,1.178,0.611,0.591,0.344,0.139, 0.090,0.057,0.035,0.029,0.022,0.020,0.014];
clarinet  =[0.061,0.628,0.231,1.161,0.201,0.328,0.154,0.072,0.186,0.133, 0.309,0.071,0.098,0.114...
    0.027,0.057,0.022,0.042,0.023];
 
T=2; %Signal of 2 seconds
f0 = 440; %Frequency of note A is 440 Hz
[OboeAnote, N] = cosine_harmonics(fs, T, f0, oboe);
[FluteAnote, N] = cosine_harmonics(fs, T, f0, flute);
[TrumpetAnote, N] = cosine_harmonics(fs, T, f0, trumpet);
[ClarinetAnote, N] = cosine_harmonics(fs, T, f0, clarinet);
 
%DFT of A note 
[f, X, fc, XcO]= dft(OboeAnote,fs); %calling the DFT for A note of an Oboe 
mxO = abs(XcO);
figure
plot(fc, mxO);
xlabel("Real frequency Fk");
ylabel("DFT Value");
title("DFT for Oboe A note w. freq. 44100");
hold off
energyOboe = dot(mxO,mxO);
oboeA = mxO(fc<4000 & fc>-4000);
energyOboe90 = dot(oboeA,oboeA);
 
figure %Conjugate of the Oboe 
CONJOboe = conj(XcO);
plot(fc,real(CONJOboe));
legend('Conjugate of the Oboe DFT');
xlabel("Real frequency Fk");
ylabel("DFT Values");
title("Conjugate of the Oboe DFT");
 
[f, X, fc, XcF]= dft(FluteAnote,fs); %calling the DFT for A note of an Oboe 
mxF = abs(XcF);
figure
plot(fc, mxF);
xlabel("Real frequency Fk");
ylabel("DFT Value");
title("DFT for Flute A note w. freq. 44100");
hold off 
energyFlute = dot(mxF,mxF);
fluteA = mxF(fc<3000 & fc>-3000);
energyFlute90 = dot(fluteA,fluteA);
 
[f, X, fc, XcT]= dft(TrumpetAnote,fs); %calling the DFT for A note of an Oboe 
mxT = abs(XcT);
figure
plot(fc, mxT);
xlabel("Real frequency Fk");
ylabel("DFT Value");
title("DFT for Trumpet A note w. freq. 44100");
hold off
energyTrumpet = dot(mxT,mxT);
trumpetA = mxT(fc<6000 & fc>-6000);
energyTrumpet90 = dot(trumpetA,trumpetA);
 
[f, X, fc, XcC]= dft(ClarinetAnote,fs); %calling the DFT for A note of an Oboe 
mxC = abs(XcC);
figure
plot(fc, mxC);
xlabel("Real frequency Fk");
ylabel("DFT Value");
title("DFT for Clarinet A note w. freq. 44100");
energyClarinet = dot(mxC,mxC);
clarinetA = mxC(fc<9000 & fc>-9000);
energyClarinet90 = dot(clarinetA,clarinetA);
 
hold off

%% 3.5 playing Twinkle Twinkle little star with the flute 

fs = 44100;
flute = [0.260,0.118,0.085,0.017,0.014];
T = 0.5*[1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 ... 
    1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2];
notes = [40 40 47 47 49 49 47 45 45 44 44 42 42 40 47 47 ...
    45 45 44 44 42 47 47 45 45 44 44 42 40 40 47 47 49 ...
    49 47 45 45 44 44 42 42 40];
melody = [];
for i = 1:length(notes)
    f0 = 2^((notes(i)-49)/12)*440;
    [note,N]=cosine_harmonics(fs, T(i),f0, flute);
    melody = [melody note zeros(1,10)]; 
end

[f,X,fc,Xc]=dft(melody,fs);
mx = abs(Xc);
figure
plot(fc,mx);
xlabel("Real frequency Fk");
ylabel("DFT Value");
title("Total DFT Sum for flute playing twinkle twinkle star");
hold off

flute = mx(fc<2000 & fc>-2000);
energyFlute = dot(flute,flute);

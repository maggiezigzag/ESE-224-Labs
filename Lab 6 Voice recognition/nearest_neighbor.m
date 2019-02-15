%% Nearest Neighbor Comparison
% compare the unknown signal with every singal in the training set and
% classify it based on which it matches most closely.

% record sound for 2 seconds  
sound = record_sound(2,20000,8,1);

% pass it into the frequency domain and normalize it to look nicer
[~,~,f_c,X_c] = dft(sound,20000);
X = X_c / norm(X_c);

% Using variables like one_recording_matrix and two_recording_matrix,
% compare the dft of your new recording (aka X_c) to each of the signals in
% one_recording_matrix and on. If the best match (aka with the highest 
% inner product) is in the one_recording_matrix set then we can say that 
% you just said "ONE".


% It is useful to look back at voice_recognition.m to get tips on how to
% sort and display the result. However there are many ways to do this so
% you might not need to sort the results. Good luck.

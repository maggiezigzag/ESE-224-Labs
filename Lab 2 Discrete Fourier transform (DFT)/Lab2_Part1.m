L = 64;
wvtool(hamming(L))
wvtool(gausswin(L))
wvtool(hann(L))
w = kaiser(200,2.5);
wvtool(w)
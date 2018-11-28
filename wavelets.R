file<-read.csv("learn_data14731.csv", sep=",");
depth<-file$depth;
ang<-file$ang;
agk<-file$agk;

drawWaveletCoefs <- function(list, levels = 1, filter="haar") {
	library(wavelets)
	wavelet<-dwt(list, filter);
	plot.dwt(wavelet, levels, plot.V = FALSE);
}

old.par <- par(mfrow=c(2,2))
drawWaveletCoefs(agk, 3)
drawWaveletCoefs(depth, 3)
drawWaveletCoefs(ang, 3)
par(old.par)
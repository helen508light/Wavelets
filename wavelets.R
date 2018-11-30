file<-read.csv("learn_data14731.csv", sep=",");
depth<-file$depth;
ang<-file$ang;
agk<-file$agk;

#
# haar
#Daubechies - d
#2,4,6,8,10,12,14,16,18,20.
#
#Least Asymetric - la
#8,10,12,14,16,18,20.
#
#Best Localized - bl
#14,18,20.
#
#Coiflet- 
#6,12,18,24,30.
#

filterD<-c(2,4,6,8,10,12,14,16,18,20)
filterLA<-c(8,10,12,14,16,18,20)
filterBL<-c(14,18,20)
filterC<-c(6,12,18,24)

drawWaveletCoefs <- function(list, levels = 1,fileName="fileName", filter="haar") {
	library(wavelets)
	wavelet<-dwt(list, filter, boundary="periodic", fast=TRUE);
	fileName<-paste(fileName, filter, "pdf", sep=".", collapse="")
	pdf(fileName, width=6, height=3)
	plot.dwt(wavelet, levels, plot.V = FALSE);
	dev.off();
}

drawWafeletsForDifferentFilter<-function(data) {
	# for filter Daubechies
	for (i in 1: length(filterD)) {
		filterName<-paste("d", filterD[i], sep="")
		drawWaveletCoefs(data, 3, "ang_3lev", filterName)
	}

	# for filter Least Asymetric
	for (i in 1: length(filterLA)) {
		filterName<-paste("la", filterLA[i], sep="")
		drawWaveletCoefs(data, 3, "ang_3lev", filterName)
	}

	# for filter Best Localized
	for (i in 1: length(filterBL)) {
		filterName<-paste("bl", filterBL[i], sep="")
		drawWaveletCoefs(data, 3, "ang_3lev", filterName)
	}

	# for filter Coiflet
	for (i in 1: length(filterC)) {
		filterName<-paste("c", filterC[i], sep="")
	print(filterName)
		#drawWaveletCoefs(data, 3, "ang_3lev", filterName)
	}
}

old.par <- par(mfrow=c(2,2))
#drawWaveletCoefs(agk, 3, "agk_3lev.pdf")
#drawWaveletCoefs(depth, 3, "depth_3lev.pdf")
#drawWafeletsForDifferentFilter(ang); 	# smth like drawWaveletCoefs(ang, 3, "ang_3lev", "c18")



par(old.par)
# Koordinaten aggregieren
require(tidyverse)
idmat<-as_data_frame(cbind(c(1:98),c(2:99),c(3:100)))
idkoord<-as_data_frame(cbind(1:100,101:200,201:300))
colnames(idkoord)<-c("id","lon","lat")


N <- dim(idkoord)[1]
# Wie für beliebig viele Zahlen verallgemeinern?
idlon <- data.frame(V1  = numeric(N),
                       V2 = numeric(N),
                       V3 = numeric(N))
idlat <- data.frame(V1  = numeric(N),
                    V2 = numeric(N),
                    V3 = numeric(N))

# Langsamer Part, wie ohne Schleife umsetzen?
for (i in 1:dim(idmat)[1]){
  for (j in 1:dim(idmat)[2]){
    print(i)
    print(j)
    idlon[i,j] <- filter(idkoord, id==as.numeric(idmat[i,j]))$lon
    idlat[i,j] <- filter(idkoord, id==as.numeric(idmat[i,j]))$lat
  }
}
AHlon<-rowMeans(idlon, na.rm = TRUE)
AHlat<-rowMeans(idlat, na.rm = TRUE)
AHkoord<-cbind(AHlon,AHlat)

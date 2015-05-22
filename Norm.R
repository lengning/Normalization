X11()
# Input:
# [FileNameIn] 
# [OutputName] 

library(gplots)
options=commandArgs(trailingOnly = TRUE)
print(options)
File=options[1] # file name
Out=options[2] # output

# csv or txt
tmp=strsplit(File, split="\\.")[[1]]
FileType=tmp[length(tmp)]

if(FileType=="csv"){
	cat("\n Read in csv file \n")
	prefix=strsplit(File,split="\\.csv")[[1]][1]
	In=read.csv(File,stringsAsFactors=F,row.names=1)
}
if(FileType!="csv"){
	cat("\n Read in tab delimited file \n")
	prefix=strsplit(File,split=paste0("\\.",FileType))[[1]][1]
	In=read.table(File,stringsAsFactors=F, sep="\t",header=T,row.names=1)
}



Mat=data.matrix(In)

Norm=TRUE

if(Norm){
cat("\n ==== Performing normalization ==== \n")
library(EBSeq)
Sizes=MedianNorm(Mat)
if(is.na(Sizes[1]))cat("\n Warning: all genes have 0(s), normalization is not performed \n")
else Mat=GetNormalizedMat(Mat, MedianNorm(Mat))
}

tmp=cbind(rownames(Mat),Mat)
colnames(tmp)[1]=" "
write.table(tmp,Out,sep="\t",row.names=F,quote=F)


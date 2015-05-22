# Normalization


Perform median-by-ratio normalization on RNAseq data

Example to run the code (from command line):

Rscript Norm.R SCexample.csv out.txt

The inputs for the code are:

-  [FileNameIn] can take .csv, .txt or .tab. Rows are genes and columns are samples.

-  [OutputName] will output a tab delimited file

If none of the genes has non-zero expression, normalization will not be performed and the function will output the original data.

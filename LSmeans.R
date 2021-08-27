# The custom script to produce LSmeans values using 'lsmeans' & 'emmeans' packages in R
# Least-squares means (or LS means) are generelizations of covariate-adjusted means.

# Prepare input file of phenotypic measurements as following:
# [Column I] "Lines"	[Column II] "values"	[Column III] "ind"
#  Plant sample ID			num						Rep 1
#  Plant sample ID			num						Rep 1
#  Plant sample ID			num						Rep 1
# All individuals from Rep 1 are listed followed by individuals from Rep 2 and so on. Missing values are coded as "NA". 

> library(lsmeans)
> library(emmeans)
> LStable<-read.csv("/Users/path/path/filename.csv")
> LStable<-as.data.frame(LStable)
> LStable_omit<-na.omit(LStable)
> LStable.lm<-lm(LStable_omit$values~LStable_omit$Lines+LStable_omit$ind, data=LStable_omit)
> LSsummary<-summary(lsmeans(LStable.lm, "Lines"))
> LSPheno<-LSsummary[,1:2]
> write.csv(LSPheno_in, "/Users/path/path/filename.csv")



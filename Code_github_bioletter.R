# This code will allow you to reproduce the analyses performed in the manuscript
# 'Inbreeding depression in polyploid species: a meta-analysis', by Clo & Kolar (submitted)
# If you find any mistake, or have any queries, please contact me at:
# josselin.clo@gmail.com

# As most of the analyses use bayesian and mcmc chains sampling, running all the script 
# will take time, so select parts that you want to use, 
# or reduce the number of MCMC chanels (it can however increases variability). 
# Finally, as the method use mcmc chains sampling, you will never found twice the same results 
# by runnig twice the same analysis. Nevertheless, results are always extremely close to those 
# found in the article, and include in the credibility intervals.


##### Packages used in the analyses #####

library(phytools)
library(MCMCglmm)

##### Load the data #####

data_ID = read.table('meta_analysis_ID.csv', dec=",", header = T, sep = ";")
tree<- read.tree("phylo_tree") 

# The phylogenetic tree of sampled species, see figure S1 and main text for details

##### The analyses #####

## Relatedness-controlled analysis ##

# See manuscript for details, but we substract here ID values of diploids to polyploids estimates

minus_synthetic = data_ID$ID.synthetic.tetraploid - data_ID$ID.diploid
minus_polyploids = data_ID$ID.tetraploid - data_ID$ID.diploid

value_ID = c(minus_polyploids, minus_synthetic)
ploidy = c(rep("polyploids", times = length(minus_polyploids)),rep("neopolyploids", times = length(minus_synthetic)))
species = c(data_ID$Species, data_ID$Species)

Controlled = cbind(value_IBD, ploidy, species, species_phy)
Controlled = as.data.frame(Controlled)
Controlled = as.numeric(Controlled$value_IBD)

factor_controlled<-MCMCglmm(value_IBD~ ploidy, random= ~species, data = Controlled, family = "gaussian", nitt = 6000000, burnin=1000000, thin=100, verbose = TRUE)

# Different parameters of the model: -random effects: Species
# Data = name of your dataset
# familly = kind of statistical law you want to use (Gaussian, Poisson, binomial...)
# nitt = Number of MCMC chains to run
# burnin = Number of MCMC chains to perform before sampling
# sample = Period between two sampling (here 50)

# Results

summary(factor_controlled)
posterior.mode(factor_controlled)
HPDinterval(factor_controlled)

## Complete analysis ##

# See manuscript for details, here we used all estimates

value_ID = c(data_ID$ID.diploid, data_ID$ID.synthetic.tetraploid, data_ID$ID.tetraploid)
ploidy = c(rep("diplo", times = length(data_ID$ID.diploid)),rep("neo", times = length(data_ID$ID.diploid)),rep("tetra", times = length(data_ID$ID.diploid)))
species = c(data_ID$Species, data_ID$Species, data_ID$Species)

Complete = cbind(value_IBD, ploidy, species)
Complete = as.data.frame(Complete)
Complete$value_IBD = as.numeric(Complete$value_IBD)

factor_complete<-MCMCglmm(value_IBD~ ploidy, random= ~species, data = Complete, family = "gaussian", nitt = 6000000, burnin=1000000, thin=100, verbose = TRUE)

# Results

summary(factor_complete)
posterior.mode(factor_complete$Sol)
HPDinterval(factor_complete$Sol)

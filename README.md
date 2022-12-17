# Meta_analysis_Inbreeding_depression

These code and data have been used to generate the result section of the manuscript 'Inbreeding depression in polyploid species: a meta-analysis', by Clo & Kolar
(accepted in Biology Letters). If you find any mistake, or have any queries, please contact me at: josselin.clo@gmail.com.

It contains:

- The dataset used, the dataset includes:
  * The species' name
  * The family of plants
  * Population information. When estimates come from a mix of several populations, we used the term "Mean". When a single population was used, we used the term "single".
  * The trait under study. For more details, please refer to the article liste in the "Reference" column. 
  * Inbreeding depression estimates for the trait under study for each cytotype (ID diploid, ID synthetic, ID tetraploid). As most articles only gave estimates for synthetic or tetraploid individuals, there are 'NA' values for missing cytotypes. For example, the second reference (Galloway et al. 2003 heredity) only gave ID estimates for tetraploids, so there are NA values for diploids (ID_diploid) and synthetic polyploids (ID_synthetic)
  * The ratio of inbreeding depression of diploids over synthetics or tetraploids (ratio_diplo_neo or ratio_diplo_tetra). When there are no values for diploids (ID_diploids = NA), the ratio cannot be computed and a NA value is assigned.
  * A selfing rate estimate for diploids and polyploids (selfing_diplo, selfing_poly)
  * The origin of polyploids (poly_type = auto- or allo-polyploids)
  * The name of the species formated for the phylogenetic analysis (phylo_corr)
  * The reference of the article
  
- The phylogenetic tree of sampled species
- The Rcode used to perform the analyses.

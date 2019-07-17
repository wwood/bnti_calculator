Partial reimplementation of James Stegen's bNTI method https://www.nature.com/articles/ismej201330

Currently the only part of the method implemented here deals with a problem where the default version of the APE R package fails when in its `cophenetic` function receives a tree containing too many leaves.

Here, ape has been patched with a new method where the distances are printed to STDOUT, and then these can be read into R again. This is required because sometimes the number of distances is so large that the R interface to C cannot handle such large datasets.

The patched version of the ape package here has to be installed first.

Then, to calculate the distances:
```sh
$ ./print_distances.R /path/to/tree
```

Then to read the distances in:
```R
library(data.table)
tip_distances_dt = fread('zcat distances.tsv.gz |cut -f3',header=F)
tip_distances = matrix(tip_distances_dt$V1, nrow=sqrt(nrow(tip_distances_dt)))
```

The actual calculation of bNTI is not currently performed by this module. Further implementation can be carried out with the code provided at https://github.com/stegen/Stegen_etal_ISME_2013

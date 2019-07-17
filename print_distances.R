#!/usr/bin/env Rscript


library(ape)
tree_file = commandArgs(trailingOnly = TRUE)[1]
t = read.tree(tree_file)
bla = cophenetic.phylo_printer(t)

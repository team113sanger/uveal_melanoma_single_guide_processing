[![DOI](https://zenodo.org/badge/934196809.svg)](https://doi.org/10.5281/zenodo.14988332)

## Summary
CRISPRko screens were performed in 10 uveal melanoma cell lines expressing Cas9 (3 replicates) using the Human CRISPR Library (Yusa v1.1). Samples at day 14 of screen were quantified along with a previous sequencing run of the pooled plasmids which were used to generate the library.

This project contains:

7 cell lines from SequenceScape study 5621: OMM23, MP41, MP38, OMM1, Mel270, MP46, OMM25
3 cell lines from SequenceScape study 5821: Mel285, 92.1, Mel202
Only two Mel285 replicates are present in study 5621 (Mel285_c909R2 and Mel285_c909R3) as one replicate failed. As a result, the Mel285 screen was repeats with three replicates in study 5821 (Mel285_R5, Mel285_R6, Mel285_R7).

## Analysis 
Lane level CRAMs containing CRISPR counts were first combined into per-sample CRAMs using [samtools](https://github.com/samtools/samtools) version 1.14 (`samtools merge`). Details on metadata processing, sample aggregation, and quality control can be found in `NOTEBOOKS/pyCROQUET.Rmd`

Counts for CRISPR guide RNAs were generated using [pycroquet](https://github.com/cancerit/pycroquet) (`SCRIPTS/pycroquet_lsf_job_array.sh`)

## Installation and dependencies
Processing of metadata and analysis of counts can be perfromed locally with R. Generation of counts files was run on a high-performance computing (HPC) cluster running Ubuntu 20.04 (Focal Fossa) Linux using LSF job arrays. Run time for this stage can be completed in several hours.

- [samtools](https://github.com/samtools/samtools) (version 1.4.1)
- [pycroquet](https://github.com/cancerit/pycroquet) (version 1.5.1)
- R 4.2.2 (all dependencies are tracked within the project renv.lock file)

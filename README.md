# DBiT-seq-Proteomics Data Processing and Visualization Scripts

This repository hosts the raw data processing and visualization scripts utilized in the DBiT-seq Proteomic Sequencing Project, focused exclusively on the analysis of proteomic data from CITE-seq experiments. It includes core R scripts for tasks such as data visualization, clustering, differential protein expression analysis, spatial pie chart generation, and more.


# Abstract
DBiT-seq-Proteomic is a spatial omics sequencing technique enabling high-plex protein sequencing. In this project, we applied DBiT-seq to human fibrotic lung sections, achieving cellular-level resolution (25μm pixel size). Using a custom panel of 18 ADTs specifically designed for fibrotic lung studies, we uncovered spatial protein expression patterns critical for understanding lung fibrosis.

# Data Processing Workflow
# 1. Raw FASTQ Data Processing with CITE-seq-Count
Sequencing was performed using Illumina NovaSeq 6000 with paired-end 150bp reads. The spatial CITE-seq raw FASTQ files included the following:

Read 1: Contains the cDNA sequence or protein barcode.
Read 2: Contains the spatial barcode (A and B) and unique molecular identifiers (UMIs).

# 2. Reformatting FASTQ Read 2 File
To utilize CITE-seq-Count, the Read 2 file from DBiT-seq experiments needs reformatting. Due to differences in experimental design, the Read 2 of DBiT-seq corresponds to Read 1 in CITE-seq-Count, while the original Read 1 becomes Read 2.
Steps to Reformat Data:
1. Use the fastq_process.py script (courtesy of @edicliuyang - Yang Liu Lab at Yale) to process the raw data:

### Run the Script

To process the raw data, use the following commands:

```bash
python fastq_process.py
gzip sample_R2_processed.fastq
```

This script prepares the data for downstream analysis and compresses the output to save storage space. 

2. Process the reformatted FASTQ files with CITE-seq-Count to generate the expression matrix.




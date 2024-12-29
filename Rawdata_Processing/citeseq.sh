#!/bin/bash
#SBATCH --partition=general-compute --qos=general-compute
#SBATCH --mail-type=all
#SBATCH --mail-user=mahsayaz@buffalo.edu
#SBATCH --job-name=citeseq
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=8g
#SBATCH --time=72:00:00

#$1 is DBIT barcodes and UMIs, processes via convert.py
#$2 is the fastq with the ADT barcodes
#$3 is the csv with barcodes and corresponding proteins
#$4 is the name of the run, to be saved to CITE_out in Rawdata_processing

BC=$1
TAG=$2
ADT_ref=$3
outfolder=/projects/academic/rgzhao/NIH90/Proteomic/03.citeseq/$4

mkdir -p $outfolder

CITE-seq-Count -R1 $BC -R2 $TAG -t $ADT_ref -cbf 1 -cbl 16 -umif 17 -umil 26  -o $outfolder -wl spatial_whitelist.txt  -cells 2500 -trim 21 -T 100 --dense

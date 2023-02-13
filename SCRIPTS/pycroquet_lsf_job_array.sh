#BSUB -q normal
#BSUB -J pycroquet[1-33]
#BSUB -oo "/lustre/scratch124/casm/team113/projects/5621_5821_sgrna_crisprko_uveal_melanoma/LOGS/pycroquet/pycroquet_single_guide.%I.o"
#BSUB -eo "/lustre/scratch124/casm/team113/projects/5621_5821_sgrna_crisprko_uveal_melanoma/LOGS/pycroquet/pycroquet_single_guide.%I.e"
#BSUB -R "select[mem>10000] rusage[mem=10000] span[hosts=1]"
#BSUB -M 10000
#BSUB -n 8
module load pycroquet/1.5.1
guides="/lustre/scratch124/casm/team113/projects/5621_5821_sgrna_crisprko_uveal_melanoma/METADATA/library_CRISPRcleanR_KY_Library_v1.1.pycroquet.tsv"
cram_directory="/lustre/scratch124/casm/team113/projects/5621_5821_sgrna_crisprko_uveal_melanoma/DATA/CRAM/study_sample"
cram_files=($(ls ${cram_directory}/*.cram))
array_index=$(expr ${LSB_JOBINDEX} - 1)
query_file_name=$(basename ${cram_files[${array_index}]})
query_file_label=${query_file_name::-5}
output_directory="/lustre/scratch124/casm/team113/projects/5621_5821_sgrna_crisprko_uveal_melanoma/DATA/pycroquet"
pycroquet single-guide -g ${guides} -q ${cram_directory}/${query_file_name} -o ${output_directory}/${query_file_label} --cpus 8 --boundary-mode exact --chunks 50000

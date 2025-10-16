#!/bin/bash

#SBATCH -p cascade
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=8192
#SBATCH --mail-user=twozniak@unimelb.edu.au
#SBATCH --mail-type=ALL
#SBATCH --job-name='bsvars'
#SBATCH --array=1-10

module load R/4.5.0
Rscript bsvars.R ${SLURM_ARRAY_TASK_ID}
# setup the password as an environmental variable
source ~/.bash-profile

# Upload files
sshpass -e scp bsvars/bsvars.* twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bsvars/

# working with bsvars on spartan
#################################################
sshpass -e ssh twozniak@spartan.hpc.unimelb.edu.au
cd /data/projects/punim0093/bsvars/

sbatch bsvars.slurm
squeue -u twozniak

# Download files
scp twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bsvars/*.rda bsvars/

# install the bsvars package on spartan
#################################################
sshpass -e ssh twozniak@spartan.hpc.unimelb.edu.au
sinteractive
module load R/4.5.0
R
install.packages("bsvars")
q("no")
exit

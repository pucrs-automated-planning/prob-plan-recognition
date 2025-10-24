#!/bin/bash -l

#SBATCH --nodes=1 # number of nodes
#SBATCH --ntasks=1
#SBATCH --mem=32G # memory pool for all cores

module load miniconda3
conda activate prob-plan-recognition

srun python3 run_domain_obs.py "${@:1}" &

wait
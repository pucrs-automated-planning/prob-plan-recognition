#!/bin/bash -l

#SBATCH --nodes=1 # number of nodes
#SBATCH --ntasks=1
#SBATCH --mem=32G # memory pool for all cores

module load miniconda3
conda activate prob-plan-recognition

# use the arguments in the work dir name
WORK_DIR_NAME=$(echo "${@}" | tr ' ' '-')

bash ./make_dirs.sh "work-dir-${WORK_DIR_NAME}"

cd "work-dir-${WORK_DIR_NAME}"

srun python3 run_domain_obs.py "${@:1}" &

wait
#!/bin/bash -l

#SBATCH --job-name=Prob-Goal-Recognition
#SBATCH --nodes=1 # number of nodes
#SBATCH --ntasks=20 # number of tasks total
#SBATCH --cpus-per-task=1 # number of cores
#SBATCH --mem=128G # memory pool for all cores

#SBATCH --ntasks-per-node=20 # one job per node
#SBATCH --gres=gpu:0 # 0 GPU out of 3

#SBATCH -o slurm.%j.out # STDOUT
#SBATCH -e slurm.%j.err # STDERR

#SBATCH --mail-type=ALL
#SBATCH --mail-user=${USER}@abdn.ac.uk

pwd
module load miniconda3
conda info --envs
conda activate prob-plan-recognition

degrees=("10" "30" "50" "70" "100")
domains=("blocks-world" "campus" "depots" "driverlog" "dwr" "easy-ipc-grid" "ferry" "intrusion-detection" "kitchen" "logistics" "miconic" "rovers" "satellite" "sokoban" "zeno-travel")

mkdir results

for domain in "${domains[@]}"
do
    for degree in "${degrees[@]}"
    do
        DIRECTORY="results/${domain}/${degree}"
        # if [ ! -d "$DIRECTORY" ]; then
        #     echo "$DIRECTORY does not exist."
            sbatch --job-name="${domain}-${degree}" --mem=64G -o "results/slurm.${domain}-${degree}.log" -e "results/slurm.${domain}-${degree}.err" slurm_single_benchmark.sh $domain $degree 1800 32768 &
        # else
        #     echo "${DIRECTORY} is finished"
        # fi
    done
    # wait
done
wait

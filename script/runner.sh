#! /bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --time=24:00:00
#SBATCH --account=dasi8263
#SBATCH --partition=blanca-curc-gpu
#SBATCH --gres=gpu:1
#SBATCH --output=logs/output-%j.out
#SBATCH --mail-type="ALL"
#SBATCH --mail-user="alle5715@colorado.edu"

cd /rc_scratch/dasi8263/healthcare-trajectory-prediction-system

module purge
module load slurm/blanca
module load anaconda
module load cuda/12.1.1

conda activate health_trajectory

# mkdir -p logs
# nvidia-smi >> logs/nvidia-smi.out

# source /home/${USER}/.bashrc
# conda activate econ-indicators

# mkdir -p metadata
# mkdir -p outputs

# export TRANSFORMERS_CACHE=metadata/
# export PYTHONPATH=/rc_scratch/dasi8263/econ-indicators

python lig_doctor.py
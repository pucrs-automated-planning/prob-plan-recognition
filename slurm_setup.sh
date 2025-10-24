#!/bin/bash
module load miniconda3 
# conda create --name sa-goal-recognition --file requirements.txt -y python=3.11 
conda create --name prob-plan-recognition -y python=3.11 
conda activate prob-plan-recognition
# pip install -r requirements.txt
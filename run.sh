#!/bin/bash

# Resource Request
#SBATCH --partition=tesla-k20
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --error=/Users/neha5486/eo/%j.e
#SBATCH --output=/Users/neha5486/eo/%j.o
#SBATCH --mail-user=Negacy.Hailu@ucdenver.edu
#SBATCH --job-name=neural-mt

# GPU Request
#SBATCH --gres=gpu

# set max wall-clock time (D-HH:MM:SS)
#SBATCH --time=24:00:00

module load python/3.6.3
alias python=python3.6
#preprocess data: runs on ionia but not on fiji due to python version issue. Needs Python 2.*
#./scripts/compile_coref_data.sh ontonotes-release-5.0

#pos tagger
#python -m allennlp.run train tutorials/getting_started/simple_tagger.json --recover --serialization-dir /tmp/tutorials/getting_started

#neural coref
#rm existing dir
#rm -r /tmp/tutorials
#python -m allennlp.run train training_config/coref.json --serialization-dir /tmp/tutorials/getting_started
rm -r models/
python -m allennlp.run train training_config/coref.json --serialization-dir models/

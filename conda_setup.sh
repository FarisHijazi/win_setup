#!/bin/bash

conda update -n base -c defaults conda
conda install nb_conda -y

conda create -n pt python=3.7 -y
conda activate pt
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch -y
pip install ipykernel
conda install nb_conda -y

~/test_gpu.sh


#!/usr/bin/env bash

mkdir -p experiments/pretrained_models
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.8/GFPGANv1.3.pth -P experiments/pretrained_models

# ثبّت gfpgan يدويًا من GitHub
pip install git+https://github.com/TencentARC/GFPGAN.git

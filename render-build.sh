#!/usr/bin/env bash

apt update && apt install -y ffmpeg libgl1 libglib2.0-0 wget

mkdir -p experiments/pretrained_models
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.8/GFPGANv1.3.pth -P experiments/pretrained_models

pip install flask numpy torch torchvision opencv-python-headless basicsr realesrgan facexlib
pip install git+https://github.com/TencentARC/GFPGAN.git

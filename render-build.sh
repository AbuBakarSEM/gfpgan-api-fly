#!/usr/bin/env bash

apt update && apt install -y ffmpeg libgl1 libglib2.0-0

mkdir -p experiments/pretrained_models
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.8/GFPGANv1.3.pth -P experiments/pretrained_models

# ثبت التبعيات يدويًا عشان ما يخرب البناء
pip install torch==2.5.1 torchvision
pip install opencv-python-headless numpy flask
pip install basicsr realesrgan
pip install facexlib
pip install git+https://github.com/TencentARC/GFPGAN.git

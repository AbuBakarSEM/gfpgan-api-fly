FROM python:3.9-slim

WORKDIR /app
COPY . .

RUN apt update && apt install -y libgl1 ffmpeg wget && \
    pip install --no-cache-dir -r requirements.txt && \
    mkdir -p experiments/pretrained_models && \
    wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.8/GFPGANv1.3.pth -P experiments/pretrained_models

EXPOSE 8080
CMD ["python", "app.py"]

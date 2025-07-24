from flask import Flask, request, send_file
from gfpgan import GFPGANer
import cv2
import numpy as np
import os

app = Flask(__name__)

restorer = GFPGANer(
    model_path='experiments/pretrained_models/GFPGANv1.3.pth',
    upscale=2,
    arch='clean',
    channel_multiplier=2,
    bg_upsampler=None
)

@app.route('/restore', methods=['POST'])
def restore():
    file = request.files['image']
    img_array = np.frombuffer(file.read(), np.uint8)
    img = cv2.imdecode(img_array, cv2.IMREAD_COLOR)

    _, restored_img = restorer.enhance(img, has_aligned=False, only_center_face=False, paste_back=True)
    output_path = 'output.png'
    cv2.imwrite(output_path, restored_img)

    response = send_file(output_path, mimetype='image/png')
    os.remove(output_path)
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

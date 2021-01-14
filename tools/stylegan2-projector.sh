#!/bin/bash

# usage: projector.sh [-h] --target TARGET_FNAME
#                     [--save-video SAVE_VIDEO] [--seed SEED] --outdir DIR

# Project given image to the latent space of pretrained network pickle.

# optional arguments:
#   -h, --help            show this help message and exit
#   --target TARGET_FNAME
#                         Target image file to project to
#   --save-video SAVE_VIDEO
#                         Save an mp4 video of optimization progress (default:
#                         true)
#   --seed SEED           Random seed
#   --outdir DIR          Where to save the output images

STYLEGAN_PATH="submodules/stylegan2-ada"

docker run --gpus all -it --rm -v `pwd`:/scratch --user $(id -u):$(id -g) stylegan2ada:latest bash -c \
    "(cd /scratch && DNNLIB_CACHE_DIR=/scratch/.cache python $STYLEGAN_PATH/projector.py --network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada/pretrained/ffhq.pkl $@)"
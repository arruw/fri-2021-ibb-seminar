#!/bin/bash

# usage: generate.sh [-h]
#                    (--seeds SEEDS | --dlatents DLATENTS_NPZ)
#                    [--trunc TRUNCATION_PSI] [--class CLASS_IDX] --outdir DIR

# Generate images using pretrained network pickle.

# optional arguments:
#   -h, --help            show this help message and exit
#   --seeds SEEDS         List of random seeds
#   --dlatents DLATENTS_NPZ
#                         Generate images for saved dlatents
#   --trunc TRUNCATION_PSI
#                         Truncation psi (default: 0.5)
#   --class CLASS_IDX     Class label (default: unconditional)
#   --outdir DIR          Where to save the output images

STYLEGAN_PATH="submodules/stylegan2-ada"

docker run --gpus all -it --rm -v `pwd`:/scratch --user $(id -u):$(id -g) stylegan2ada:latest bash -c \
    "(cd /scratch && DNNLIB_CACHE_DIR=/scratch/.cache python $STYLEGAN_PATH/generate.py --network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada/pretrained/ffhq.pkl $*)"

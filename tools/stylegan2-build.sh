#!/bin/bash

STYLEGAN_PATH="submodules/stylegan2-ada"

docker build --tag stylegan2ada:latest "$STYLEGAN_PATH/"
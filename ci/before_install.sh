#!/bin/bash

echo "inside $0"

conda install conda-build
conda env create -q -f ci/environment.yaml

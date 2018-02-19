#!/bin/bash
echo
echo "[install_travis]"

home_dir=$(pwd)
echo
echo "[home_dir]: $home_dir"

# install miniconda
MINICONDA_DIR="$HOME/miniconda3"

time wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -q -O miniconda.sh || exit 1
time bash miniconda.sh -b -p "$MINICONDA_DIR" || exit 1

echo
echo "[show conda]"
which conda

echo
echo "[update conda]"
conda config --set quiet true --set always_yes true --set changeps1 false || exit 1
conda update -q conda

conda install -yq conda-build

echo
echo "[show conda]"
conda info

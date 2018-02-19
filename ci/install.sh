echo "inside $0"

echo "Running ${JOB}"

source activate pandas

if [ $JOB='ASV' ]; then

    echo "[building asv]"
    conda build pandas/conda.recipe/meta.yaml --python=3
    conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3)

elif [ $JOB='PIP' ]; then

    echo "[building release]"
    time bash pandas/scripts/build_dist_for_release.sh || exit 1
    conda uninstall -y cython
    time pip install dist/*tar.gz || exit 1

elif [ $JOB='CONDA' ]; then

    echo "[conda]"
    conda install conda-build

    conda build pandas/conda.recipe/meta.yaml --python=3
    conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3)

fi

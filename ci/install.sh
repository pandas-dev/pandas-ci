echo "inside $0"

echo "Running ${JOB}"

source activate pandas

if [ "$JOB" == "ASV" ]; then

    echo "[building asv]"
    time conda build pandas/conda.recipe/meta.yaml --python=3
    time conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3)

elif [ "$JOB" == "PIP" ]; then

    echo "[building release]"
    push ../pandas
    time bash scripts/build_dist_for_release.sh || exit 1
    time conda uninstall -y cython
    time pip install dist/*tar.gz || exit 1
    popd

elif [ "$JOB" == "CONDA" ]; then

    echo "[conda]"
    time conda build pandas/conda.recipe/meta.yaml --python=3
    time conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3)

fi

echo "inside $0"

echo "Running ${JOB}"

if [ "$JOB" == "ASV" ]; then

    echo "[building asv]"
    time conda build pandas/conda.recipe/meta.yaml --python=3.6 --numpy=1.14

    echo "[installing asv]"
    time conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3.6 --numpy=1.14)

elif [ "$JOB" == "PIP" ]; then

    source activate pandas

    pushd pandas

    echo "[building dist]"
    time bash scripts/build_dist_for_release.sh || exit 1

    echo "[uninstall cython]"
    time conda uninstall -y cython

    echo "[pip install]"
    time pip install dist/*tar.gz || exit 1

    popd

elif [ "$JOB" == "CONDA" ]; then

    echo "[build conda]"
    time conda build pandas/conda.recipe/meta.yaml --python=3.6 --numpy=1.14

    echo "[install conda]"
    time conda install -n pandas $(conda build --output pandas/conda.recipe/meta.yaml --python=3.6 --numpy=1.14)

fi

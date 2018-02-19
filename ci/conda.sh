#!/bin/bash -e

echo "inside $0"

source activate pandas

echo "[conda-test]"

echo "[running]"
cd /tmp
unset PYTHONPATH

python -c 'import pandas; pandas.test(["-n 2", "--skip-slow", "--skip-network", "-r xX", "-m not single"])'

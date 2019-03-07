#!/bin/bash -e

echo "inside $0"
echo "[pip-test]"
source activate pip-test-env

echo "[install test dependencies]"
time pip install pytest pytest-xdist hypothesis pytest-mock || exit 1

echo "[running]"
cd /tmp
unset PYTHONPATH

python -c 'import pandas; pandas.test(["-n 2", "--skip-slow", "--skip-network", "-r xX", "-m not single"])'

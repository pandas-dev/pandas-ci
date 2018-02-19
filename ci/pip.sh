#!/bin/bash

echo "inside $0"

source activate pandas

RET=0

echo "[pip-test]"

echo "[running]"
cd /tmp
unset PYTHONPATH

echo "[build-test: not single]"
python -c 'import pandas; pandas.test(["-n 2", "--skip-slow", "--skip-network", "-r xX", "-m not single"])'

exit "$RET"

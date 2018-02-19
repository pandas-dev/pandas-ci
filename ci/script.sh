#!/bin/bash -e

echo "inside $0"

if [ "$JOB" == "ASV" ]; then
    ci/asv.sh
elif [ "$JOB" == "PIP" ]; then
    ci/pip.sh
elif [ "$JOB" == "CONDA" ]; then
    ci/conda.sh
fi

RET="$?"

exit "$RET"

#!/bin/bash

echo "inside $0"

source activate pandas

RET=0

echo "[ASV start]"

cd pandas/asv_bench

asv machine --yes

time asv dev | tee failed_asv.txt

echo "The following asvs benchmarks (if any) failed."

cat failed_asv.txt | grep "failed" failed_asv.txt

if [ $? = "0" ]; then
    RET=1
fi

echo "DONE displaying failed asvs benchmarks."

rm failed_asv.txt

echo "[ASV DONE]"

exit "$RET"

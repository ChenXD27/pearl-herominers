#!/bin/bash
set -x

echo "=== STARTING PEARL MINER DEBUG ==="
echo "Date: $(date)"
echo "User: $(whoami)"
echo "PWD: $(pwd)"
echo "Args: $@"

echo "=== /miner contents ==="
ls -la /miner || true

echo "=== NVIDIA SMI ==="
nvidia-smi || true

echo "=== LDD CHECK ==="
ldd /miner/SRBMiner-MULTI || true

echo "=== RUNNING SRBMINER ==="
/miner/SRBMiner-MULTI "$@"

EXIT_CODE=$?
echo "=== SRBMINER EXITED WITH CODE: $EXIT_CODE ==="

sleep 30
exit $EXIT_CODE

#!/bin/bash
cd /miner

echo "Starting SRBMiner..."
echo "Args: $@"

while true; do
  /miner/SRBMiner-MULTI "$@"
  EXIT_CODE=$?
  echo "SRBMiner exited with code $EXIT_CODE. Restarting in 5 seconds..."
  sleep 5
done

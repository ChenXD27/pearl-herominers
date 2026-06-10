FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

RUN apt update && apt install -y wget tar ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /miner

RUN wget -q https://github.com/doktor83/SRBMiner-Multi/releases/download/3.3.4/srbminer_custom-3.3.4.tar.gz \
    && tar -xzf srbminer_custom-3.3.4.tar.gz --strip-components=1 \
    && chmod +x SRBMiner-MULTI \
    && rm srbminer_custom-3.3.4.tar.gz

ENTRYPOINT ["/miner/SRBMiner-MULTI"]

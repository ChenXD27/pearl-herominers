FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

RUN apt update && apt install -y wget tar ca-certificates libc6 libstdc++6 && rm -rf /var/lib/apt/lists/*

WORKDIR /miner

RUN wget -q https://github.com/doktor83/SRBMiner-Multi/releases/download/3.3.7/SRBMiner-Multi-3-3-7-Linux.tar.gz \
    && tar -xzf SRBMiner-Multi-3-3-7-Linux.tar.gz --strip-components=1 \
    && chmod +x SRBMiner-MULTI \
    && rm SRBMiner-Multi-3-3-7-Linux.tar.gz

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

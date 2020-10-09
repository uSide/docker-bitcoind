FROM debian:stable-slim

ENV BITCOIN_VERSION=0.20.1
ENV BITCOIN_CHECKSUM=376194f06596ecfa40331167c39bc70c355f960280bd2a645fdbf18f66527397

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOIN_CHECKSUM} bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-${BITCOIN_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-${BITCOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]

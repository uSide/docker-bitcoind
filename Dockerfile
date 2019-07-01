FROM debian:stable-slim

ENV BITCOIN_VERSION=0.18.0
ENV BITCOIN_CHECKSUM=5146ac5310133fbb01439666131588006543ab5364435b748ddfc95a8cb8d63f

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOIN_CHECKSUM} bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-${BITCOIN_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-${BITCOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]

FROM debian:stable-slim

ENV BITCOIN_VERSION=0.17.0
ENV BITCOIN_CHECKSUM=9d6b472dc2aceedb1a974b93a3003a81b7e0265963bd2aa0acdcb17598215a4f

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOIN_CHECKSUM} bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-${BITCOIN_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-${BITCOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]

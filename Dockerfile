FROM bitnami/minideb:stretch AS builder

WORKDIR /usr/src/app/

ENV ZOLA_VERSION v0.8.0

RUN install_packages python-pip curl tar python-setuptools rsync binutils \
  && pip install dockerize \
  && curl -L https://github.com/getzola/zola/releases/download/$ZOLA_VERSION/zola-$ZOLA_VERSION-x86_64-unknown-linux-gnu.tar.gz | tar xz \
  && mv zola /usr/bin \
  && dockerize -n --verbose -o /usr/src/app  /usr/bin/zola

FROM alpine:3.10
COPY --from=builder /usr/src/app/ .
WORKDIR /usr/src/app/
RUN apk add --no-cache bash
EXPOSE 1111
ENTRYPOINT ["/bin/bash"]

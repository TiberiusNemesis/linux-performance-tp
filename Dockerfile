FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN rm -f /etc/dpkg/dpkg.cfg.d/excludes \
    && apt-get update \
    && apt-get install --yes --reinstall --no-install-recommends \
        bash \
        bsdextrautils \
        coreutils \
        fd-find \
        file \
        info \
        less \
        man-db \
        manpages \
        ncal \
        procps \
        ripgrep \
        tzdata \
        util-linux \
        which \
    && if [ "$(dpkg-divert --truename /usr/bin/man)" = "/usr/bin/man.REAL" ]; then \
        rm -f /usr/bin/man; \
        dpkg-divert --quiet --remove --rename /usr/bin/man; \
    fi \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && mandb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

CMD ["bash"]

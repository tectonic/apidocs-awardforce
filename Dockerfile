FROM node:22-alpine3.22

ARG HOST_USER
ARG HOST_GID
ARG HOST_UID

RUN deluser --remove-home node && \
    addgroup --gid ${HOST_GID} ${HOST_USER} && \
    adduser \
      --ingroup ${HOST_USER} \
      --gecos ${HOST_USER} \
      --uid ${HOST_UID} \
      --shell /bin/sh \
      --disabled-password ${HOST_USER}

USER ${HOST_USER}

WORKDIR /docs


FROM node:20-alpine

ARG USER
ARG GID
ARG UID

RUN deluser --remove-home node && \
    addgroup --gid ${GID} ${USER} && \
    adduser \
      --ingroup ${USER} \
      --gecos ${USER} \
      --uid ${UID} \
      --shell /bin/sh \
      --disabled-password ${USER}

RUN apk add --no-cache git libsecret

USER ${USER}

WORKDIR /docs

EXPOSE 3000


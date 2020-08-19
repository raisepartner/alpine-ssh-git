# built as raisepartner/alpine-ssh-git:3.11
FROM alpine:3.11
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git

#FROM debian
#
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends git ssh openssh-client \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ssh \
    && chmod 700 /root/.ssh

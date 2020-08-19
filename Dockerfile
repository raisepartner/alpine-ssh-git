# built as raisepartner/alpine-ssh-git:1.0
FROM alpine:3.11
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git

RUN mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && printf "Host *.raisepartner.com\n    StrictHostKeyChecking accept-new" > /root/.ssh/config \
    && chmod 400 /root/.ssh/config

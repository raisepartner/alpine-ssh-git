# built as raisepartner/alpine-ssh-git:1.4.0
FROM alpine:3.13
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git \
  curl \
  jq

RUN mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && printf "Host *.raisepartner.com\n    StrictHostKeyChecking accept-new" > /root/.ssh/config \
    && chmod 400 /root/.ssh/config

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash \
    && mv /kustomize /usr/bin

# install yq
ENV YQ_VERSION "v4.2.0"
ENV YQ_BINARY "yq_linux_amd64"
RUN curl -s https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY} -o /usr/bin/yq \
    && chmod +x /usr/bin/yq

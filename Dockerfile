# built as raisepartner/alpine-ssh-git:1.3
FROM google/cloud-sdk:341-alpine
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git \
  curl \
  python3 \
  py3-pip

RUN mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && printf "Host *.raisepartner.com\n    StrictHostKeyChecking accept-new" > /root/.ssh/config \
    && chmod 400 /root/.ssh/config

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash \
    && mv /kustomize /usr/bin

RUN gcloud components install kubectl

RUN pip3 install -U pip \
    && pip3 install yq

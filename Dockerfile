# built as raisepartner/alpine-ssh-git:1.2
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  bash \
  git \
  curl

RUN mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && printf "Host *.raisepartner.com\n    StrictHostKeyChecking accept-new" > /root/.ssh/config \
    && chmod 400 /root/.ssh/config

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash \
    && mv /kustomize /usr/bin

RUN gcloud components install kubectl

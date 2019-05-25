FROM alpine:3.5
LABEL maintainer="Elman elmanhasa@gmail.com"

ENV KUBECTL_VERSION 1.11.1
ENV KOPS_VERSION 1.10.0


#install kubectl
RUN apk add --update \
    curl \
    jq \
    vim \
    tar \
    sed \
    git \
    bash \
    wget \
    bash-doc \
    bash-completion \
    util-linux pciutils usbutils coreutils binutils findutils grep \
    ca-certificates \
    openssh-client \
    && curl -s -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

#install kops
RUN  curl -s -L https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64 -o /usr/bin/kops \
     && chmod +x /usr/bin/kops

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["bash"]
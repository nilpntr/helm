FROM alpine:3.14

ARG HELM_VERSION="v3.8.0"

RUN apk add --no-cache curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

# install helm
RUN echo "Downloading helm ${HELM_VERSION}" && curl -o helm.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -xzvf helm.tar.gz -C /usr/bin --strip-components=1 linux-amd64/helm \
  && rm -f helm.tar.gz

# install yaml-lint
RUN apk add --no-cache ruby && gem install yaml-lint

CMD ["helm", "help"]


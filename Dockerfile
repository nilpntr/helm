FROM sammobach/kubectl:latest

ARG HELM_VERSION="v3.8.0"

# install helm
RUN echo "Downloading helm ${HELM_VERSION}" && curl -o helm.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -xzvf helm.tar.gz -C /usr/bin --strip-components=1 linux-amd64/helm \
  && rm -f helm.tar.gz

# install yaml-lint
RUN apt update \
  && apt install -y ruby \
  && gem install yaml-lint \
  && rm -rf /var/lib/apt/lists/*

CMD ["helm", "help"]


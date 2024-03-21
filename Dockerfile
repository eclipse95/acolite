FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i -e "s/archive.ubuntu.com/ubuntu.univ-nantes.fr/g" /etc/apt/sources.list || true
RUN sed -i -e "s/security.ubuntu.com/ubuntu.univ-nantes.fr/g" /etc/apt/sources.list || true
RUN apt-get update -q && apt-get install --no-install-recommends python3-pip python3-venv -yq && apt-get clean

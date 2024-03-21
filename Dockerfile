FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i -e "s/archive.ubuntu.com/ubuntu.univ-nantes.fr/g" /etc/apt/sources.list || true
RUN sed -i -e "s/security.ubuntu.com/ubuntu.univ-nantes.fr/g" /etc/apt/sources.list || true
RUN apt-get update -q && apt-get install --no-install-recommends python3-pip curl unzip -yq && apt-get clean
RUN curl --location --header "PRIVATE-TOKEN: glpat-S-UGaQrqRvSGpJbzHQYw" "https://gitlab.univ-nantes.fr/api/v4/projects/23117/jobs/artifacts/ci/download?job=build-package" --output gdal.zip && unzip gdal.zip && apt-get update -q && apt-get install -f ./dist/*.deb --no-install-recommends -yq && apt-get clean && rm -r ./dist
RUN pip3 install wheel setuptools numpy matplotlib scipy pyproj scikit-image pyhdf pyresample netcdf4 h5py requests pygrib cartopy

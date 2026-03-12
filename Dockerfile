#FROM python:@sha---
FROM python:3.10-slim as builder

WORKDIR /app

COPY . .

RUN python -m pip install build

#Creation of the binary

RUN python -m build -o . --wheel


FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update \
    && apt-get install -y python3 python3-pip sudo vim curl \
    && apt-get -y upgrade

RUN rm -rf /tmp/*
RUN sudo apt-get clean \
    && sudo apt-get autoremove

COPY --from=builder app/*whl .

RUN pip install *.whl || pip install --force-reinstall *.whl \
    && rm *.whl

#Entrypoint is the script 
#CMD is the bash entry

CMD [ "/bin/bash"]
FROM debian:buster-slim

ARG USERNAME
ARG PASSWORD
ARG HUBITATOAUTH
ARG CAMECTCODE

RUN mkdir /code
WORKDIR /code

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip git && \
    pip3 install requests && \
    git clone https://github.com/bdwilson/camect-py && \
    git clone https://github.com/bdwilson/camect-connector && \
    sed -i "s/USERNAME/${USERNAME}/" /code/camect-connector/camect_connector.py && \
    sed -i "s/PASSWORD/${PASSWORD}/" /code/camect-connector/camect_connector.py && \
    sed -i -- "s#HUBITATOAUTH#${HUBITATOAUTH}#" /code/camect-connector/camect_connector.py && \
    sed -i "s/CAMECTCODE/${CAMECTCODE}/" /code/camect-connector/camect_connector.py

WORKDIR /code/camect-py
RUN /usr/bin/python3 setup.py install
CMD [ "python3", "/code/camect-connector/camect_connector.py" ]

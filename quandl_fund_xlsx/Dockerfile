# Creates an environment suitable for running the 
# quandl_fund_xlsx command.
#FROM debian:buster-slim

FROM ubuntu
MAINTAINER robren <rob@robren.net>

ENV user quandl_user

RUN apt-get update && apt-get install -y \
    python \
    python-pip

#RUN adduser --disabled-password --gecos '' $user && \
#    adduser $user sudo && \
#    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN useradd -ms /bin/bash $user

RUN pip install quandl_fund_xlsx

USER $user

WORKDIR /home/$user

ENTRYPOINT ["/bin/bash"]

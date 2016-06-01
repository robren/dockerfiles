# Creates an environment suitable for running the python unittests
# on a pelican repo
FROM ubuntu
MAINTAINER robren <rob@robren.net>

# If desired Change "test" to whatever you desire the username to be
ENV user test


RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    python-pip \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    git

RUN adduser --disabled-password --gecos '' $user && \
    adduser $user sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 


RUN /usr/bin/pip install virtualenv 
USER $user
RUN  virtualenv "/home/$user/virtualenvs/pelican" && \
    mkdir -p "/home/$user/src/pelican" && \
    /bin/bash -c "source /home/$user/virtualenvs/pelican/bin/activate && \
    git clone  https://github.com/getpelican/pelican.git /home/$user/src/pelican  && \
    cd /home/$user/src/pelican && python setup.py install && \
    pip install -r /home/$user/src/pelican/dev_requirements.txt"

ENTRYPOINT ["/bin/bash"]

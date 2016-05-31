ENV user test
FROM ubuntu
RUN apt-get update && apt-get install -y \
    python \
    python-dev \
    python-pip \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    git

RUN adduser --disabled-password --gecos '' rob && \
    adduser rob sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

#VOLUME .:"/home/rob"

RUN /usr/bin/pip install virtualenv 
USER rob
RUN  virtualenv "/home/rob/virtualenvs/pelican" && \
    mkdir -p "/home/rob/src/pelican" && \
    /bin/bash -c "source /home/rob/virtualenvs/pelican/bin/activate && \
#  Clone the git tree and run install is an alternative to pip and allows us
#  to specify where the source is to be placed
    git clone  https://github.com/getpelican/pelican.git /home/rob/src/pelican  && \
    cd /home/rob/src/pelican && python setup.py install && \
    pip install -r /home/rob/src/pelican/dev_requirements.txt"



# ENTRYPOINT ["su", "rob","-c", "/bin/bash"]
ENTRYPOINT ["/bin/bash"]

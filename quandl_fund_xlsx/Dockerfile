# Creates an environment suitable for running the 
# quandl_fund_xlsx command.

FROM python:3
MAINTAINER robren <rob@robren.net>

ENV user quandl_user

RUN useradd -ms /bin/bash $user

RUN pip install quandl_fund_xlsx

USER $user

WORKDIR /home/$user

ENTRYPOINT ["/bin/bash"]

FROM ansible/awx_web:6.1.0
LABEL maintainer="Nick Salonen <whatdoyouwant@gmail.com>"

ENV PIP_PACKAGES='ansible-tower-cli'

RUN . /var/lib/awx/venv/awx/bin/activate && \
  pip install --user ${PIP_PACKAGES} && \
  deactivate && \
  pip install --user ${PIP_PACKAGES}

ADD ansible.cfg /etc/ansible/ansible.cfg

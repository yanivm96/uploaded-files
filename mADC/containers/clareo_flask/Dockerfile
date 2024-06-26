FROM python:3.10-bullseye

ARG backend_repo_url="https://github.com/yaarilab/Minimal_ADC.git"
RUN \ 
  rm -rf /app && \
  apt-get update && \
  apt-get -y --no-install-recommends install apt-utils && \
  apt-get -y install vim && \
  apt-get -y install telnet && \
  apt-get -y install git && \
  apt-get -y install dos2unix && \
  apt-get -y install cron


RUN \
  git clone "$backend_repo_url" /app && \
  pip install -r /app/requirements.txt


COPY app/* /app/

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]


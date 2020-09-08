FROM mhart/alpine-node:12
MAINTAINER Bartosz Balis <balis@agh.edu.pl>

# Version of the job executor should be passed via docker build, e.g.: 
# docker build --build-arg hf_job_executor_version="1.1.0""
ARG hf_job_executor_version
ENV HYPERFLOW_JOB_EXECUTOR_VERSION=$hf_job_executor_version

# RUN apk add --no-cache make gcc g++ libnsl libnsl-dev
RUN apk add python3 libpcap libpcap-dev util-linux

#ADD http://pegasus.isi.edu/montage/Montage_v3.3_patched_4.tar.gz /
#RUN tar zxvf Montage_v3.3_patched_4.tar.gz && \
#    make -C /Montage_v3.3_patched_4 && \
#    echo "export PATH=\$PATH:/Montage_v3.3_patched_4/bin" >> /etc/bash.bashrc && \
#    cd /Montage_v3.3_patched_4 && rm -rf Montage docs grid ../Montage_v3.3_patched_4.tar.gz

ADD software/Montage.tar.gz /
ENV PATH $PATH:/Montage_v3.3_patched_4/bin

RUN npm install -g @hyperflow/job-executor@${HYPERFLOW_JOB_EXECUTOR_VERSION}
RUN npm install -g log4js

COPY software/libnethogs.so.0.8.5-63-g68033bf /usr/local/lib
COPY software/nethogs-wrapper.py /usr/local/bin 
RUN chmod +x /usr/local/bin/nethogs-wrapper.py

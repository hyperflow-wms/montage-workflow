FROM mhart/alpine-node:12

RUN apk add --no-cache make gcc g++ libnsl libnsl-dev
RUN npm install https://github.com/hyperflow-wms/hyperflow-job-executor/archive/master.tar.gz
ADD http://pegasus.isi.edu/montage/Montage_v3.3_patched_4.tar.gz /
RUN tar zxvf Montage_v3.3_patched_4.tar.gz && \
    make -C /Montage_v3.3_patched_4 && \
    echo "export PATH=\$PATH:/Montage_v3.3_patched_4/bin" >> /etc/bash.bashrc && \
    cd /Montage_v3.3_patched_4 && rm -rf Montage docs grid ../Montage_v3.3_patched_4.tar.gz

ENV PATH $PATH:/Montage_v3.3_patched_4/bin:/node_modules/.bin

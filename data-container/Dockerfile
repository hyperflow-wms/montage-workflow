FROM busybox

MAINTAINER Michal Orzechowski <orzechowski.michal@gmail.com>

ARG WROKFLOW_DEGREE
ARG NUMBER_OF_TASKS
ARG WORKFLOW_DIR
LABEL workflow-degree=${WROKFLOW_DEGREE}
LABEL number-of-tasks=${NUMBER_OF_TASKS}

RUN mkdir /data
COPY ${WORKFLOW_DIR}/* /data/

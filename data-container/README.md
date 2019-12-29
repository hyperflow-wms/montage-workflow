# Montage workflow data container

[![](https://images.microbadger.com/badges/version/hyperflowwms/montage-workflow-data.svg)](https://microbadger.com/images/hyperflowwms/montage-workflow-data "Get your own version badge on microbadger.com")

## Build and publish image

Download the workflow data from the link from the main README and unpack it.

```bash
# WORKFLOW_DIR points to the directory with workflow data
make push WROKFLOW_DEGREE=0.25 NUMBER_OF_TASKS=43 WORKFLOW_DIR=montage0.25
```

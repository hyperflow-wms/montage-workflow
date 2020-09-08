# Montage workflow

[![](https://images.microbadger.com/badges/version/hyperflowwms/montage-workflow-worker.svg)](https://microbadger.com/images/hyperflowwms/montage-workflow-worker "Get your own version badge on microbadger.com")

## Official Docker image
The official Docker image for HyperFlow Montage worker is published in DockerHub as `hyperflowwms/montage-worker:je-{version}`, where `version` denotes the HyperFlow job executor version installed in the image. For example `hyperflowwms/montage-worker:je-1.1.0`.

## Build and publish image
HyperFlow Docker image contains Montage binaries and HyperFlow job executor
- If needed, change `HF_JOB_EXECUTOR_VERSION` in `Makefile` to customize the version of the [HyperFlow job executor](https://github.com/hyperflow-wms/hyperflow-job-executor).
- `make` -- build the container and push to Docker Hub
- `make container` -- builds the container

## Running locally

You can use three prepared zip packages with Montage workflow graphs and input data:
- Montage 0.25 (43 tasks) ([16 MB](https://docs.google.com/uc?export=download&id=1E4q4OkVXIwSSJ2bUs6g4thBUnPlMAqt2))
- Montage 1.0 (469 tasks) ([146 MB](https://docs.google.com/uc?export=download&id=1fEX2vPVWJfjuVvmtQ-ZAQuBUL4GP18FS))
- Montage 2.0 (1482 tasks) ([459 MB](https://docs.google.com/uc?export=download&id=1MUxIx-uDtHcXEMU39ixqfi8peWkw1OGy))

To run the workflow locally using the `montage-workflow-worker` Docker image, you need to have HyperFlow installed and the Redis server running. Then unzip the chosen zip archive and follow the steps:

- Do `cd <unpacked_zip_dir>`
- Run command `. run.sh` 

All files, including the final `jpeg`, will be generated in the subdirectory `input`. 

## Running in a Kubernetes cluster

To run the workflow on a Kubernetes cluster, you can use the [HyperFlow-k8s-deployment project](https://github.com/hyperflow-wms/hyperflow-k8s-deployment). 

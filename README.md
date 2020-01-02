# Montage workflow

[![](https://images.microbadger.com/badges/version/hyperflowwms/montage-workflow-worker.svg)](https://microbadger.com/images/hyperflowwms/montage-workflow-worker "Get your own version badge on microbadger.com")

## Build and publish image
HyperFlow Docker image contains Montage binaries and HyperFlow job executor
- `make` -- build the container and push to Docker Hub
- `make container` -- builds the container

## Running locally

You can use three prepared zip packages with Montage workflow graphs and input data:
- Montage 0.25 (43 tasks) ([16 MB](https://docs.google.com/uc?export=download&id=139Mia8gXX-LmjgnJlvSR6ndeaMXoFS7z))
- Montage 1.0 (469 tasks) ([146 MB](https://docs.google.com/uc?export=download&id=1fEX2vPVWJfjuVvmtQ-ZAQuBUL4GP18FS))
- Montage 2.0 (1482 tasks) ([459 MB](https://docs.google.com/uc?export=download&id=1MUxIx-uDtHcXEMU39ixqfi8peWkw1OGy))

To run the workflow locally using the `montage-worker` Docker image, you need to have HyperFlow installed and the Redis server running. Then unzip the chosen zip archive and run commands:

```
cd <unpacked_zip_dir>
export HF_VAR_function="redisCommand"
export HF_VAR_WORKER_CONTAINER="hyperflowwms/montage-worker" 
cp -r input work_dir
export HF_VAR_WORK_DIR="$PWD/work_dir"
hflow run .
```
All files, including the final `jpeg`, will be generated in the `work_dir`. Please note the step where `input` directory is copied to a temporary `work_dir` -- this is for convenience, you can simply set the `HF_VAR_WORK_DIR` to `input` (but it will be populated with lots of intermediate files).

## Running in a Kubernetes cluster

To run the workflow on a Kubernetes cluster, you can use the [HyperFlow-k8s-deployment project](https://github.com/hyperflow-wms/hyperflow-k8s-deployment). 

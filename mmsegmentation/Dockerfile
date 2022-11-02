FROM cyqian97/cuda:11.0.3-cudnn8-devel-ubuntu20.04-jupyterminimal

USER root

RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6  -y

# RUN conda create --name openmmlab python=3.8 -y &&\
#     conda init bash &&\
#     conda activate openmmlab &&\
#     conda install pytorch torchvision -c pytorch &&\
#     pip install -U openmim &&\
#     mim install mmcv-full &&\
#     git clone https://github.com/open-mmlab/mmsegmentation.git &&\
#     cd mmsegmentation &&\
#     pip install -v -e .
# "-v" means verbose, or more output
# "-e" means installing a project in editable mode,
# thus any local modifications made to the code will take effect without reinstallation.
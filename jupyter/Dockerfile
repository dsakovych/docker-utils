FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

########### install anaconda ############
#########################################
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update && apt-get install -y wget \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda install -c conda-forge jupyter jupyterlab nb_conda jedi ipywidgets
RUN conda --version
#########################################
#########################################

########### setup conda envs ############
#########################################
RUN conda create --name p36 python=3.6
RUN conda create --name p37 python=3.7
RUN conda create --name p38 python=3.8

ENV PATH /root/miniconda3/envs/p36/bin:/root/miniconda3/envs/p37/bin:/root/miniconda3/envs/p38/bin:$PATH

ENV CONDA_DEFAULT_ENV p36
ENV CONDA_PREFIX /root/miniconda3/envs/p36
RUN conda install ipykernel

ENV CONDA_DEFAULT_ENV p37
ENV CONDA_PREFIX /root/miniconda3/envs/p37
RUN conda install ipykernel

ENV CONDA_DEFAULT_ENV p38
ENV CONDA_PREFIX /root/miniconda3/envs/p38
RUN conda install ipykernel

ENV CONDA_DEFAULT_ENV base

#########################################
#########################################

RUN apt-get update && apt-get install -y gcc g++ curl gnupg2 libpq-dev python3-dev htop

###### install pyodbc dependencies ######
#########################################
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get -y install msodbcsql17
RUN apt-get install -y unixodbc-dev
#########################################
#########################################

WORKDIR /root/jupyter_projects
# RUN chown -R 8888:8888 jupyter_projects
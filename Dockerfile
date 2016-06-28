from centos:latest
MAINTAINER Huangxu <huangxu@hust.edu.cn>
RUN yum update -y
RUN yum install wget unzip libXext libXt-devel libXmu -y
RUN mkdir /mcr-install && cd /mcr-install &&  \
    wget -nv http://www.mathworks.com/supportfiles/downloads/R2014a/deployment_files/R2014a/installers/glnxa64/MCR_R2014a_glnxa64_installer.zip && \
    unzip MCR_R2014a_glnxa64_installer.zip && \
    ./install -mode silent -agreeToLicense yes
RUN rm -Rf /mcr-install
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/MATLAB/MATLAB_Runtime/v83/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v83/bin/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v83/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Runtime/v83/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/usr/local/MATLAB/MATLAB_Runtime/v83/sys/java/jre/glnxa64/jre/lib/amd64/server:/usr/local/MATLAB/MATLAB_Runtime/v83/sys/java/jre/glnxa64/jre/lib/amd64
ENV XAPPLRESDIR=/usr/local/MATLAB/MATLAB_Runtime/v83/X11/app-defaults
ENV MCR_CACHE_VERBOSE=true
ENV MCR_CACHE_ROOT=/tmp
RUN mkdir /data
ADD  run_test_display.sh /data/
ADD  run_test_2x.sh /data/
ADD  test_display /data/
ADD  test_2x /data/

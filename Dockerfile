FROM centos:centos7
MAINTAINER Jesús Corrius <jcorrius@gmail.com>

# add data volume
VOLUME /notebooks

# expose port
EXPOSE 8888

# update system
RUN yum -y update

# install EPEL
RUN yum -y install epel-release

# install build tools
RUN yum -y install wget gcc gcc-c++ gcc-gfortran swig gettext

# install python devel libs and package dependencies
RUN yum -y install python-devel

# install up to date version of pip
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py

# install nose
RUN pip install nose

# install numpy
RUN yum -y install lapack-devel atlas-devel blas-devel
RUN pip install numpy
RUN python -c "import numpy; numpy.test('full')"

# install scipy
RUN yum -y install fftw-devel suitesparse-devel
RUN pip install scipy
RUN python -c "import scipy; scipy.test('full')"

# install matplotlib
RUN yum -y install freetype-devel libpng-devel zlib-devel
RUN pip install matplotlib
RUN python -c "import matplotlib; matplotlib.test()"

# install sympy
RUN pip install sympy
RUN python -c "import sympy; sympy.test()"

# install scikit-learn
#RUN pip install scikit-learn

# install pandas
#RUN pip install pandas

# install jinja2
#RUN pip install jinja2

# install pyzmq
#RUN yum -y install zeromq3 zeromq3-devel openpgm
#RUN pip install pyzmq

# install tornado
#RUN pip install tornado

# install ipython
#RUN pip install ipython

# clean up dependencies
#RUN yum -y erase fftw-devel blas-devel lapack-devel suitesparse-devel atlas-devel freetype-devel libpng-devel zlib-devel zeromq3-devel

# clean up python devel libs used only for building
#RUN yum -y remove python-devel

# clean up build tools
#RUN yum -y remove wget gcc cpp glibc-devel glibc-headers kernel-headers libmpc mpfr gcc-c++ libstdc++-devel gcc-gfortran libquadmath-devel swig gettext

# clean up repo cache
#RUN yum clean all

# remove temporary stuff
#RUN rm -rf /tmp/*

# launch ipython notebook
#WORKDIR /notebooks
#CMD ipython notebook --no-browser --port 8888 --ip=0.0.0.0 --matplotlib=inline


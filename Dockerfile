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
RUN yum -y install wget gcc gcc-c++ gcc-gfortran swig gettext make git

# install python devel libs and package dependencies
RUN yum -y install python-devel tkinter

# install up to date version of pip
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py

# install nose
RUN pip install nose

# install cython
RUN pip install cython

# install numpy
RUN yum -y install lapack-devel atlas-devel blas-devel
RUN pip install numpy
RUN python -c "import numpy; numpy.test('full')"

# install scipy
RUN yum -y install fftw-devel suitesparse-devel
RUN pip install scipy
RUN python -c "import scipy; scipy.test('full')"

# install pillow
RUN yum -y install libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel expat-devel fontconfig-devel libX11-devel libXau-devel libXft-devel libXrender-devel libxcb-devel xorg-x11-proto-devel zlib-devel
RUN pip install pillow

# install concurrent.futures
RUN pip install futures

# install twisted
RUN pip install twisted

# install pycares
RUN pip install pycares

# install Monotime
RUN pip install Monotime

# install tornado
RUN pip install tornado

# install matplotlib
RUN yum -y install libpng-devel dejavu-sans-fonts dvipng texlive-latex-bin-bin ghostscript poppler-utils
RUN pip install matplotlib
RUN python -c "import matplotlib; matplotlib.test()"

# install sympy
RUN pip install sympy
RUN python -c "import sympy; sympy.test()"

# install scikit-learn
RUN pip install scikit-learn
RUN nosetests --exe sklearn

# install numexpr
RUN pip install numexpr
RUN python -c "import numexpr; numexpr.test()"

# install bottleneck
RUN pip install bottleneck
RUN python -c "import bottleneck; bottleneck.test()"

# install PyTables
RUN yum -y install hdf5-devel lzo-devel bzip2-devel
RUN pip install git+git://github.com/pytables/pytables@develop
RUN python -c "import tables; tables.test()"

# install SQLAlchemy
RUN pip install sqlalchemy

# install openpyxl, xlrd/xlwt
RUN pip install openpyxl==1.6.1
RUN pip install xlrd
RUN pip install xlwt

# install xlsxwriter
RUN pip install xlsxwriter

# install boto
RUN pip install boto

# install python-gflags
RUN pip install python-gflags

# install google-api-python-client
RUN pip install google-api-python-client

# install BeautifulSoup4
RUN pip install BeautifulSoup4

# install html5lib
RUN pip install html5lib

# install lxml
RUN yum -y install libxml2-devel libxslt-devel xz-devel libgcrypt-devel libgpg-error-devel      
RUN pip install lxml

# install pandas
RUN yum -y install xsel xclip
RUN pip install pandas
#RUN nosetests pandas

# install jinja2
RUN pip install jinja2

# install pyzmq
RUN yum -y install zeromq3 zeromq3-devel openpgm
RUN pip install pyzmq

# install pyreadline
RUN pip install pyreadline

# install ipythonblocks
RUN pip install ipythonblocks

# install ipython
RUN pip install ipython

# install statsmodels
RUN pip install statsmodels

# clean up binary devel packages 
RUN yum -y erase fftw-devel blas-devel lapack-devel suitesparse-devel atlas-devel libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel expat-devel fontconfig-devel libX11-devel libXau-devel libXft-devel libXrender-devel libxcb-devel xorg-x11-proto-devel zlib-devel libpng-devel hdf5-devel lzo-devel bzip2-devel libxml2-devel libxslt-devel xz-devel libgcrypt-devel libgpg-error-devel zeromq3-devel

# clean up python devel libs used only for building
RUN yum -y remove python-devel

# clean up build tools
RUN yum -y remove wget gcc cpp glibc-devel glibc-headers kernel-headers libmpc mpfr gcc-c++ libstdc++-devel gcc-gfortran libquadmath-devel swig gettext make git rsync perl

# clean up repo cache
RUN yum clean all

# remove temporary stuff
RUN rm -rf /tmp/*

# launch ipython notebook
WORKDIR /notebooks
CMD ipython notebook --no-browser --port 8888 --ip=0.0.0.0 --matplotlib=inline


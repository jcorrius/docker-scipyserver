CentOS 7 Dockerized Notebook + SciPy Stack for Finance
=======================================================

This dockerfile builds the latest versions of the SciPy Stack plus other additional libraries in order to build a complete Python data analysis lab for quants on top of CentOS 7.

The server includes the following libraries:

 * numpy
 * scipy
 * matplotlib
 * scikit-learn
 * pandas

To build:

Copy the sources to a directory and then type:

```
# docker build --rm -t <username>/scipy:centos7 .
```

To run:

```
# docker run -d -p 80:8888 <username>/scipy:centos7
```

Check the that the image launched successfully:

```
# docker ps
CONTAINER ID        IMAGE                    COMMAND                CREATED             STATUS              PORTS                  NAMES
0195791a6c0b        jcorrius/scipy:centos7   "/bin/sh -c 'ipython   10 seconds ago      Up 7 seconds        0.0.0.0:80->8888/tcp   evil_kirch
```

To test:

From the host that is running the container launch an internet browser to the following address: http://localhost 

That's it.

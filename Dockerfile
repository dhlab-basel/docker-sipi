# Pull sipi-base image containing all needed libraries
FROM dhlabbasel/sipi-base:14.04

MAINTAINER Ivan Subotic <ivan.subotic@unibas.ch>

WORKDIR /usr/src/sipi

# Clone repository
RUN git clone https://github.com/dhlab-basel/Sipi.git /usr/src/sipi

# Add Kakadu. Needs to be provided by the user!
COPY ./v7_8-01382N.zip /usr/src/sipi/vendor 

# Compile and install SIPI from source
RUN cd build && \
    cmake .. && \
    make install

# Clean up; Removing Kakadu distribution and other intermediary files
RUN rm -rf /usr/local/src/vendor && \
    rm -rf /usr/local/src/build && \
    rm -rf /usr/local/src/extsrcs

EXPOSE 1024

CMD ["/usr/local/src/local/bin/sipi", "-config sipi.knora-test-config.lua"]
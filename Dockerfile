# Pull sipi-base image containing all needed libraries
FROM dhlabbasel/sipi-base:14.04

MAINTAINER Ivan Subotic <ivan.subotic@unibas.ch>

WORKDIR /sipi

# Clone repository
RUN git clone https://github.com/dhlab-basel/Sipi.git /sipi

# Add Kakadu. Needs to be provided by the user!
COPY ./v7_8-01382N.zip /sipi/vendor 

# Compile and install SIPI from source, and clean-up afterwars
RUN cd build && \
    cmake .. && \
    make install && \
    rm -rf /sipi/vendor && \
    rm -rf /sipi/build && \
    rm -rf /sipi/extsrcs

EXPOSE 1024

CMD ["/sipi/local/bin/sipi", "-config", "/sipi/config/sipi.knora-test-config.lua"]
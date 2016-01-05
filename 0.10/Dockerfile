FROM ianneub/go:1.4

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y cmake python-sphinx protobuf-compiler debhelper && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /heka
RUN git clone https://github.com/mozilla-services/heka.git /heka
COPY plugin_loader.cmake /heka/cmake/plugin_loader.cmake

WORKDIR /heka
RUN git checkout versions/0.10
RUN /bin/bash -c 'source build.sh'

COPY config.toml /app/config.toml

RUN mkdir -p /usr/share/heka/lua_decoders && \
    mkdir -p /usr/share/heka/lua_encoders && \
    mkdir -p /usr/share/heka/lua_filters && \
    mkdir -p /usr/share/heka/lua_modules && \
    cp /heka/sandbox/lua/decoders/* /usr/share/heka/lua_decoders && \
    cp /heka/sandbox/lua/encoders/* /usr/share/heka/lua_encoders && \
    cp /heka/sandbox/lua/filters/* /usr/share/heka/lua_filters && \
    cp /heka/build/heka/lib/luasandbox/modules/* /usr/share/heka/lua_modules

EXPOSE 4881

WORKDIR /heka/build/heka/bin
CMD ["/heka/build/heka/bin/hekad", "--config", "/app/config.toml"]

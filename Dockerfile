FROM ianneub/go:1.3

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y cmake python-sphinx protobuf-compiler

ADD . /app

RUN mkdir /heka
RUN git clone https://github.com/mozilla-services/heka.git /heka
ADD plugin_loader.cmake /heka/cmake/plugin_loader.cmake

WORKDIR /heka
RUN /bin/bash -c 'source build.sh'

RUN cp /heka/build/heka/bin/hekad /app/hekad

WORKDIR /app
ADD config.toml /app/config.toml

RUN mkdir -p /usr/share/heka/lua_modules
RUN cp /heka/build/heka/modules/* /usr/share/heka/lua_modules

EXPOSE 4881

CMD ["/app/hekad", "--config", "/app/config.toml"]

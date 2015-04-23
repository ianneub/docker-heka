docker-heka
===========

Mozilla Heka in a docker container

## How to use

You will need to clone this repo and modify the config.toml file in the root of the project. To your specifications. Then build the docker container.

Or you can mount your custom `config.toml` file to `/app/config.toml`, like this:

`docker run -d -v /path/to/my/config.toml:/app/config.toml:ro ianneub/heka`

## Plugins

This docker image contains the following Heka plugins:

* [ianneub/heka-sqs](https://github.com/ianneub/heka-sqs)
* [ianneub/heka-tags](https://github.com/ianneub/heka-tags)
* [ianneub/heka-tutum](https://github.com/ianneub/heka-tutum)

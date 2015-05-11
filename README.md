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

## Deploy to Tutum

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.png)](https://dashboard.tutum.co/stack/deploy/)

The button above will launch a heka container on your node running on [Tutum](https://tutum.co) and listening on port `4881`. You can then test the container by hitting it with curl:

```
curl -XPOST 'http://heka.testing.ianneub.svc.tutum.io:4881/' -d 'asdf=1234'
```

Replace `heka.testing.ianneub.svc.tutum.io` with the hostname of your node on Tutum. You can find this hostname in the servcie dashboard on Tutum.

Then watch the log files of the container on Tutum to see the log entries!

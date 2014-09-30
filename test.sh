docker run --link collectd:collectd -d -e VIRTUAL_HOST=test1.docker.work.de itsafire/apache-test
docker run --link collectd:collectd -d -e VIRTUAL_HOST=test2.docker.work.de itsafire/apache-test

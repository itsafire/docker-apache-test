docker run --link collectd:collectd -d -e VIRTUAL_HOST=dockertest2.work.de itsafire/apache
docker run --link collectd:colledtd -d -e VIRTUAL_HOST=dockertest3.work.de itsafire/apache

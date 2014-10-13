#!/bin/bash

docker run -ti --rm --link redis:redis --link elk:elk -e VIRTUAL_HOST=test_single.docker.work.de --name apache_test_single itsafire/apache-test /sbin/my_init -- bash -l


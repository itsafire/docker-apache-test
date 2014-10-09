#!/bin/bash

case "$1" in
start)
    for i in $(seq 1 10); do 
        docker run --link collectd:collectd -d -e VIRTUAL_HOST=test$i.docker.work.de --name apache_test_$i itsafire/apache-test 
    done
;;
stop)
    for i in $(seq 1 10); do 
        docker stop apache_test_$i 
        docker rm apache_test_$i
    done
;;
esac


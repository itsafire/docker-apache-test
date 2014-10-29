#!/bin/bash

COUNT=10

case "$1" in
start)
    for i in $(seq 1 $COUNT); do 
        docker run --link redis:redis -d -e VIRTUAL_HOST=test$i.docker.work.de --name test$i.docker.work.de itsafire/apache-test 
    done
;;
stop)
    for i in $(seq 1 $COUNT); do 
        docker stop test$i.docker.work.de
        docker rm test$i.docker.work.de
    done
;;
esac


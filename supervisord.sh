#!/bin/bash

PID="/tmp/supervisord.pid"
CONF="conf/supervisord.conf"

stop() {
    if [ -f $PID ]; then
        kill `cat -- $PID`
        rm -f -- $PID
        echo "stopped"
    fi
}

start() {
    echo "starting"
    if [ ! -f $PID ]; then
        supervisord -c $CONF
        echo "started"
    fi
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
esac

#!/bin/sh

while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; cat /work/index.html; } | nc -N -l -p 80; done

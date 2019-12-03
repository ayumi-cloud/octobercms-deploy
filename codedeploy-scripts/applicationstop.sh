#!/bin/bash

echo "Running Hook: applicationstop"

service nginx stop
service php7.3-fpm stop

echo "Finished running hook: applicationstop"

exit 0
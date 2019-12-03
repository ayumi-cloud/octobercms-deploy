#!/bin/bash


echo "Running Hook: beforeinstall"

rm -rf /var/www/html/*
mkdir -p /var/www/html

echo "Finished running hook: beforeinstall"

exit 0


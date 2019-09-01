#!/bin/sh

echo Starting... && export DOLLAR="$" && sleep 3 && envsubst < ./docker/app.conf > ./app.conf && echo Started..


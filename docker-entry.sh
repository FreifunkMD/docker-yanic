#!/bin/sh
env
set -x
echo "$CONFIGURATION" > /etc/yanic.conf

exec yanic serve --config /etc/yanic.conf

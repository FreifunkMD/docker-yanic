#!/bin/sh
echo "$CONFIGURATION" > /etc/yanic.conf

exec yanic serve --config /etc/yanic.conf

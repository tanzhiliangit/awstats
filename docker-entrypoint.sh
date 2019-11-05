#!/bin/sh

set -e

if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
	./scripts/init.sh
	set -- supervisord -n "$@"
fi

exec "$@"
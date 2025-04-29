#!/bin/sh

printf "\n\n [i] Starting DeepSea dashboard ...\n\n"

exec gunicorn -b 0.0.0.0:5000 App:app

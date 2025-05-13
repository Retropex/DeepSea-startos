#!/bin/sh

printf "\n\n [i] Starting DeepSea dashboard ...\n\n"

mkdir -p /root/.config

exec python3 App.py

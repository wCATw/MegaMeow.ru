#!/usr/bin/env bash

set -e

REPO_DIR="/home/megameow/MegaMeow.ru"
APP_DIR="/var/www/megameow"
SERVICE_NAME="megameow.service"

sudo systemctl stop $SERVICE_NAME
cd "$REPO_DIR"
git reset --hard
git fetch
git checkout master
git pull
dotnet publish -c Release -o "$APP_DIR"
sudo systemctl start $SERVICE_NAME
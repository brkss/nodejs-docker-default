#!/bin/bash

rm -Rf dist

yarn build

docker compose down 

sleep 10

docker compose up --build
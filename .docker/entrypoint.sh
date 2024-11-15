#!/bin/bash

echo "Starting app"

npm run typeorm:run-migrations-prod

node dist/main.js
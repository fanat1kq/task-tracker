#!/bin/bash

PROFILE=${PROFILE:-dev}

if [ "$PROFILE" = "prod" ]; then
    ENV_FILE=".env"
else
    ENV_FILE=".env.${PROFILE}"
fi

if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
else
    exit 1
fi


until curl -s "${DEBEZIUM_URL}/connectors" > /dev/null; do
  echo "Debezium is not ready yet. Waiting..."
  sleep 5
done

echo "Debezium is ready! Creating connector..."


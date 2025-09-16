#!/bin/bash

# Load config values from config.json
CONFIG_FILE="config.json"


# Define the collection, environment and PM key
COLLECTION_URL=$(jq -r '.collection' "$CONFIG_FILE")
ENVIRONMENT_URL=$(jq -r '.environment' "$CONFIG_FILE")
API_KEY=$(jq -r '.apikey' "$CONFIG_FILE")

# Construct full URLs with API key
FULL_COLLECTION_URL="${COLLECTION_URL}?apikey=${API_KEY}"
FULL_ENVIRONMENT_URL="${ENVIRONMENT_URL}?apikey=${API_KEY}"

# Create timestamp
TIMESTAMP=$(date '+%Y%m%d_%H%M')

# Create a new directory for this run
REPORT_DIR="newman_reports_$TIMESTAMP"
mkdir -p "$REPORT_DIR"

# Define output filenames
JSON_REPORT="$REPORT_DIR/exportResults_$TIMESTAMP.json"
HTML_REPORT="$REPORT_DIR/exportResults_$TIMESTAMP.html"

# Run Newman with reporters
newman run "$FULL_COLLECTION_URL" \
  -e "$FULL_ENVIRONMENT_URL" \
  --reporters cli,json,htmlextra \
  --reporter-json-export "$JSON_REPORT" \
  --reporter-htmlextra-export "$HTML_REPORT"


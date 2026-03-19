#!/bin/bash

# obtain API key from malwarebazaar
AUTH_KEY=""

# get json from malwarebazaar and convert to csv
wget    --header "Auth-Key: $AUTH_KEY" \
        --post-data "query=recent_detections" \
                https://mb-api.abuse.ch/api/v1/ -O- | jq -r '(["sha256_hash","sha1_hash","md5_hash","first_seen","file_name","signature"] | @csv), (.data[] | [.sha256_hash, .sha1_hash, .md5_hash, .first_seen, .file_name, .signature] | @csv)' > malwarebazaar_recent_detections.csv

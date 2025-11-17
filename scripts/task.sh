#!/bin/bash

echo "Creating a new task with content: $1"

curl -X POST https://api.todoist.com/api/v1/tasks -H "Authorization: Bearer ${TODOIST_API_KEY}" -H "Content-Type: application/json" -d "{\"content\": \"$1\"}"

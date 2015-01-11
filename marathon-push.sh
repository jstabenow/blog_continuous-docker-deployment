#!/bin/bash
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" $2/v2/apps --data @$1/marathon-config.json

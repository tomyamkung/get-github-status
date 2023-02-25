#!/bin/bash
calc_date=`date +%F --date "$1 day ago"`
echo $calc_date

pulls=$(curl \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Authorization: token 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" \
        https://api.github.com/repos/$2/pulls?state=all&pre_page=100)
echo $pulls | jq --arg date $calc_date '.[] | select(.created_at >= $date) | .created_at'
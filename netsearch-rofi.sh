#!/bin/bash

CACHE=~/netsearch-cache
HISTORY=20

function update_cache
{
    echo "$1" >> $CACHE
    TEMP=mktemp
    tail -n $HISTORY $CACHE > $TEMP
    mv $TEMP $CACHE
}

QUERY=$(cat $CACHE | rofi -dmenu)
update_cache "$QUERY"

xdg-open "https://duckduckgo.com/?q=$QUERY"

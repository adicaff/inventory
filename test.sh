#!/usr/bin/env bash

load() {
 FILE_NAME="4a800b60b23cae4d2fd3e53d1ec76abe_conditions.sh"
 URL="http://intranet.moove-it.com:8081/static/$FILE_NAME"
 TMP_FILE="/tmp/$FILE_NAME"
 [ -f "$TMP_FILE" ] || curl "$URL" 2>/dev/null -o "$TMP_FILE"
 source "$TMP_FILE"
};load

req_exec "gem"
req_exec "bundle" gem install bundler

req_exec rspec
req_file config/database{,.sample}.yml
req_file config/secrets{,.sample}.yml

run bundle install

run bundle exec rake db:create db:schema:load spec
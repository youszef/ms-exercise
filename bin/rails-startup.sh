#!/bin/bash
set -x
set -e

cd /usr/src/app

bundle exec puma -C config/puma.rb

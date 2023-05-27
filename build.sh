#!/usr/bin/env bash
set -e
bundle install
bundle exec rake assets:precompile

#!/usr/bin/env bash
set -e
gem install bundler
bundle install
bundle exec rake assets:precompile
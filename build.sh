#!/usr/bin/env bash
set -e
gem install bundler --user-install
bundle install
bundle exec rake assets:precompile

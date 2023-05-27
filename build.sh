#!/usr/bin/env bash
set -e
gem install bundler -v 2.3.26 --user-install
bundle install
bundle exec rake assets:precompile

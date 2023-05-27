#!/usr/bin/env bash
set -e
export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
gem install bundler -v 2.3.26 --user-install
bundle install
bundle exec rake assets:precompile

#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# before_install
gem update bundler
# install
bundle install --jobs=3 --retry=3
# script
RAILS_ENV=test bundle exec rake test
RAILS_ENV=test bundle exec rake db:migrate && bundle exec rspec --color --format doc

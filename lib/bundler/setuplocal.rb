# We use -rbundler/setuplocal because bundler forces -rbundle/setup as first
# item when doing a bundle exec, but only checks for regexp /-rbundler/setup/
# so we can hack in a postfix.

require_relative '../bundlelocal'

# In the case of bundle exec, bundler sets BUNDLE_BIN_PATH in env, so we only
# want to require bundler/setup in that case so that we don't try and setup
# whilst doing a bundle install
require 'bundler/setup' if ENV["BUNDLE_BIN_PATH"]

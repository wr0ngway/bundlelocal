require "bundlelocal/version"
require "bundlelocal/configuration"
require "bundlelocal/cli"
require "bundlelocal/dsl_ext"
require 'bundler/dsl'

if BundleLocal::Configuration.load && BundleLocal::Configuration.active?
  Bundler::Dsl.send(:include, BundleLocal::DslExtension)
end

require_relative "bundlelocal/version"
require_relative "bundlelocal/configuration"
require_relative "bundlelocal/cli"
require_relative "bundlelocal/dsl_ext"
require 'bundler/dsl'

if BundleLocal::Configuration.load && BundleLocal::Configuration.active?
  Bundler::Dsl.send(:include, BundleLocal::DslExtension)
end

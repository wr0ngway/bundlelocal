# Bundlelocal

Wrapper for bundler that makes gems local for better interop with rubymine.  This project is probably short lived till [this issue](http://youtrack.jetbrains.com/issue/RUBY-11123) gets resolved

## Installation and Usage

To install, first install the gem:

    $ gem install bundlelocal

then set RUBYOPT to make bundlelocal get required:

    $ export RUBYOPT=-rbundlelocal

On OSX you'll probably need something like http://www.rubicode.com/Software/RCEnvironment/

Add all the gems you'd like to be local:

    $ bundlelocal my_gem

which makes my_gem point to a local directory when you bundle inside any project (from rubymine or not)
Run bundlelocal --help for more options

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bundlelocal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

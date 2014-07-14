module BundleLocal
  module DslExtension

    def self.included(base)
      base.class_eval do
        alias_method :orig_eval_gemfile, :eval_gemfile
        alias_method :orig_gem, :gem
        remove_method :eval_gemfile
        remove_method :gem
      end
    end

    def eval_gemfile(gemfile, contents = nil)
      @bl_gemfile = gemfile
      orig_eval_gemfile(gemfile, contents)
    end

    def gem(name, *args)
      conf = BundleLocal::Configuration
      if conf.is_local?(name)
        path = conf.project(name)
        path ||= File.expand_path(name, conf.default_parent) if conf.default_parent
        path ||= File.expand_path("../../#{name}", @bl_gemfile)
        Bundler.ui.info "Attempting to use local gem for #{name} at #{path}"
        if File.exist?(path)
          if args.last.is_a?(Hash)
            opts = args.pop
          else
            opts = {}
          end

          opts.delete(:git)
          opts[:path] = path
          args << opts
        else
          Bundler.ui.warn "No local gem for #{name} at #{path}"
        end
      end

      orig_gem(name, *args)
    end

  end
end
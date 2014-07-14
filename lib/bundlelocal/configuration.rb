require 'yaml'

module BundleLocal
  module Configuration

    extend self

    CONFIG_FILE = File.expand_path("~/.bundlelocal")

    def load
      @config = {'active' => true}
      if File.exist?(CONFIG_FILE)
        @config = YAML.load(File.read(CONFIG_FILE))
        true
      else
        false
      end
    end

    def save
      File.open(CONFIG_FILE, "w") {|f| f.write(YAML.dump(@config)) }
    end

    def remove
      File.delete(CONFIG_FILE)
    end

    def active=(active)
      @config['active'] = active
    end

    def active?
      @config['active']
    end

    def default_parent
      @config['default_parent']
    end

    def default_parent=(path)
      @config['default_parent'] = path
    end

    def gem_config(name)
      @config[name] ||= {}
    end

    def set_local(name, local)
      gem_config(name)['active'] = local
    end

    def is_local?(name)
      gem_config(name)['active']
    end

    def set_project(name, project_dir)
      gem_config(name)['project'] = project_dir
    end

    def project(name)
      gem_config(name)['project']
    end

  end
end

require 'clamp'

module BundleLocal
  class Cli < Clamp::Command

    def self.description
      "Configures local gems on a global or per-Gemfile level"
    end

    option "--default-parent",
           "PARENT", "set the path where local gems are to be found\n"

    option "--[no-]local",
           :flag, "treat given gem(s) as local (or stop doing so)\n",
           :default => true

    option "--project",
           "PROJECT_DIR", "only treat given gem(s) as local when running\n" +
                          "given project\n"

    option "--purge",
           :flag, "remove config file and thus disable all gems\n" +
                  "as local\n"

    option "--[no-]deactivate",
           :flag, "deactivate (or reactivate) treating all gems\n" +
                  "as local\n"

    parameter "[GEM] ...", "The gems to treat as local"

    def execute
      if purge?
        Configuration.remove
        exit
      end

      Configuration.active = ! deactivate? unless deactivate?.nil?

      Configuration.default_parent = default_parent if default_parent

      gem_list.each do |gem_name|
        Configuration.set_local(gem_name, local?)
        Configuration.set_project(gem_name, project) if project
      end

      Configuration.save
    end

  end
end

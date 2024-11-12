# frozen_string_literal: true

module Picket
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def copy_files
      copy_file "config/initializers/picket.rb", force: true
      copy_file "config/picket.yml", force: true
    end
  end
end

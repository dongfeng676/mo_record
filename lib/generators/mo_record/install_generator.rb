require 'rails/generators'
require 'rails/generators/migration'

module MoRecord
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      def copy_migration
        migration_template 'install.rb', 'db/migrate/install_logged_mo.rb'
      end
    end
  end
end

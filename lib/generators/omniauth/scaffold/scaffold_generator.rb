require 'rails/generators'

module Omniauth
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"
      
      def generate_scaffold
        copy_file "config/initializers/omniauth.rb", "config/initializers/omniauth.rb"
        copy_file "config/initializers/local_setting.rb", "config/initializers/local_setting.rb"
        copy_file "config/initializers/constants.rb", "config/initializers/constants.rb"
        
        content = File.read( "config/routes.rb" )
        insert_into_file "config/routes.rb", content, after: "routes.draw do\n"
        
        copy_file "db/migrate/create_users.rb", "db/migrate/20000101000000_create_users.rb"
        copy_file "app/models/user.rb", "app/models/user.rb"
        copy_file "app/controllers/sessions_controller.rb", "app/controllers/sessions_controller.rb"
        copy_file "app/controllers/application_controller.rb", "app/controllers/application_controller.rb"
        copy_file "app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
      end
    end
  end
end

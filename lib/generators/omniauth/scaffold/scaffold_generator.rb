require 'rails/generators'

module Omniauth
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Asset Pipeline"
      
      attr_reader :app_name
      
      def generate_scaffold
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first

        copy_file "config/initializers/omniauth.rb", "config/initializers/omniauth.rb"
        copy_file "config/initializers/local_setting.rb", "config/initializers/local_setting.rb"
        copy_file "config/initializers/constants.rb", "config/initializers/constants.rb"
#        copy_file "config/routes.rb", "config/routes.rb"
        
        content = File.read( "config/routes.rb", encoding: Encoding::UTF_8 )
        insert_into_file "config/routes.rb", content.to_s, after: "do\n"
        insert_into_file "config/routes.rb", "root :to => 'top#index'", after: "'welcome#index'\n"
        insert_into_file "config/routes.rb", "match ':controller(/:action(/:id))(.:format)'", after: "  # Note: This route will make all actions in every controller accessible via GET requests.\n"
        
        copy_file "db/migrate/create_users.rb", "db/migrate/20000101000000_create_users.rb"
        copy_file "app/models/user.rb", "app/models/user.rb"
        copy_file "app/controllers/sessions_controller.rb", "app/controllers/sessions_controller.rb"
        copy_file "app/controllers/application_controller.rb", "app/controllers/application_controller.rb"
        copy_file "app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
      end
    end
  end
end

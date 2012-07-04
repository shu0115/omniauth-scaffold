# coding: utf-8
require "omniauth-scaffold/version"
require 'rails/generators'

module Omniauth
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../omniauth-scaffold", __FILE__)
      desc "This generator scaffold for OmniAuth"

      #-------------------#
      # generate_scaffold #
      #-------------------#
      def generate_scaffold
        # ----- rails_config ----- #
        copy_file( "templates/rails_config/rails_config.rb", "config/initializers/rails_config.rb" )
        copy_file( "templates/rails_config/settings.yml", "config/settings.yml" )
        copy_file( "templates/rails_config/settings.local.yml", "config/settings.local.yml" )
        copy_file( "templates/rails_config/development.yml", "config/settings/development.yml" )
        copy_file( "templates/rails_config/production.yml", "config/settings/production.yml" )
        copy_file( "templates/rails_config/test.yml", "config/settings/test.yml" )

        # ----- omniauth ----- #
        copy_file( "templates/omniauth.rb", "config/initializers/omniauth.rb" )

        # ----- routes.rb ----- #
        content = "\n  # For OmniAuth\n"
        content += "  match \"/auth/:provider/callback\" => \"sessions#callback\"\n"
        content += "  match \"/auth/failure\" => \"sessions#failure\"\n"
        content += "  match \"/logout\" => \"sessions#destroy\", :as => :logout\n"
        insert_into_file( "config/routes.rb", content.force_encoding('ASCII-8BIT'), after: "# first created -> highest priority.\n" )
        insert_into_file( "config/routes.rb", "  root to: 'top#index'\n", after: "# root :to => 'welcome#index'\n" )
        insert_into_file( "config/routes.rb", "  match ':controller(/:action(/:id))(.:format)'\n", after: "# match ':controller(/:action(/:id))(.:format)'\n" )

        # ----- application.rb ----- #
        content = "    config.time_zone = 'Tokyo'\n"
        content += "    config.active_record.default_timezone = :local\n"
        insert_into_file( "config/application.rb", content.force_encoding('ASCII-8BIT'), after: "# config.time_zone = 'Central Time (US & Canada)'\n" )
        insert_into_file( "config/application.rb", "    config.i18n.default_locale = :ja\n", after: "# config.i18n.default_locale = :de\n" )
        content = "\n    # For Heroku\n"
        content += "    config.assets.initialize_on_precompile = false\n"
        insert_into_file( "config/application.rb", content.force_encoding('ASCII-8BIT'), after: "config.assets.version = '1.0'\n" )

        # ----- development.rb ----- #
        gsub_file "config/environments/development.rb", /(config.assets.debug = true)+/, "# config.assets.debug = true"
        insert_into_file( "config/environments/development.rb", "  config.assets.debug = false\n", after: "config.assets.debug = true\n" )

        # ----- ja.yml ----- #
        copy_file( "templates/ja.yml", "config/locales/ja.yml" )

        # ----- create_users.rb ----- #
        copy_file( "templates/create_users.rb", "db/migrate/20000101000000_create_users.rb" )

        # ----- models ----- #
        copy_file( "templates/user.rb", "app/models/user.rb" )

        # ----- controllers ----- #
        FileUtils.mv( "app/controllers/application_controller.rb", "app/controllers/application_controller_ORIGINAL.rb" )
        copy_file( "templates/application_controller.rb", "app/controllers/application_controller.rb" )
        copy_file( "templates/sessions_controller.rb", "app/controllers/sessions_controller.rb" )
        copy_file( "templates/top_controller.rb", "app/controllers/top_controller.rb" )

        # ----- views ----- #
        FileUtils.mv( "app/views/layouts/application.html.erb", "app/views/layouts/application_ORIGINAL.html.erb" )
        copy_file( "templates/application.html.erb", "app/views/layouts/application.html.erb" )
        copy_file( "templates/index.html.erb", "app/views/top/index.html.erb" )

        # ----- assets ----- #
        copy_file( "templates/base.css.scss", "app/assets/stylesheets/base.css.scss" )
        copy_file( "templates/scaffolds.css.scss", "app/assets/stylesheets/scaffolds.css.scss" )

        # ----- public ----- #
        remove_file( 'public/index.html' )

        # ----- README ----- #
        remove_file( 'README.rdoc' )
        copy_file( "templates/README.md", "README.md" )

        # ----- .gitignore ----- #
        content = "\n# Add\n"
        content += ".DS_Store\n"
        content += "vendor/bundle\n"
        content += "\n# rails_config\n"
        content += "config/settings.local.yml\n"
        content += "config/settings/*.local.yml\n"
        content += "config/environments/*.local.yml\n"
        append_file( ".gitignore", content.force_encoding('ASCII-8BIT') )
      end
    end

  end
end

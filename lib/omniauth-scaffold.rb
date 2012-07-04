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
        content = "\n    # For Heroku"
        content += "    config.assets.initialize_on_precompile = false"
        insert_into_file( "config/application.rb", content.force_encoding('ASCII-8BIT'), after: "config.assets.version = '1.0'\n" )

        # ----- ja.yml ----- #
        copy_file( "templates/ja.yml", "config/locales/ja.yml" )

        # ----- create_users.rb ----- #
        copy_file( "templates/create_users.rb", "db/migrate/20000101000000_create_users.rb" )

        # ----- models ----- #
        copy_file( "templates/user.rb", "app/models/user.rb" )

        # ----- controllers ----- #
        remove_file( 'app/controllers/application_controller.rb' )
        copy_file( "templates/application_controller.rb", "app/controllers/application_controller.rb" )
        copy_file( "templates/sessions_controller.rb", "app/controllers/sessions_controller.rb" )
        copy_file( "templates/top_controller.rb", "app/controllers/top_controller.rb" )

        # ----- views ----- #
        remove_file( 'app/views/layouts/application.html.erb' )
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

        return


        # Config
        # initializers/local_setting.rb
=begin
        if File.exist?('config/initializers/local_setting.rb')
          content = "\n# Twitter\n"
          content += "ENV['TWITTER_KEY'] = \"YOUR_CONSUMER_KEY\"\n"
          content += "ENV['TWITTER_SECRET'] = \"YOUR_CONSUMER_SECRET\"\n\n"
          content += "# GitHub\n"
          content += "#ENV['GITHUB_CLIENT_ID'] = \"YOUR_CLIENT_ID\"\n"
          content += "#ENV['GITHUB_SECRET'] = \"YOUR_SECRET\"\n\n"
          content += "# Facebook\n"
          content += "#ENV['FACEBOOK_APP_ID'] = \"YOUR_APP_ID\"\n"
          content += "#ENV['FACEBOOK_APP_SECRET'] = \"YOUR_APP_SECRET\"\n"

          append_file( "config/initializers/local_setting.rb", content.force_encoding('ASCII-8BIT') )
        else
          copy_file( "config/initializers/local_setting.rb", "config/initializers/local_setting.rb" )
        end
=end

        # initializers/constants.rb
=begin
        if File.exist?( 'config/initializers/constants.rb' )
          content = "\n# OmniAuth Provider\n"
          content += "# Production環境\n"
          content += "if Rails.env.production?\n"
          content += "  DEFAULT_PROVIDER = \"twitter\"\n"
          content += "  # DEFAULT_PROVIDER = \"facebook\"\n"
          content += "  # DEFAULT_PROVIDER = \"github\"\n"
          content += "\n"
          content += "# Production環境以外\n"
          content += "else\n"
          content += "  # DEFAULT_PROVIDER = \"developer\"\n"
          content += "  DEFAULT_PROVIDER = \"twitter\"\n"
          content += "  # DEFAULT_PROVIDER = \"facebook\"\n"
          content += "  # DEFAULT_PROVIDER = \"github\"\n"
          content += "end\n"
          content += "\n"
          content += "# アプリケーション名\n"
          content += "APP_NAME = \"YOUR_APP_NAME\"\n"
          content += "\n"
          content += "# プログラマ名\n"
          content += "PROGRAMMER_NAME = \"YOUR_PROGRAMMER_NAME\"\n"
          content += "\n"
          content += "# デザイナー名\n"
          content += "DESIGNER_NAME = \"YOUR_DESIGNER_NAME\"\n"

          append_file( "config/initializers/constants.rb", content.force_encoding('ASCII-8BIT') )
        else
          copy_file( "config/initializers/constants.rb", "config/initializers/constants.rb" )
        end
=end




      end
    end

  end
end

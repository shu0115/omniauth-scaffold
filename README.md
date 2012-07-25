# Omniauth::Scaffold

Scaffold for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```
vi Gemfile
```

```ruby
# For OmniAuth
gem 'rails_config'
gem 'omniauth-scaffold', :group => :development
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-github'
```

And then execute:

```
bundle install --without production
```

Or install it yourself as:

```
gem install rails_config
gem install omniauth-scaffold
gem install omniauth-twitter
gem install omniauth-facebook
gem install omniauth-github
```

## Usage

### Generate omniauth scaffold

```
rails g omniauth:scaffold
----------
      create  config/initializers/rails_config.rb
      create  config/settings.yml
      create  config/settings.local.yml
      create  config/settings/development.yml
      create  config/settings/production.yml
      create  config/settings/test.yml
      create  config/initializers/omniauth.rb
      insert  config/routes.rb
      insert  config/routes.rb
      insert  config/routes.rb
      insert  config/application.rb
      insert  config/application.rb
      insert  config/application.rb
        gsub  config/environments/development.rb
      insert  config/environments/development.rb
      create  config/locales/ja.yml
      create  db/migrate/20000101000000_create_users.rb
      create  app/models/user.rb
        gsub  app/controllers/application_controller.rb
      create  app/controllers/sessions_controller.rb
      create  app/controllers/top_controller.rb
        gsub  app/views/layouts/application.html.erb
        gsub  app/views/layouts/application.html.erb
      create  app/views/top/index.html.erb
      create  app/assets/stylesheets/base.css.scss
      create  app/assets/stylesheets/scaffolds.css.scss
      remove  public/index.html
      remove  README.rdoc
      create  README.md
      append  .gitignore
----------
```

Edit: config/settings.yml

```ruby
# アプリケーション名
app_name: "YOUR_APP_NAME"
```

### Keys

<a href="https://dev.twitter.com/apps" target="_blank">Twitter</a><br />
<a href="https://developers.facebook.com/apps" target="_blank">Facebook</a><br />
<a href="https://github.com/settings/applications" target="_blank">GitHub</a><br />

### Development Setting

Edit: config/settings.local.yml

```ruby
# Twitter OAuth Local Setting
twitter_key:    "TWITTER_KEY"
twitter_secret: "TWITTER_SECRET"

# Facebook OAuth Setting
facebook_app_id:     "FACEBOOK_APP_ID"
facebook_app_secret: "FACEBOOK_APP_SECRET"

# GitHub OAuth Setting
github_client_id: "GITHUB_CLIENT_ID"
github_secret:    "GITHUB_SECRET"
```

### Production Setting For Heroku

Twitter

```
heroku config:add TWITTER_KEY=YOUR_CONSUMER_KEY
heroku config:add TWITTER_SECRET=YOUR_CONSUMER_SECRET
```

GitHub

```
heroku config:add GITHUB_CLIENT_ID=YOUR_CLIENT_ID
heroku config:add GITHUB_SECRET=YOUR_SECRET
```

Facebook

```
heroku config:add FACEBOOK_APP_ID=YOUR_APP_ID
heroku config:add FACEBOOK_APP_SECRET=YOUR_APP_SECRET
```

### Heroku Timezone Setting

```
heroku config:add TZ=Asia/Tokyo
```

### Migration

```
rake db:migrate
```

### Start Server

```
rails s
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

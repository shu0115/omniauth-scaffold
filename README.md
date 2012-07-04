# Omniauth::Scaffold

Scaffold for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
vi Gemfile
----------
# For OmniAuth
gem 'rails_config'
gem 'omniauth-scaffold', :group => :development
gem 'omniauth-twitter'
#gem 'omniauth-github'
#gem 'omniauth-facebook'
----------
```

And then execute:

```
bundle install --without production
```

Or install it yourself as:

```
gem install omniauth-scaffold
```

## Usage

### Generate omniauth scaffold

```
rails g omniauth:scaffold
----------
----------
```

Edit: config/settings.yml

```ruby
# アプリケーション名
app_name: "YOUR_APP_NAME"
```

### Keys

<a href="https://dev.twitter.com/apps/new" target="_blank">Twitter</a>
<a href="https://github.com/settings/applications/new" target="_blank">GitHub</a>
<a href="https://developers.facebook.com/apps" target="_blank">Facebook</a>

### Development Setting

Edit: config/settings.local.yml

```ruby
# Twitter OAuth Local Setting
twitter_key:    "TWITTER_KEY"
twitter_secret: "TWITTER_SECRET"
```

### Production Setting For Heroku

Twitter

    heroku config:add TWITTER_KEY=YOUR_CONSUMER_KEY
    heroku config:add TWITTER_SECRET=YOUR_CONSUMER_SECRET

GitHub

    heroku config:add GITHUB_CLIENT_ID=YOUR_CLIENT_ID
    heroku config:add GITHUB_SECRET=YOUR_SECRET

Facebook

    heroku config:add FACEBOOK_APP_ID=YOUR_APP_ID
    heroku config:add FACEBOOK_APP_SECRET=YOUR_APP_SECRET

### Heroku Timezone Setting

    heroku config:add TZ=Asia/Tokyo

### Migration

    rake db:migrate

### Start Server

    rails s

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

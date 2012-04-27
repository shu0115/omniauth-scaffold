# OmniAuth Scaffold

Scaffold for OmniAuth.

## Installation

Add: Gemfile

```ruby
gem 'omniauth-scaffold'
gem 'omniauth-twitter'
#gem 'omniauth-github'
#gem 'omniauth-facebook'
```

Execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-scaffold

## Usage

Generate omniauth scaffold:

    $ rails g omniauth:scaffold

Edit: config/initializers/constants.rb

```ruby
APP_NAME = "YOUR_APP_NAME"
```

Twitter: https://dev.twitter.com/apps/new  
GitHub: https://github.com/account/applications/new  
Facebook: https://developers.facebook.com/apps  

[ Development ]  
Edit: config/initializers/local_setting.rb

```ruby
# Twitter
ENV['TWITTER_KEY'] = "YOUR_CONSUMER_KEY"
ENV['TWITTER_SECRET'] = "YOUR_CONSUMER_SECRET"

# GitHub
#ENV['GITHUB_CLIENT_ID'] = "YOUR_CLIENT_ID"
#ENV['GITHUB_SECRET'] = "YOUR_SECRET"

# Facebook
#ENV['FACEBOOK_APP_ID'] = "YOUR_APP_ID"
#ENV['FACEBOOK_APP_SECRET'] = "YOUR_APP_SECRET"
```

[ Production ]  
Edit: config/initializers/omniauth.rb

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET']
#  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Shun Matsumoto. <a href="http://creativecommons.org/licenses/by-nc-sa/2.1/jp/" target="_blank">CC BY-NC-SA 2.1</a>

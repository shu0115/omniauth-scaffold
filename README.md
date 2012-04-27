# OmniAuth Scaffold

Scaffold for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-scaffold'
gem 'omniauth-twitter'
```

And then execute:

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

[ Development ]
Edit: config/initializers/local_setting.rb

```ruby
ENV['TWITTER_KEY'] = "YOUR_CONSUMER_KEY"
ENV['TWITTER_SECRET'] = "YOUR_CONSUMER_SECRET"
```

[ Production ]
Edit: config/initializers/omniauth.rb

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Shun Matsumoto. See LICENSE.txt for
further details.

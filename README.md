# OmniAuth OAuth2 strategy for Fitbit
This gem is an OAuth2 OmniAuth Strategy for the [Fitbit API](https://wiki.fitbit.com/display/API/OAuth+2.0).

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-fitbit-oauth2'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::FitbitOauth2` is simply a Rack middleware. Read [the OmniAuth 2.0 docs](https://github.com/intridea/omniauth-oauth2) for detailed instructions.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit_oauth2, ENV['FITBIT_CLIENT_ID'], ENV['FITBIT_CLIENT_SECRET']
end
```

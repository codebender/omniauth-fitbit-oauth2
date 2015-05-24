# OmniAuth OAuth2 strategy for Fitbit
This gem is an OAuth2 OmniAuth Strategy for the [Fitbit API](https://wiki.fitbit.com/display/API/OAuth+2.0).

## Gem Status
[![Gem Version](https://badge.fury.io/rb/omniauth-fitbit-oauth2.svg)](http://badge.fury.io/rb/omniauth-fitbit-oauth2)
[![Build Status](https://semaphoreci.com/api/v1/projects/2fae3e5c-5bb1-4cf6-8d58-de1656ff3751/425290/shields_badge.svg)](https://semaphoreci.com/codebender/omniauth-fitbit-oauth2)

## Fitbit Beta Notice
:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:

*This feature is in a beta state.
During this period, Fitbit may need to make backwards incompatible changes with less than 30 days notice. Fitbit does NOT recommend using OAuth 2.0 in a production environment yet.
With your help testing, we hope to resolve any issues over the next few months. When we believe it is production ready, we will update this post.*

:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:

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

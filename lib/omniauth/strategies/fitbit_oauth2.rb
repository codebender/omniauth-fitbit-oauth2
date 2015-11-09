require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class FitbitOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'fitbit_oauth2'

      option :client_options,
        {
          :site           => 'https://api.fitbit.com',
          :authorize_url  => 'https://www.fitbit.com/oauth2/authorize',
          :token_url      => 'https://api.fitbit.com/oauth2/token'
        }

      option :authorize_options, [:scope, :response_type, :expires_in, :prompt]
      option :response_type, 'code'

      def build_access_token
        options.token_params.merge!(:headers =>
          {'Authorization' => basic_auth_header})
        super
      end

      def basic_auth_header
        'Basic ' + Base64.encode64(options[:client_id] + ':' +
          options[:client_secret]).gsub("\n", '')
      end

      def query_string
        '' # The state and code params shouldn't be sent as part of the callback_url in the callback phase
      end

      uid do
        raw_info['user']['encodedId']
      end

      info do
        {
          :name         => raw_info['user']['displayName'],
          :full_name    => raw_info['user']['fullName'],
          :display_name => raw_info['user']['displayName'],
          :nickname     => raw_info['user']['nickname'],
          :gender       => raw_info['user']['gender'],
          :about_me     => raw_info['user']['aboutMe'],
          :city         => raw_info['user']['city'],
          :state        => raw_info['user']['state'],
          :country      => raw_info['user']['country'],
          :dob          => !raw_info['user']['dateOfBirth'].empty? ? Date.strptime(raw_info['user']['dateOfBirth'], '%Y-%m-%d'):nil,
          :member_since => Date.strptime(raw_info['user']['memberSince'], '%Y-%m-%d'),
          :locale       => raw_info['user']['locale'],
          :timezone     => raw_info['user']['timezone']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        if options[:use_english_measure] == 'true'
          @raw_info ||= MultiJson.load(access_token.
            request('get', 'https://api.fitbit.com/1/user/-/profile.json',
              { 'Accept-Language' => 'en_US' }).body)
        else
          @raw_info ||= MultiJson.load(access_token.
            get('https://api.fitbit.com/1/user/-/profile.json').body)
        end
      end
    end
  end
end

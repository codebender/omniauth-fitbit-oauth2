require 'spec_helper'

describe "OmniAuth::Strategies::FitbitOauth2" do
  subject do
    OmniAuth::Strategies::FitbitOauth2.new(nil, @options || {})
  end

  context 'client options' do
    it 'has correct API site' do
      expect(subject.options.client_options.site).
        to eq('https://api.fitbit.com')
    end

    it 'has correct token url' do
      expect(subject.options.client_options.token_url).
        to eq('https://api.fitbit.com/oauth2/token')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).
        to  eq('https://www.fitbit.com/oauth2/authorize')
    end
  end
end

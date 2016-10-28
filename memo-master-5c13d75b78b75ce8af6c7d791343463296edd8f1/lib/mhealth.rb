# lib/mhealth.rb
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Mhealth < OmniAuth::Strategies::OAuth2
      option :mhealth, 'mhealth-labs'
      option :client_options, {
        site:          'http://labs-login.uphs.upenn.edu',
        authorize_url: 'http://labs-login.uphs.upenn.edu/oauth/authorize'
      }

      uid {
        raw_info['id']
      }

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/user_info').parsed
      end
    end
  end
end

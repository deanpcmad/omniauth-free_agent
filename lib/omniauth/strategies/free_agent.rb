# frozen_string_literal: true

require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class FreeAgent < OmniAuth::Strategies::OAuth2
      option :name, "free_agent"

      option :client_options, {
        site: "https://api.freeagent.com",
        authorize_url: "https://api.freeagent.com/v2/approve_app",
        token_url: "https://api.freeagent.com/v2/token_endpoint",
      }

      uid do
        user_info["url"]
      end

      info do
        {
          email: user_info["email"],
          first_name: user_info["first_name"],
          last_name: user_info["last_name"],
        }
      end

      extra do
        {
          user: user_info,
          company: company_info
        }
      end

      def user_info
        @user_info ||= access_token.get("/v2/users/me").parsed["user"]
      end

      def company_info
        @company_info ||= access_token.get("/v2/company").parsed
      end

      def callback_url
        options[:redirect_uri] || full_host + script_name + callback_path
      end
    end
  end
end

# OmniAuth.config.add_camelization "freeagent", "FreeAgent"

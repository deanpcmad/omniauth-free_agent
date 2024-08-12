# frozen_string_literal: true

require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class FreeAgentSandbox < OmniAuth::Strategies::FreeAgent

      option :name, "free_agent_sandbox"

      option :client_options, {
        site: "https://api.sandbox.freeagent.com",
        authorize_url: "https://api.sandbox.freeagent.com/v2/approve_app",
        token_url: "https://api.sandbox.freeagent.com/v2/token_endpoint",
      }

    end
  end
end

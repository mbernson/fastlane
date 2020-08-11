require_relative '../client'

module Spaceship
  class ConnectAPI
    module TestFlight
      class Client < Spaceship::ConnectAPI::APIClient
        def initialize(cookie: nil, current_team_id: nil, token: nil, another_client: nil)
          another_client ||= Spaceship::Tunes.client

          super(cookie: cookie, current_team_id: current_team_id, token: token, another_client: another_client)

          self.extend(Spaceship::ConnectAPI::TestFlight::API)
          self.test_flight_request_client = self
        end

        def self.hostname
          'https://appstoreconnect.apple.com/iris/v1/'
        end
      end
    end
  end
end

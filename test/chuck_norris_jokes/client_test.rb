# frozen_string_literal: true

require "test_helper"

module ChuckNorrisJokes
  class ClientTest < Minitest::Test
    def test_get_a_random_phrase
      VCR.use_cassette("get_random_phrase") do
        client = Client.new("https://api.chucknorris.io/jokes/random")
        assert_instance_of Hash, client.get_random_phrase
      end
    end
  end
end

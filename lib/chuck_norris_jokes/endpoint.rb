# frozen_string_literal: true

module ChuckNorrisJokes
  class Endpoint
    CATEGORIES = %w[animal career celebrity dev explicit fashion
                    food history money movie music political
                    religion science sport travel].freeze

    def initialize
      @client = Client.new("https://api.chucknorris.io/jokes/random?category=")
    end

    def all_categories
      res = []
      CATEGORIES.map do |category|
        Thread.new do
          res << client.get_by_categories(category)[:value]
        end.join
      end
      res
    end

    private

    attr_reader :client
  end
end

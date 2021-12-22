module ChuckNorrisJokes
  class Endpoint
    CATEGORIES = ["animal","career","celebrity","dev","explicit","fashion",
                  "food","history","money","movie","music","political",
                  "religion","science","sport","travel"].freeze

    def initialize
      @client = Client.new('https://api.chucknorris.io/jokes/random?category=')
    end

    def all_categories
      CATEGORIES.map do |category|
        Thread.new do
          client.get_by_categories(category)[:value]
        end
      end
    end
    
    def get_values_by_category
      all_categories.map(&:join)
    end

    private

    attr_reader :client
  end
end

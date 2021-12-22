module ChuckNorrisJokes
  class Search
    def initialize
      @query = Client.new('https://api.chucknorris.io/jokes/search?query=')
    end

    def search_by_query(phrase)
      query.get_by_categories(phrase)
    end

    private

    attr_reader :query
  end
end

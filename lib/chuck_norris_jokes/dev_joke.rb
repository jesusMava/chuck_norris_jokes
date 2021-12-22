
module ChuckNorrisJokes
  class DevJoke < Endpoint
    def dev_joke
      client.get_by_categories('dev')
    end
  end
end

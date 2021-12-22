# frozen_string_literal: true

require "net/http"
require "json"
require_relative "chuck_norris_jokes/version"
require_relative "chuck_norris_jokes/endpoint"
require_relative "chuck_norris_jokes/search"
require_relative "chuck_norris_jokes/dev_joke"
require_relative "chuck_norris_jokes/client"
require_relative "chuck_norris_jokes/all_categories"

module ChuckNorrisJokes
  class Error < StandardError; end

  def self.get_random_phrase
    Client.new("https://api.chucknorris.io/jokes/random").get_random_phrase
  end

  def self.get_all_categories
    AllCategories.new.all_categories
  end

  def self.dev_joke
    DevJoke.new.dev_joke
  end

  def self.search_by_word(word = "hello")
    Search.new.search_by_query(word)
  end
end

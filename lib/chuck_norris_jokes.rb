# frozen_string_literal: true

require 'net/http'
require 'json'
require_relative "chuck_norris_jokes/version"
require_relative "chuck_norris_jokes/endpoint"
require_relative "chuck_norris_jokes/search"
require_relative "chuck_norris_jokes/dev_joke"
require_relative "chuck_norris_jokes/client"
require_relative "chuck_norris_jokes/all_categories.rb"

module ChuckNorrisJokes
  class Error < StandardError; end

  def self.get_random_phrase
    Client.new('https://api.chucknorris.io/jokes/random').get_random_phrase[:value]
  end

  def self.get_all_categories
    AllCategories.new.get_values_by_category
  end

  def self.get_dev_joke
    Search.new.search_by_query('hello')
  end
end

ChuckNorrisJokes::get_dev_joke

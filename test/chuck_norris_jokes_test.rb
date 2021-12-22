# frozen_string_literal: true

require "test_helper"

class ChuckNorrisJokesTest < Minitest::Test
  def test_random_phrase
    VCR.use_cassette("random_phrase") do
      phrase = ChuckNorrisJokes.get_random_phrase
      assert_instance_of Hash, phrase
      assert_instance_of String, phrase[:value]
    end
  end

  def test_all_categories
    VCR.use_cassette("categories") do
      phrase = ChuckNorrisJokes.get_all_categories
      assert_instance_of Hash, phrase
      assert_instance_of String, phrase.first
    end
  end

  def test_dev_joke
    VCR.use_cassette("dev_joke") do
      phrase = ChuckNorrisJokes.dev_joke
      assert_instance_of Hash, phrase
    end
  end

  def test_search_by_word
    VCR.use_cassette("search_by_word") do
      search = ChuckNorrisJokes.search_by_word
      assert_instance_of Hash, search
    end
  end
end

# frozen_string_literal: true

module ChuckNorrisJokes
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get_random_phrase
      uri = URI(base_url)
      res = Net::HTTP.get_response(uri)
      parse_json(res.body)
    end

    def get_by_categories(path)
      request(path) do |uri|
        Net::HTTP::Get.new uri
      end
    end

    private

    attr_reader :base_url

    def request(path)
      uri = URI("#{base_url}#{path}")

      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = yield(uri)
        handle(http.request(request))
      end
    end

    def handle(request)
      case request
      when Net::HTTPSuccess
        parse_json(request.body)
      when Net::HTTPClientError
        raise ClientError, "[#{request.code}]#{request.class}"
      when Net::HTTPServerError
        raise ServerError, "[#{request.code}]#{request.class}"
      end
    end

    def parse_json(content)
      JSON.parse(content, symbolize_names: true)
    rescue JSON::ParserError
      nil
    end
  end
end

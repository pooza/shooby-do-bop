require 'addressable/uri'
require 'httparty'
require 'json'

module ShoobyDoBop
  class Mastodon
    def initialize(params = nil)
      @config = Config.instance
      params ||= {'url' => @config['/mastodon/url'], 'token' => @config['/mastodon/token']}
      @params = params.clone
    end

    def toot(text, options = {})
      values = options.clone
      values[:status] = text
      return HTTParty.post(create_uri, {
        body: values.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'User-Agent' => Package.user_agent,
          'Authorization' => "Bearer #{@params['token']}",
          'X-Mulukhiya' => Package.full_name,
        },
      })
    end

    def create_uri(href = '/api/v1/statuses')
      uri = Addressable::URI.parse(@params['url'])
      uri.path = href
      return uri
    end

    def self.create_tag(word)
      return '#' + word.strip.gsub(/[^[:alnum:]]+/, '_').sub(/^_/, '').sub(/_$/, '')
    end
  end
end

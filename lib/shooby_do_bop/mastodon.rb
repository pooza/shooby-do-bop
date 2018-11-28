require 'addressable/uri'
require 'httparty'
require 'json'

module ShoobyDoBop
  class Mastodon
    def initialize(params)
      @params = params.clone
    end

    def toot(text, options = {})
      values = options.clone
      values[:status] = text
      return HTTParty.post(create_uri('/api/v1/statuses'), {
        body: values.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'User-Agent' => Package.user_agent,
          'Authorization' => "Bearer #{@params['token']}",
          'X-Mulukhiya' => Package.full_name,
        },
        ssl_ca_file: ENV['SSL_CERT_FILE'],
      })
    end

    def create_uri(href)
      uri = Addressable::URI.parse(@params['url'])
      uri.path = href
      return uri
    end

    def self.create_tag(word)
      return '#' + word.strip.gsub(/[^[:alnum:]]+/, '_').sub(/^_/, '').sub(/_$/, '')
    end
  end
end

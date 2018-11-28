require 'addressable/uri'
require 'httparty'

module ShoobyDoBop
  class VideoURI < Addressable::URI
    def initialize(options = {})
      super(options)
      @config = Config.instance
    end

    def id
      return query_values['v']
    rescue
      return nil
    end

    def data
      unless @data
        uri = Addressable::URI.parse(@config['/youtube/urls/videos'])
        uri.query_values = {
          'part' => 'statistics',
          'key' => @config['/google/api/key'],
          'id' => id,
        }
        @data = HTTParty.get(uri, {
          headers: {
            'User-Agent' => Package.user_agent,
          },
        }).to_h
      end
      return @data
    end

    def count
      return nil unless item = data['items'].first
      return item['statistics']['viewCount'].to_i
    end
  end
end

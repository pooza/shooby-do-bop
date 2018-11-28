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
          'part' => 'snippet,statistics',
          'key' => @config['/google/api/key'],
          'id' => id,
        }
        result = HTTParty.get(uri, {
          headers: {
            'User-Agent' => Package.user_agent,
          },
        }).to_h
        @data = result['items'].first if result['items'].present?
      end
      return @data
    end

    def title
      return nil unless data
      return data['snippet']['title']
    end

    def count
      return nil unless data
      return data['statistics']['viewCount'].to_i
    end

    def goal
      return @config['/goal'].to_i
    end

    def remining
      return goal - count
    end
  end
end

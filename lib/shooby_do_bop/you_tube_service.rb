require 'httparty'

module ShoobyDoBop
  class YouTubeService
    def initialize
      @config = Config.instance
    end

    def lookup_video(id)
      uri = create_uri('videos')
      uri.query_values = {
        'part' => 'snippet,statistics',
        'key' => api_key,
        'id' => id,
      }
      response = HTTParty.get(uri, {
        headers: {'User-Agent' => Package.user_agent},
      }).to_h
      return nil unless response['items'].present?
      return response['items'].first
    rescue => e
      raise ExternalServiceError, "動画#{id}の情報が取得できません。(#{e.message})"
    end

    def create_uri(type)
      return Addressable::URI.parse(@config["/youtube/urls/#{type}"])
    end

    def api_key
      return @config['/google/api/key']
    end
  end
end

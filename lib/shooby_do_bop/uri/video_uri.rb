require 'addressable/uri'

module ShoobyDoBop
  class VideoURI < Addressable::URI
    def initialize(options = {})
      super(options)
      @config = Config.instance
      @service = YouTubeService.new
    end

    def id
      return query_values['v']
    rescue
      return nil
    end

    def data
      @data ||= @service.lookup_video(id)
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

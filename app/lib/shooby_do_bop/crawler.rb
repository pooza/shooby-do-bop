module ShoobyDoBop
  class Crawler
    attr_reader :params

    def initialize(params)
      @params = params.key_flatten
      @config = Config.instance
    end

    def crawl
      puts body
    end

    def body
      template = Template.new('toot')
      template[:crawler] = self
      return template.to_s
    end

    def video_uri
      @video_uri ||= VideoURI.parse(@params['/video/url'])
      return @video_uri
    end

    def goal
      return @params['/goal'] || 10_000_000
    end

    def count
      return video_uri.count
    end

    def remining
      return goal - count
    end

    def self.crawl_all
      all(&:crawl)
    end

    def self.all
      return enum_for(__method__) unless block_given?
      Config.instance['/entries'].each do |entry|
        yield Crawler.new(entry)
      end
    end
  end
end

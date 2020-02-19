module ShoobyDoBop
  class Crawler
    attr_reader :params

    def initialize(params)
      @params = params.flatten
      @config = Config.instance
      @logger = Logger.new
    end

    def crawl
      Slack.new(hook_uri).say(body, :text)
      @logger.info(params)
    rescue => e
      e = Ginseng::Error.create(e)
      e.package = Package.full_name
      Slack.broadcast(e.to_h)
      @logger.error(e.to_h)
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

    def hook_uri
      @hook_uri ||= Ginseng::URI.parse(@params['/hook'])
      return @hook_uri
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

    def tags
      return @params['/tags'] || []
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

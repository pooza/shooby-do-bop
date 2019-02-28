module ShoobyDoBop
  class Crawler
    def initialize
      @config = Config.instance
      @logger = Logger.new
    end

    def crawl
      @logger.info({message: 'start', version: Package.version})
      response = Mastodon.new(@config['/mastodon/url'], @config['/mastodon/token']).toot(body)
      raise Ginseng::GatewayError, "status: #{r.code}" if 400 <= response.code
      @logger.info({message: 'complete', version: Package.version})
    rescue => e
      e = Ginseng::Error.create(e)
      Slack.broadcast(e.to_h)
      @logger.error({class: e.class, message: e.message, version: Package.version})
      exit 1
    end

    def body
      template = Template.new('toot')
      template[:video_uri] = video_uri
      template[:tags] = @config['/hashtags']
      return template.to_s
    end

    def video_uri
      @video_uri ||= VideoURI.parse(@config['/video/url'])
      return @video_uri
    end
  end
end

# https://qiita.com/acairojuni/items/1055c2f27cbd99e67fc2
class Integer
  def commaize
    return to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
  end
end

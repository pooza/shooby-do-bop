require 'optparse'

module ShoobyDoBop
  class Standalone
    def initialize
      @config = Config.instance
      @logger = Logger.new
    end

    def execute
      @logger.info({message: 'start', version: Package.version})
      mastodon = Mastodon.new({
        'url' => @config['/mastodon/url'],
        'token' => @config['/mastodon/token'],
      })
      response = mastodon.toot(body)
      raise ExternalServiceError, "status: #{r.code}" if 400 <= response.code
    rescue => e
      e = Error.create(e)
      Slack.broadcast(e.to_h)
      @logger.error({class: e.class, message: e.message, version: Package.version})
      exit 1
    ensure
      @logger.info({message: 'complete', version: Package.version})
    end

    def body
      return [
        Time.now.strftime('%Y/%m/%d %H:%M'),
        video_uri.to_s,
        "現在の再生回数は、 #{video_uri.count.jpy_comma}回",
        "(あと #{video_uri.remining.jpy_comma}回)",
      ].push(@config['/hashtags'].map{ |word| Mastodon.create_tag(word)}.join(' ')).join("\n")
    end

    def video_uri
      @video_uri ||= VideoURI.parse(@config['/video/url'])
      return @video_uri
    end
  end
end

class Integer
  def jpy_comma
    return to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
  end
end

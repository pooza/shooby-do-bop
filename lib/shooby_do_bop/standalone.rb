module ShoobyDoBop
  class Standalone
    def initialize
      @config = Config.instance
      @logger = Logger.new
    end

    def execute
      @logger.info({message: 'start', version: Package.version})
      response = Mastodon.new.toot(body)
      raise ExternalServiceError, "status: #{r.code}" if 400 <= response.code
      @logger.info({message: 'complete', version: Package.version})
    rescue => e
      e = Error.create(e)
      Slack.broadcast(e.to_h)
      @logger.error({class: e.class, message: e.message, version: Package.version})
      exit 1
    end

    def body
      body = [
        Time.now.strftime('%Y/%m/%d %H:%M'),
        video_uri.to_s,
        "現在の再生回数は #{video_uri.count.jpy_comma}回",
      ]
      body.push("(あと #{video_uri.remining.jpy_comma}回)") if video_uri.remining.positive?
      body.push(@config['/hashtags'].map{ |word| Mastodon.create_tag(word)}.join(' '))
      return body.join("\n")
    end

    def video_uri
      @video_uri ||= VideoURI.parse(@config['/video/url'])
      return @video_uri
    end
  end
end

# https://qiita.com/acairojuni/items/1055c2f27cbd99e67fc2
class Integer
  def jpy_comma
    return to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
  end
end

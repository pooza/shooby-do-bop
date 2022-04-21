module ShoobyDoBop
  class Crawler
    include Package

    def exec
      puts body
    end

    def body
      template = Template.new('toot')
      template[:crawler] = self
      return template.to_s
    end

    def uri
      @uri ||= VideoURI.parse(@params['/video/url'])
      return @uri
    end

    def key
      return @params['/key']
    end

    def goal
      return @params['/goal'] || 10_000_000
    end

    def count
      return uri.count
    end

    def remining
      return goal - count
    end

    def self.create(key)
      return all.find {|crawler| key == crawler.key}
    end

    def self.all
      return enum_for(__method__) unless block_given?
      config['/entries'].each do |v|
        yield Crawler.new(v)
      end
    end

    private

    def initialize(params)
      @params = params.key_flatten
    end
  end
end

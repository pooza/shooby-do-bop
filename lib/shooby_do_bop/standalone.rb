require 'optparse'
require 'addressable/uri'

module ShoobyDoBop
  class Standalone
    def initialize
      @config = Config.instance
      @logger = Logger.new
    rescue => e
      puts "#{e.class} #{e.message}"
      exit 1
    end

    def execute
      @logger.info({message: 'start', version: Package.version})
    ensure
      @logger.info({message: 'complete', version: Package.version})
    end
    def movie_url
      @movie_url ||= Addressable::URI.parse(@config['/movie/url'])
    end
  end
end

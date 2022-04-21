module ShoobyDoBop
  module Package
    def environment_class
      return Environment
    end

    def package_class
      return Package
    end

    def config_class
      return Config
    end

    def config
      return Config.instance
    end

    def logger_class
      return Ginseng::Logger
    end

    def logger
      return Ginseng::Logger.new
    end

    def http_class
      return HTTP
    end

    def you_tube_service_class
      return YouTubeService
    end

    def self.name
      return 'shooby-do-bop'
    end

    def self.version
      return Config.instance['/package/version']
    end

    def self.url
      return Config.instance['/package/url']
    end

    def self.full_name
      return "#{name} #{version}"
    end

    def self.user_agent
      return "#{name}/#{version} (#{url})"
    end

    def self.included(base)
      base.extend(Methods)
    end

    module Methods
      def config
        return Config.instance
      end

      def logger
        return Ginseng::Logger.new
      end
    end
  end
end

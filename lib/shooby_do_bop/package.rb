module ShoobyDoBop
  module Package
    def environment_class
      return 'ShoobyDoBop::Environment'
    end

    def package_class
      return 'ShoobyDoBop::Package'
    end

    def config_class
      return 'ShoobyDoBop::Config'
    end

    def logger_class
      return 'ShoobyDoBop::Logger'
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
  end
end

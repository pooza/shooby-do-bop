require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies/autoload'

module ShoobyDoBop
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :Environment
  autoload :Error
  autoload :Logger
  autoload :Mastodon
  autoload :Package
  autoload :Slack
  autoload :Standalone

  autoload_under 'error' do
    autoload :ConfigError
    autoload :ExternalServiceError
    autoload :ImprementError
  end

  autoload :MovieURI, 'shooby_do_bop/uri/movie_uri'
end

require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies/autoload'
require 'ginseng'

module ShoobyDoBop
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :Crawler
  autoload :Environment
  autoload :HTTP
  autoload :Logger
  autoload :Package
  autoload :Slack
  autoload :Template
  autoload :YouTubeService

  autoload_under 'uri' do
    autoload :VideoURI
  end
end
